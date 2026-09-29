param(
    [Parameter(Mandatory=$true)][string]$InitialDirectory,
    [Parameter(Mandatory=$true)][string]$FinalADDirectory
)
$ErrorActionPreference = 'Stop'
# Read-only historical comparison. Fixed rules and sources: IAM-010, 2026-09-28.
# Does not evaluate the 2026-09-29 matrix, TI, expiration or hybrid readiness.
function Read-CheckedCsv($Path, $Columns, $UniqueKey) {
    $rows = @(Import-Csv -LiteralPath $Path)
    if (!$rows.Count) { throw "Empty source requires review: $Path" }
    foreach ($column in $Columns) {
        if ($column -notin $rows[0].PSObject.Properties.Name) { throw "Missing column $column in $Path" }
    }
    if ($UniqueKey) {
        if (@($rows | Where-Object { [string]::IsNullOrWhiteSpace($_.$UniqueKey) }).Count) { throw "Empty key in $Path" }
        if (@($rows | Group-Object $UniqueKey | Where-Object Count -gt 1).Count) { throw "Duplicate key in $Path" }
    }
    return $rows
}
$ad = @(Read-CheckedCsv (Join-Path $FinalADDirectory 'usuarios-ad.csv') @('EmployeeID','ObjectGUID','SamAccountName') 'ObjectGUID')
$entra = @(Read-CheckedCsv (Join-Path $InitialDirectory 'exportUsers_2026-9-28.csv') @('employeeId','id','displayName') 'id')
$links = @(Read-CheckedCsv (Join-Path $FinalADDirectory 'associacoes-ad.csv') @('Grupo','ObjectGUID','ObjectClass') '')
$groups = @(Read-CheckedCsv (Join-Path $FinalADDirectory 'grupos-ad.csv') @('Name','ObjectGUID') 'ObjectGUID')
foreach ($set in @(@{Rows=$ad;Key='EmployeeID'},@{Rows=$entra;Key='employeeId'})) {
    if (@($set.Rows | Where-Object { $_.($set.Key) } | Group-Object $set.Key | Where-Object Count -gt 1).Count) { throw 'Duplicate employee ID' }
}
foreach ($link in $links) {
    if ($link.Grupo -notin $groups.Name) { throw 'Unknown AD group' }
    $ids = if ($link.ObjectClass -eq 'user') { $ad.ObjectGUID } elseif ($link.ObjectClass -eq 'group') { $groups.ObjectGUID } else { throw 'Unclassified member type' }
    if ($link.ObjectGUID -notin $ids) { throw 'Unresolved AD member' }
}
$expected = @{
    AD = @{'EMP0002'='GG_SUP_TICKET'; 'EMP0006'='GG_FIN_READ'; 'EMP0007'='GG_FIN_READ'}
    Entra = @{'EMP0001'='GG_FIN_READ'; 'EMP0002'='GG_SUP_TICKET'; 'EMP0005'='GG_RH_READ'; 'EMP0006'='GG_FIN_READ'; 'EMP0007'='GG_FIN_READ'; 'EMP0008'='GG_RH_READ'}
}
$requiredAccounts = @{AD=@('EMP0002','EMP0004','EMP0006','EMP0007'); Entra=@('EMP0001','EMP0002','EMP0003','EMP0004','EMP0005','EMP0006','EMP0007','EMP0008')}
$actual = @{AD=@();Entra=@()}
foreach ($link in $links | Where-Object { $_.Grupo -in @('GG_FIN_READ','GG_SUP_TICKET','GG_RH_READ') }) {
    if ($link.ObjectClass -ne 'user') { throw 'Nested departmental GG needs separate evaluation' }
    $account = @($ad | Where-Object ObjectGUID -eq $link.ObjectGUID)
    $key = if ($account[0].EmployeeID) { $account[0].EmployeeID } else { 'AD-ID:'+$link.ObjectGUID }
    $actual.AD += $key+'::'+$link.Grupo
}
$groupFiles = @{
    GG_FIN_READ='exportGroupMembers_2026-9-28-GG_FIN_READ.csv'
    GG_SUP_TICKET='exportGroupMembers_2026-9-28-GG_SUP_TICKET.csv'
    GG_RH_READ='GG_RH_READ-entra-2809.csv'
}
foreach ($group in $groupFiles.Keys) {
    $members = @(Read-CheckedCsv (Join-Path $InitialDirectory $groupFiles[$group]) @('id','objectType') 'id')
    foreach ($member in $members) {
        if ($member.objectType -ne 'user') { throw 'Non-user Entra membership needs separate evaluation' }
        $account = @($entra | Where-Object id -eq $member.id)
        if ($account.Count -ne 1) { throw 'Unresolved Entra member' }
        $key = if ($account[0].employeeId) { $account[0].employeeId } else { 'ENTRA-ID:'+$member.id }
        $actual.Entra += $key+'::'+$group
    }
}
foreach ($system in @('AD','Entra')) {
    if (@($actual[$system] | Group-Object | Where-Object Count -gt 1).Count) { throw 'Duplicate association' }
    $wanted = @($expected[$system].Keys | ForEach-Object { $_+'::'+$expected[$system][$_] })
    foreach ($key in @($wanted+$actual[$system] | Sort-Object -Unique)) {
        $state = if ($key -notin $actual[$system]) { 'AUSENTE' } elseif ($key -notin $wanted) { 'EXCEDENTE' } else { 'CONFORME' }
        [pscustomobject]@{Sistema=$system;Regra='Grupo departamental';Chave=$key;Resultado=$state}
    }
    $rows = if ($system -eq 'AD') { $ad } else { $entra }
    foreach ($employee in 1..9 | ForEach-Object { 'EMP{0:D4}' -f $_ }) {
        $matched = @($rows | Where-Object { $_.employeeId -eq $employee })
        $wantedAccount = $employee -in $requiredAccounts[$system]
        $state = if ($wantedAccount -and !$matched.Count) { 'AUSENTE' } elseif (!$wantedAccount -and $matched.Count) { 'INVESTIGAR_CONTA' } elseif (!$wantedAccount) { 'AUSENCIA_PREVISTA' } else { 'CONFORME' }
        [pscustomobject]@{Sistema=$system;Regra='Populacao RH';Chave=$employee;Resultado=$state}
    }
    foreach ($account in $rows | Where-Object { !$_.employeeId -or $_.employeeId -notmatch '^EMP000[1-9]$' }) {
        $id = if ($system -eq 'AD') { $account.ObjectGUID } else { $account.id }
        [pscustomobject]@{Sistema=$system;Regra='Classificacao separada';Chave=$id;Resultado='REVISAR_FINALIDADE'}
    }
}
