# Reconciliação RH × Entra — 23/09/2026

**Duas pessoas, três verificações e uma exceção calculada:** Carla deveria estar desabilitada; o CSV registra conta habilitada. Gabriela está conforme em habilitação e departamento Suporte. Resultado vinculado ao [IAM-002](../../../00-operacao-itsm/05-fila-tickets.md#iam-002) e ao [IAM-003](../../../00-operacao-itsm/05-fila-tickets.md#iam-003). IAM-002 permanece em andamento; o IAM-003 foi posteriormente fechado, conforme a [validação final](../IAM-003/08-validacao-final.md).

| Evidência | Conteúdo |
|---|---|
| [01 — Resultado no PowerShell](01-resultado-reconciliacao-entra.png) | Três linhas e Total de exceções: 1; Get-Date mostra 23/09/2026 às 16:57:25 UTC−03:00. |
| [Relatório completo](reconciliacao-entra.csv) | Matrícula, Object ID, regra, esperado, observado, resultado e fonte. |
| [Exceção calculada](excecoes-entra.csv) | EMP0003: habilitação esperada False, observada True. |

## Regra e origem

Fonte esperada: cópia preservada em 23/09 do RH vigente de 18/09, com Carla DESLIGADO e Gabriela ATIVO/Suporte. Fonte observada: exportação de usuários do Entra de **22/09**, identificada nos próprios resultados. Correlação por employee_id/employeeId; identificação da conta por Object ID. A execução em 23/09 não atualiza a data do inventário.

A habilitação é comparada para as duas pessoas. O departamento é comparado apenas para ATIVO no RH. Cada linha representa uma regra, não uma pessoa distinta. Os CSVs originais foram copiados sem alteração e conferidos contra a captura; o comparador não foi reexecutado nesta organização documental.

## Limites e tratamento pendente

- A [conferência visual de 23/09](../inventario-entra-2026-09-23/README.md) confirma Carla habilitada e no GG_FIN_READ. A associação incompatível foi constatada separadamente e **não integra a contagem de uma exceção deste CSV**.
- O resultado CONFORME de Gabriela vale para habilitação e departamento nas fontes utilizadas. Não representa Mover executado nem auditoria completa de acessos.
- Este relatório não compara grupos, AD, papéis, aplicações ou sessões. As consultas visuais e os testes SMB possuem evidências próprias.
- O desligamento fictício de Carla em 28/08 e a criação real da conta no laboratório em 21/09 reproduzem uma divergência. Não demonstram acesso contínuo desde agosto nem SLA histórico.
- Atualização posterior: Leaver concluído, com auditoria, entrada bloqueada e comparação final conforme no IAM-003. Mover continua pendente do evento efetivo de RH e execução; este relatório preserva a divergência inicial.

## Integridade

| Arquivo | SHA256 |
|---|---|
| 01-resultado-reconciliacao-entra.png | `574BA6CD0EE07E4F7CE0FB5B041CA29935702E2B370484BA8E11047A5D5C7556` |
| reconciliacao-entra.csv | `608F3ABF496BE66D2642F80832A3344BCF08D31CF5B9B503AB3A252727742523` |
| excecoes-entra.csv | `90F5D62AC6D53C9C5EC41CE2995ABF25FA50DE3135F612B065011A4C110FB7D7` |
