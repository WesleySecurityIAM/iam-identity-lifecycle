<#
Ler um CSV sintético com contas e grupos.
Compara o estado atual com uma regra esperada.
Produz excecoes.csv para revisao.
Nunca adiciona ou remove acessos.
#>

$entrada = Join-Path $PSScriptRoot 'estado-final.csv'
$saida   = Join-Path $PSScriptRoot 'excecoes.csv'

$esperado = @(
    'usr_ana.silva::GG_FIN_READ'
    'usr_ana.silva::GG_VPN_USERS'
    'svc_iam_report::GG_FIN_READ'
)

try {
    $atual = Import-Csv $entrada -ErrorAction Stop |
        ForEach-Object {
            foreach ($grupo in ($_.grupos -split '\|')) {
                "$($_.conta)::$grupo"
            }
        }

    $diferencas = Compare-Object `
        -ReferenceObject $esperado `
        -DifferenceObject $atual `
        -IncludeEqual

    $acoes = $diferencas | ForEach-Object {
        $acao = switch ($_.SideIndicator) {
            '==' { 'MANTER' }
            '=>' { 'REVISAR POSSIVEL REMOCAO' }
            '<=' { 'REVISAR POSSIVEL CONCESSAO' }
        }

        [pscustomobject]@{
            Associacao = $_.InputObject
            Acao       = $acao
        }
    }

    $excecoes = $acoes |
        Where-Object { $_.Acao -ne 'MANTER' }

    $excecoes |
        Export-Csv $saida -NoTypeInformation -Encoding utf8 -ErrorAction Stop

    Write-Host "Relatorio criado: $saida"
    Write-Host "Nenhum acesso foi alterado."

    $excecoes
}
catch {
    Write-Host "Falha ao processar a reconciliacao."
    Write-Host "Nenhum acesso foi alterado."
    Write-Host "Detalhe tecnico: $($_.Exception.Message)"
}