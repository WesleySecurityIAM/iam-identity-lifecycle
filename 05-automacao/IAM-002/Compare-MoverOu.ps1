# Recorte de arquivar-bruno-final.ps1, publicado em 15/10/2026.
# Import-Csv / Compare-Object e regra de DN preservados; recorte apenas EMP0007.
# Le arquivos locais; nao consulta ou altera AD/Entra. Nao compara grupos.
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$Antes,
    [Parameter(Mandatory=$true)][string]$Depois
)
$ErrorActionPreference = 'Stop'
$campos = @('SamAccountName','ObjectGUID','EmployeeID','Enabled','Department','Title','AccountExpirationDate')
$guidEsperado = 'cc17f00e-178a-47be-91be-dab949512b83'
$dnEsperado = 'CN=Gabriela Santos,OU=Financeiro,DC=empresa,DC=lab'

function Read-Gabriela([string]$Arquivo) {
    $rows = @(Import-Csv -LiteralPath $Arquivo -Encoding UTF8)
    if (!$rows.Count) { throw 'Inventario vazio: resultado inconclusivo.' }
    foreach ($campo in ($campos + 'DistinguishedName')) {
        if ($campo -notin $rows[0].PSObject.Properties.Name) { throw "Coluna ausente: $campo" }
    }
    $pessoa = @($rows | Where-Object EmployeeID -eq 'EMP0007')
    if ($pessoa.Count -ne 1) { throw 'EMP0007 sem correspondencia unica no inventario.' }
    if ([string]::IsNullOrWhiteSpace($pessoa[0].ObjectGUID) -or
        [string]::IsNullOrWhiteSpace($pessoa[0].DistinguishedName)) {
        throw 'GUID ou DistinguishedName ausente: resultado inconclusivo.'
    }
    return $pessoa[0]
}

$before = Read-Gabriela $Antes
$after = Read-Gabriela $Depois
# Primeiro verifica o que permaneceu igual; depois compara a localizacao.
$stable = @(Compare-Object -ReferenceObject @($before) -DifferenceObject @($after) -Property $campos)
$location = @(Compare-Object -ReferenceObject @($before) -DifferenceObject @($after) -Property ObjectGUID,DistinguishedName)
$mesmaIdentidade = $before.ObjectGUID -eq $guidEsperado -and $after.ObjectGUID -eq $guidEsperado
$localConforme = $after.DistinguishedName -eq $dnEsperado
$location | Select-Object ObjectGUID,DistinguishedName,SideIndicator | Format-Table -AutoSize | Out-Host
[pscustomobject]@{
    Matricula = 'EMP0007'
    IdentidadePreservada = $mesmaIdentidade
    CadastroPreservado = ($stable.Count -eq 0)
    LocalizacaoEsperada = $dnEsperado
    LocalizacaoObservada = $after.DistinguishedName
    LocalizacaoConforme = $localConforme
} | Format-List | Out-Host
if (!$mesmaIdentidade -or $stable.Count -ne 0 -or !$localConforme) {
    throw 'Comparacao encontrou divergencia. Revisar o resultado; nenhum acesso foi alterado.'
}
