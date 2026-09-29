# Consulta o AD do laboratorio e grava arquivos locais; nao altera o diretorio.
# Executar na VM DC01. CSVs integrais devem permanecer privados.
[CmdletBinding()]
param([string]$OutputRoot = [Environment]::GetFolderPath('Desktop'))
$ErrorActionPreference = 'Stop'
Import-Module ActiveDirectory -ErrorAction Stop
if ([string]::IsNullOrWhiteSpace($OutputRoot) -or !(Test-Path -LiteralPath $OutputRoot -PathType Container)) {
    throw 'Informe uma pasta local existente em -OutputRoot.'
}
$inicio = Get-Date
$dominio = Get-ADDomain -ErrorAction Stop
$servidor = $dominio.PDCEmulator
$destino = Join-Path $OutputRoot ('revisao-final-' + $inicio.ToString('yyyyMMdd-HHmmss'))
if (Test-Path -LiteralPath $destino) { throw 'Pasta de saida ja existe; nao sobrescrever.' }
New-Item -Path $destino -ItemType Directory -ErrorAction Stop | Out-Null
# Se falhar antes do manifesto, a coleta e incompleta: nao usar como resultado conforme.
$usuarios = @(Get-ADUser -Filter * -Server $servidor -Properties EmployeeID,Department,Title,AccountExpirationDate,UserPrincipalName,PrimaryGroupID |
    Select-Object SamAccountName,ObjectGUID,EmployeeID,Enabled,Department,Title,UserPrincipalName,PrimaryGroupID,
        @{Name='AccountExpirationDate';Expression={if ($_.AccountExpirationDate) {$_.AccountExpirationDate.ToString('o')} else {$null}}},DistinguishedName)
$grupos = @(Get-ADGroup -Filter 'Name -like "GG_*" -or Name -like "DL_*"' -Server $servidor |
    Sort-Object Name)
$resumoGrupos = @()
$associacoes = @(foreach ($grupo in $grupos) {
    $membros = @(Get-ADGroupMember -Identity $grupo.ObjectGUID -Server $servidor -ErrorAction Stop)
    $resumoGrupos += [pscustomobject]@{
        Name=$grupo.Name;SamAccountName=$grupo.SamAccountName;ObjectGUID=$grupo.ObjectGUID
        GroupScope=[string]$grupo.GroupScope;GroupCategory=[string]$grupo.GroupCategory
        DistinguishedName=$grupo.DistinguishedName;TotalMembrosDiretos=$membros.Count
    }
    foreach ($membro in $membros) {
        [pscustomobject]@{
            Grupo=$grupo.Name;GrupoGUID=$grupo.ObjectGUID;Membro=$membro.SamAccountName
            MembroGUID=$membro.ObjectGUID;TipoMembro=$membro.ObjectClass
        }
    }
})
$usuarios | Export-Csv -LiteralPath (Join-Path $destino 'usuarios-ad.csv') -NoTypeInformation -Encoding UTF8
if ($resumoGrupos.Count -gt 0) {
    $resumoGrupos | Export-Csv -LiteralPath (Join-Path $destino 'grupos-ad.csv') -NoTypeInformation -Encoding UTF8
} else {
    '"Name","SamAccountName","ObjectGUID","GroupScope","GroupCategory","DistinguishedName","TotalMembrosDiretos"' | Set-Content -LiteralPath (Join-Path $destino 'grupos-ad.csv') -Encoding UTF8
}
if ($associacoes.Count -gt 0) {
    $associacoes | Export-Csv -LiteralPath (Join-Path $destino 'associacoes-ad.csv') -NoTypeInformation -Encoding UTF8
} else {
    '"Grupo","GrupoGUID","Membro","MembroGUID","TipoMembro"' | Set-Content -LiteralPath (Join-Path $destino 'associacoes-ad.csv') -Encoding UTF8
}
$tarefa = Get-ScheduledTask -TaskName 'IAM-005-Relatorio-Financeiro' -ErrorAction Stop |
    Select-Object TaskName,TaskPath,@{Name='State';Expression={[string]$_.State}}
$tarefa | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $destino 'tarefa-servico.json') -Encoding UTF8
$fim = Get-Date
$hashes = @(Get-ChildItem -LiteralPath $destino -File | Get-FileHash -Algorithm SHA256 |
    Select-Object @{Name='Arquivo';Expression={Split-Path $_.Path -Leaf}},Hash)
[pscustomobject]@{
    ColetaCompleta=$true;Inicio=$inicio.ToString('o');Fim=$fim.ToString('o')
    Fuso=[TimeZoneInfo]::Local.Id;Servidor=$servidor;Dominio=$dominio.DNSRoot
    Usuarios=$usuarios.Count;Grupos=$grupos.Count;AssociacoesDiretas=$associacoes.Count
    Escopo='Todas as contas AD; grupos com prefixo GG_ ou DL_; membros diretos; tarefa IAM-005'
    Limites='Sem ACLs, sessoes, politicas ou grupos fora dos prefixos; grupo primario nao e listado em Get-ADGroupMember; nao calcula conformidade'
    Arquivos=$hashes
} | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $destino 'manifesto.json') -Encoding UTF8
Write-Output ('Horario: ' + $fim.ToString('yyyy-MM-dd HH:mm:ss zzz'))
Write-Output ('Arquivos: ' + $destino)
$resumoGrupos | Format-Table Name,GroupScope,TotalMembrosDiretos -AutoSize
$tarefa | Format-Table -AutoSize
Write-Output ('Usuarios: {0}; grupos: {1}; associacoes diretas: {2}' -f $usuarios.Count,$grupos.Count,$associacoes.Count)
Write-Output 'Coleta concluida. A comparacao com RH/matriz sera feita depois; isto nao afirma zero excecoes.'
