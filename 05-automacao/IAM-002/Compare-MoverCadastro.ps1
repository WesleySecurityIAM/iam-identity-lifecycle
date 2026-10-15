# Fontes e regras de 28/09/2026: recorte de conferir-coleta-2809.ps1.
# Versao de consulta limitada a EMP0007, extraida da rotina historica.
# Compara cadastro com RH; nao compara grupos, OU ou acesso efetivo.
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$Rh,
    [Parameter(Mandatory=$true)][string]$Ad,
    [Parameter(Mandatory=$true)][string]$Entra
)
$ErrorActionPreference = 'Stop'
function Read-CheckedCsv([string]$Arquivo, [string[]]$Colunas) {
    $rows = @(Import-Csv -LiteralPath $Arquivo -Encoding UTF8)
    if (!$rows.Count) { throw 'Fonte vazia: comparacao inconclusiva.' }
    foreach ($coluna in $Colunas) {
        if ($coluna -notin $rows[0].PSObject.Properties.Name) { throw "Coluna ausente: $coluna" }
    }
    return $rows
}
$rhRows = @(Read-CheckedCsv $Rh @('employee_id','status','area','cargo'))
$adRows = @(Read-CheckedCsv $Ad @('EmployeeID','Enabled','Department','Title'))
$entraRows = @(Read-CheckedCsv $Entra @('employeeId','accountEnabled','department','jobTitle'))
$person = @($rhRows | Where-Object employee_id -eq 'EMP0007')
if ($person.Count -ne 1) { throw 'Correspondencia RH nao unica: EMP0007' }
$person = $person[0]
if ($person.status -notin @('ATIVO','DESLIGADO')) { throw 'Status RH nao previsto.' }
if ($person.status -eq 'ATIVO' -and
    ([string]::IsNullOrWhiteSpace($person.area) -or [string]::IsNullOrWhiteSpace($person.cargo))) {
    throw 'RH sem departamento ou cargo esperado: comparacao inconclusiva.'
}
$results = @()
foreach ($system in @('AD','Entra')) {
    $rows = if ($system -eq 'AD') { $adRows } else { $entraRows }
    $account = @($rows | Where-Object EmployeeID -eq 'EMP0007')
    if ($account.Count -ne 1) { throw "Correspondencia nao unica em ${system}: EMP0007" }
    $account = $account[0]
    $observed = if ($system -eq 'AD') { $account.Enabled } else { $account.accountEnabled }
    $expected = $person.status -eq 'ATIVO'
    $results += [pscustomobject]@{
        Sistema=$system; Matricula='EMP0007'; Regra='Habilitacao'
        Conforme=([bool]::Parse($observed) -eq $expected)
    }
    if ($expected) {
        $title = if ($system -eq 'AD') { $account.Title } else { $account.jobTitle }
        $results += [pscustomobject]@{
            Sistema=$system; Matricula='EMP0007'; Regra='Departamento'
            Conforme=($account.Department -eq $person.area)
        }
        $results += [pscustomobject]@{
            Sistema=$system; Matricula='EMP0007'; Regra='Cargo'
            Conforme=($title -eq $person.cargo)
        }
    }
}
$results
