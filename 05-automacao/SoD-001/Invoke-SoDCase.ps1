[CmdletBinding()]
param(
    [ValidateSet('Antes', 'Depois')][string]$Etapa = 'Antes',
    [string]$PastaEntrada = $PSScriptRoot,
    [Parameter(Mandatory = $true)][string]$PastaSaida,
    [string]$DataCenario = '2026-09-29'
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Read-RequiredFile([string]$Name) {
    $path = Join-Path $PastaEntrada $Name
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Entrada ausente: $Name" }
    $text = Get-Content -LiteralPath $path -Raw -Encoding UTF8
    if ([string]::IsNullOrWhiteSpace($text)) { throw "Entrada vazia: $Name" }
    return $text
}
function Require-Fields($Value, [string[]]$Fields, [string]$Name) {
    foreach ($field in $Fields) {
        if ($field -notin $Value.PSObject.Properties.Name -or
            [string]::IsNullOrWhiteSpace([string]$Value.$field)) { throw "Campo ausente: $Name/$field" }
    }
}
function Encode($Value) { return [System.Net.WebUtility]::HtmlEncode([string]$Value) }

# The scenario date is fictional; it is never used as an execution timestamp.
$scenarioDate = [datetime]::ParseExact($DataCenario, 'yyyy-MM-dd', [cultureinfo]::InvariantCulture)
$rule = (Read-RequiredFile 'regra.json') | ConvertFrom-Json
$decision = (Read-RequiredFile 'decisao.json') | ConvertFrom-Json
$rows = @((Read-RequiredFile 'acessos.csv') | ConvertFrom-Csv)
Require-Fields $rule @('id','processo','direito_a','direito_b','descricao_a','descricao_b','condicao') 'regra'
Require-Fields $decision @('regra_id','employee_id','escopo','responsavel_simulado','retirar','manter','justificativa') 'decisao'
if ($rows.Count -eq 0) { throw 'Nenhum acesso informado; ausencia de dados nao significa ausencia de conflito.' }
if ($rule.direito_a -eq $rule.direito_b) { throw 'A regra precisa de dois direitos distintos.' }
if ($decision.regra_id -ne $rule.id -or $decision.escopo -ne $rule.processo -or
    $decision.retirar -ne $rule.direito_a -or $decision.manter -ne $rule.direito_b) {
    throw 'Decisao incompativel com a regra deste microcaso.'
}
$keys = @{}
foreach ($row in $rows) {
    Require-Fields $row @('employee_id','nome','escopo','direito') 'acessos'
    if ($row.employee_id -ne $decision.employee_id -or $row.escopo -ne $decision.escopo) {
        throw 'Este relatorio avalia somente a pessoa e o escopo da decisao; nao misture cenarios.'
    }
    if ($row.direito -notin @($rule.direito_a, $rule.direito_b)) { throw 'Direito fora da regra delimitada.' }
    $key = '{0}|{1}|{2}' -f $row.employee_id, $row.escopo, $row.direito
    if ($keys.ContainsKey($key)) { throw 'Associacao duplicada na entrada.' }
    $keys[$key] = $true
}
if (@($rows.nome | Select-Object -Unique).Count -ne 1) { throw 'Nomes inconsistentes para a mesma matricula.' }

$before = @($rows.direito | Sort-Object -Unique)
$after = @($before)
$wasConflict = ($before -contains $rule.direito_a) -and ($before -contains $rule.direito_b)
if ($Etapa -eq 'Depois') {
    if (-not $wasConflict) { throw 'Nao ha conflito A+B para tratar neste microcaso.' }
    $after = @($before | Where-Object { $_ -ne $decision.retirar })
    if ($after -notcontains $decision.manter) { throw 'O direito aprovado nao foi preservado.' }
}
$conflict = ($after -contains $rule.direito_a) -and ($after -contains $rule.direito_b)
$result = if ($conflict) { 'CONFLITO' } else { 'SEM_CONFLITO' }
$report = [pscustomobject][ordered]@{
    Tipo = 'DEMONSTRACAO LOCAL REFEITA; nao e captura historica de 29/09'
    DataFicticiaCenario = $DataCenario
    Etapa = $Etapa
    Regra = $rule.id
    Condicao = $rule.condicao
    Pessoa = $rows[0].nome
    Matricula = $decision.employee_id
    Escopo = $decision.escopo
    DireitosAntes = $before
    DecisaoAplicadaNoModelo = if ($Etapa -eq 'Depois') { $decision } else { $null }
    DireitosAvaliados = $after
    Resultado = $result
    Conflitos = [int]$conflict
    Limite = 'Somente dados ficticios locais; nao altera AD, Entra ou ERP. Sem conflito nao comprova necessidade de acesso.'
}

$template = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'relatorio.html') -Raw -Encoding UTF8
$replacements = @{
    '@@ETAPA@@' = Encode $Etapa
    '@@RESULTADO@@' = Encode $result
    '@@STATUS@@' = if ($conflict) { 'conflito' } else { 'conforme' }
    '@@PESSOA@@' = Encode $report.Pessoa
    '@@MATRICULA@@' = Encode $report.Matricula
    '@@ESCOPO@@' = Encode $report.Escopo
    '@@DATA@@' = Encode ($scenarioDate.ToString('dd/MM/yyyy'))
    '@@REGRA@@' = Encode $rule.id
    '@@CONDICAO@@' = Encode $rule.condicao
    '@@DIREITOA@@' = Encode $rule.direito_a
    '@@DESCRICAOA@@' = Encode $rule.descricao_a
    '@@DIREITOB@@' = Encode $rule.direito_b
    '@@DESCRICAOB@@' = Encode $rule.descricao_b
    '@@ESTADOA@@' = if ($after -contains $rule.direito_a) { 'PRESENTE' } elseif ($Etapa -eq 'Depois') { 'RETIRADO NO MODELO' } else { 'AUSENTE' }
    '@@ESTADOB@@' = if ($after -contains $rule.direito_b) { 'PRESENTE' } else { 'AUSENTE' }
    '@@EXPLICACAO@@' = if ($conflict) { 'A mesma pessoa acumula os dois direitos no mesmo escopo. A regra pro&iacute;be essa combina&ccedil;&atilde;o.' } else { 'A combina&ccedil;&atilde;o proibida n&atilde;o est&aacute; presente nos direitos avaliados.' }
    '@@DECISAO@@' = if ($Etapa -eq 'Depois') {
        'Decis&atilde;o simulada de ' + (Encode $decision.responsavel_simulado) + ': manter ' + (Encode $decision.manter) + ' e retirar ' + (Encode $decision.retirar) + '. ' + (Encode $decision.justificativa)
    } else { 'Etapa de detec&ccedil;&atilde;o: nenhuma retirada aplicada. A decis&atilde;o &eacute; aplicada na demonstra&ccedil;&atilde;o Depois.' }
}
foreach ($key in $replacements.Keys) { $template = $template.Replace($key, [string]$replacements[$key]) }
if ($template -match '@@[A-Z]+@@') { throw 'Relatorio com campo nao preenchido.' }

$out = [System.IO.Path]::GetFullPath($PastaSaida)
[void][System.IO.Directory]::CreateDirectory($out)
$name = $Etapa.ToLowerInvariant()
$utf8 = New-Object System.Text.UTF8Encoding($false)
$reportJson = ($report | ConvertTo-Json -Depth 8) -replace '\r\n', [char]10
$reportHtml = $template -replace '\r\n', [char]10
[System.IO.File]::WriteAllText((Join-Path $out "$name.json"), $reportJson, $utf8)
[System.IO.File]::WriteAllText((Join-Path $out "$name.html"), $reportHtml, $utf8)
Write-Output "DEMONSTRACAO LOCAL REFEITA - Data ficticia do cenario: $DataCenario"
Write-Output "Regra $($rule.id): $($rule.condicao)"
Write-Output "Pessoa: $($report.Pessoa) | $($report.Matricula) | $($report.Escopo)"
Write-Output "Etapa: $Etapa | Direitos: $($after -join ' + ') | Resultado: $result"
Write-Output "Relatorio HTML e JSON: $out"
Write-Output $report.Limite
