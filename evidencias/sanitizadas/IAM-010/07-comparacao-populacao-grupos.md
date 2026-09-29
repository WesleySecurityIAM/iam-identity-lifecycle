# População e grupos versus matriz — 28/09/2026

> Revisão de 29/09: estes resultados são históricos de três grupos. TI não tinha regra de recurso neste recorte; sua ausência é uma lacuna de cobertura, tratada na [matriz vigente](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md). Não representam conformidade integral dos acessos de TI.

## Resultado

Comparação executada após o tratamento de Bruno e a movimentação de OU de Gabriela, usando a [matriz vigente](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md).

| Controle | AD | Entra |
|---|---|---|
| Contas pessoais previstas e encontradas | 4 | 8 |
| Ausências previstas confirmadas | 5 | 1 |
| Associações departamentais conformes | 3 | 6 |
| Associações departamentais ausentes | 0 | 0 |
| Associações departamentais excedentes | 0 | 0 |
| Contas que exigem classificação separada | 5 | 4 |

Nenhuma ausência ou excesso nos grupos departamentais avaliados. Isso não equivale a ausência de risco em todos os acessos: as associações técnicas/delegação são revisadas separadamente e a conta de serviço conserva pendência de decisão sobre retenção de acessos.

## Associações conferidas

| Sistema | Matrícula | Grupo observado e esperado | Resultado |
|---|---|---|---|
| AD | EMP0002 — Bruno | GG_SUP_TICKET | Conforme |
| AD | EMP0006 — Felipe | GG_FIN_READ | Conforme |
| AD | EMP0007 — Gabriela | GG_FIN_READ | Conforme |
| Entra | EMP0001 — Ana | GG_FIN_READ | Conforme |
| Entra | EMP0002 — Bruno | GG_SUP_TICKET | Conforme |
| Entra | EMP0005 — Elisa | GG_RH_READ | Conforme |
| Entra | EMP0006 — Felipe | GG_FIN_READ | Conforme |
| Entra | EMP0007 — Gabriela | GG_FIN_READ | Conforme |
| Entra | EMP0008 — Henrique | GG_RH_READ | Conforme |

Carla e Diego não aparecem nos três grupos departamentais Entra; Diego não aparece nos grupos departamentais AD coletados. EMP0009 está ausente nos dois sistemas, conforme escopo. Ana, Carla, Elisa e Henrique não têm conta observada no AD, conforme o recorte definido. Não foi exigida criação de conta onde a matriz não prevê provisionamento.

## Fontes e método

- AD: usuarios-ad.csv, grupos-ad.csv e associacoes-ad.csv, coleta final de 28/09 às 16:59:31 UTC−03:00.
- Entra: exportUsers_2026-9-28.csv (arquivo de 12:04), membros Financeiro/Suporte (12:08) e RH (15:50). As fontes não são simultâneas; sem nova consulta ao tenant nesta comparação.
- RH: nove matrículas da população definida. O script contém a regra explícita da matriz de 28/09; não calcula departamento/habilitação nem o horário de expiração. Esses controles possuem registros próprios.
- [Comparador PowerShell](../../../05-automacao/Compare-DepartmentMembership.ps1): lê os arquivos privados, resolve membros por ObjectGUID no AD e id no Entra e usa matrícula para relacionar à matriz. Compara o par matrícula/grupo, incluindo membros inesperados sem matrícula. Não altera diretórios nem grava credenciais.

O script confere colunas, chaves de objeto e matrículas duplicadas, referências de membros e tipos suportados. Arquivo ausente ou vazio interrompe a execução para revisão, em vez de virar resultado sem exceções. Grupo vazio legítimo exigiria tratamento explícito da fonte; este comparador é delimitado aos arquivos e regras desta rodada. A coleta AD só cobre GG_* e DL_*, não todos os grupos do domínio nem grupo primário. Não trata aninhamento dentro dos GG departamentais automaticamente.

Execução com os diretórios privados de coleta:

```powershell
.\05-automacao\Compare-DepartmentMembership.ps1 `
    -InitialDirectory $pastaColetaInicial `
    -FinalADDirectory $pastaColetaFinalAD |
    Format-Table Sistema,Regra,Chave,Resultado -AutoSize
```

Validação do comparador em cópia isolada dos dados: ausência de Bruno e inclusão indevida de Diego em Financeiro produziram um AUSENTE e um EXCEDENTE. Matrícula duplicada interrompeu a comparação. Essas alterações existiram apenas em arquivos de validação; não foram feitas nos diretórios nem integram o resultado real do laboratório.

## Encaminhamento

As nove contas especiais sem matrícula não foram chamadas de órfãs automaticamente. A [recertificação simulada](08-recertificacao-simulada.md) classifica finalidade e decisão por associação, incluindo os demais grupos técnicos do AD. Encerramento de Diego no IAM-004, retenção de acessos da conta de serviço e microcaso SoD permanecem assuntos explicitamente pendentes.
