$ErrorActionPreference = 'Stop'

$identidade = [Security.Principal.WindowsIdentity]::GetCurrent().Name

if ($identidade -ine 'EMPRESA\svc_relatorio_fin') {
    throw "Identidade incorreta: $identidade"
}

$entrada = 'C:\IAM-Lab\Relatorios-Financeiros\relatorio-teste.txt'
$saida = 'C:\IAM-Lab\Saidas-Relatorios-Financeiros\resumo.json'
$protegido = 'C:\IAM-Lab\Scripts-Relatorios\arquivo-protegido.txt'

$resultado = [ordered]@{
    DataUTC = (Get-Date).ToUniversalTime().ToString('o')
    Identidade = $identidade
    ArquivoEntrada = $entrada
    QuantidadeLinhas = @(Get-Content -LiteralPath $entrada).Count
    LeituraEntrada = 'Permitida'
}

# Nome exclusivo: nao altera o arquivo financeiro original.
$alvoNegativo = Join-Path (Split-Path $entrada) (
    'teste-negativo-' + [guid]::NewGuid().ToString() + '.txt'
)

try {
    Set-Content -LiteralPath $alvoNegativo -Value 'Teste IAM-005'
    $resultado.EscreverEntrada = 'FALHA: escrita permitida'
}
catch {
    if ($_.CategoryInfo.Category -eq 'PermissionDenied') {
        $resultado.EscreverEntrada = 'Negada conforme esperado'
    }
    else {
        throw
    }
}

if (-not (Test-Path -LiteralPath $protegido)) {
    throw 'Arquivo protegido de teste nao encontrado.'
}

try {
    Add-Content -LiteralPath $protegido -Value 'Alteracao de teste'
    $resultado.AlterarScriptTeste = 'FALHA: alteracao permitida'
}
catch {
    if ($_.CategoryInfo.Category -eq 'PermissionDenied') {
        $resultado.AlterarScriptTeste = 'Negada conforme esperado'
    }
    else {
        throw
    }
}

$resultado |
    ConvertTo-Json |
    Set-Content -LiteralPath $saida -Encoding UTF8

if (
    $resultado.EscreverEntrada -like 'FALHA*' -or
    $resultado.AlterarScriptTeste -like 'FALHA*'
) {
    exit 1
}

exit 0