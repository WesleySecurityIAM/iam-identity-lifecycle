# IAM-005 — Rotina financeira com conta de serviço

**Objetivo:** permitir que uma identidade de serviço leia dados fictícios e gere um resumo, sem escrever na entrada nem alterar arquivos da pasta do código. **Resultado:** duas execuções com código 0, testes negativos aprovados e tarefa/conta desabilitadas ao final.

## Evidências

| Prova | O que demonstra |
|---|---|
| [01 — Estado anterior](01-conta-desabilitada-2026-09-11.png) | Em 11/09, conta desabilitada, responsável Wesley e integração pendente. A descrição ainda continha AM-005. |
| [02 — Grupos e permissões da saída](02-grupos-e-permissoes-saida.png) | Conta no GG; GG nas duas DL; GG humano preservado. DL de saída com Write, ReadAndExecute e Synchronize; SYSTEM/Administrators com FullControl. |
| [03 — Aplicação das permissões](03-aplicacao-arquivos-subpastas.png) | ContainerInherit e ObjectInherit, PropagationFlags=None. A captura não mostra AreAccessRulesProtected. |
| [04 — Primeira execução](04-primeira-execucao-testes.png) | Resumo de 15/09 às 20:56:14 UTC (17:56:14 Brasília), identidade de serviço, duas linhas e negações esperadas. |
| [05 — Resultado da tarefa](05-primeira-execucao-resultado-zero.png) | Início às 17:56:11 pelo relógio da VM e LastTaskResult=0. |
| [06 — Execução repetida](06-reexecucao-testes-e-resultado-zero.png) | Novo resumo às 21:00:36 UTC (18:00:36 Brasília), mesmos testes e código 0; início da tarefa às 18:00:35. |
| [07 — Estado final](07-estado-final-desabilitado.png) | Tarefa Disabled e svc_relatorio_fin com Enabled=False. |

## Desenho implementado

`svc_relatorio_fin` é membro de `GG_SVC_RELATORIO_FIN`. Esse GG é membro de duas DL independentes: `DL_FIN_RELATORIOS_READ` para leitura da entrada e `DL_FIN_SAIDA_WRITE` para gravação da saída. A rotina conta linhas e grava o resumo em pasta separada, sem copiar os dados financeiros.

## Validação e limites

A primeira execução gera o resumo; a segunda o atualiza. O resultado registra leitura permitida, escrita na entrada negada e alteração de arquivo descartável na pasta dos scripts negada. Os testes negativos são resultados reportados pelo script, acompanhados da identidade executora; o [script fornecido após os testes](../../../05-automacao/IAM-005/README.md) foi anexado sem alterações. A sintaxe foi conferida sem nova execução; os erros brutos não foram anexados.

A tarefa foi configurada com privilégios limitados e direitos de logon em lote durante o atendimento. Não há tentativa interativa/RDP anexada. Acesso de exclusão e alteração de permissões não foram testados. Desabilitar conta e tarefa não remove grupos, ACLs ou arquivos.

## Origem e preservação

Capturas fornecidas pelo operador, conferidas visualmente e mantidas sem edição. Renomeadas para explicar seu conteúdo; datas de execução vêm dos resultados, não do nome do arquivo. O manifesto privado registra origens, destinos e SHA-256. Credenciais não são publicadas.

[Ticket, aprovação simulada e procedimento de manutenção](../../../00-operacao-itsm/05-fila-tickets.md#iam-005).
