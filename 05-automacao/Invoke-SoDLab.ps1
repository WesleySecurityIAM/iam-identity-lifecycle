param([ValidateSet('Antes','Depois')][string]$Etapa='Antes')
$ErrorActionPreference='Stop'
# Entirely fictional entitlement data; no AD, Entra or application calls.
$inputRows = @(
 [pscustomobject]@{Caso='A somente';Matricula='EMP0007';Escopo='Compras-LAB';Direitos=@('FORNECEDOR_MANTER')}
 [pscustomobject]@{Caso='B somente';Matricula='EMP0007';Escopo='Compras-LAB';Direitos=@('ORCAMENTO_APROVAR')}
 [pscustomobject]@{Caso='A+B';Matricula='EMP0007';Escopo='Compras-LAB';Direitos=@('FORNECEDOR_MANTER')}
 [pscustomobject]@{Caso='A+B';Matricula='EMP0007';Escopo='Compras-LAB';Direitos=@('ORCAMENTO_APROVAR')}
 [pscustomobject]@{Caso='Pessoas distintas';Matricula='EMP0007';Escopo='Compras-LAB';Direitos=@('FORNECEDOR_MANTER')}
 [pscustomobject]@{Caso='Pessoas distintas';Matricula='EMP0006';Escopo='Compras-LAB';Direitos=@('ORCAMENTO_APROVAR')}
 [pscustomobject]@{Caso='Escopos distintos';Matricula='EMP0007';Escopo='Compras-LAB/A';Direitos=@('FORNECEDOR_MANTER')}
 [pscustomobject]@{Caso='Escopos distintos';Matricula='EMP0007';Escopo='Compras-LAB/B';Direitos=@('ORCAMENTO_APROVAR')}
)
Write-Output 'SIMULACAO LOCAL - cenarios alternativos, nao concessoes reais'
Write-Output (Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')
Write-Output "Etapa: $Etapa"
if ($Etapa -eq 'Depois') {
 Write-Output 'Decisao didatica de Carlos Lima: manter ORCAMENTO_APROVAR e retirar FORNECEDOR_MANTER no caso A+B.'
 Write-Output 'Justificativa: neste cenario, Gabriela aprova orcamentos; manutencao de fornecedores cabe a outra pessoa.'
}
$result = @(foreach ($bundle in $inputRows | Group-Object Caso,Matricula,Escopo) {
 $row=$bundle.Group[0]
 $rights=@($bundle.Group | ForEach-Object { $_.Direitos } | Sort-Object -Unique)
 if ($Etapa -eq 'Depois' -and $row.Caso -eq 'A+B') {
  $rights=@($rights | Where-Object { $_ -ne 'FORNECEDOR_MANTER' })
 }
 $conflict=($rights -contains 'FORNECEDOR_MANTER') -and ($rights -contains 'ORCAMENTO_APROVAR')
 [pscustomobject]@{
  Caso=$row.Caso
  Matricula=$row.Matricula
  Escopo=$row.Escopo
  Direitos=($rights -join ' + ')
  Regra='SoD-001'
  Resultado=if($conflict){'CONFLITO'}else{'SEM_CONFLITO'}
 }
})
$conflicts=@($result | Where-Object Resultado -eq 'CONFLITO')
if($Etapa -eq 'Antes') {
 if($conflicts.Count -ne 1 -or $conflicts[0].Caso -ne 'A+B'){throw 'Unexpected detection result'}
} else {
 $treated=@($result | Where-Object Caso -eq 'A+B')
 if($conflicts.Count -ne 0 -or $treated.Count -ne 1 -or $treated[0].Direitos -ne 'ORCAMENTO_APROVAR'){throw 'Required access not preserved or conflict remains'}
}
$result | Format-Table Caso,Matricula,Escopo,Direitos,Resultado -AutoSize
Write-Output "Conflitos encontrados: $($conflicts.Count). Casos independentes: 5."
Write-Output 'Nenhuma conta ou permissao real foi alterada. Ausencia de conflito nao comprova necessidade de acesso.'
