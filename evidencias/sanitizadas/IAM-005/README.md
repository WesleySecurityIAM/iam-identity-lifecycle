# IAM-005 — Rotina financeira com conta de serviço

**Resultado em 15/09/2026:** `svc_relatorio_fin` leu dados fictícios e gerou um resumo em pasta separada em duas execuções com código 0. O script reportou as negativas esperadas; tarefa e conta foram desabilitadas ao final.

[Ticket: aprovação simulada, execução e manutenção da credencial](../../../00-operacao-itsm/05-fila-tickets.md#iam-005).

<a id="estado-anterior"></a>

## 1. Estado anterior — 11/09

[01 — Conta antes da integração](01-conta-desabilitada-2026-09-11.png) mostra, em 11/09, a conta desabilitada, responsável Wesley e integração pendente. A descrição ainda continha AM-005. A correção para IAM-005 e a consulta que retornou somente Domain Users em 15/09 foram registradas pelo operador no atendimento.

A aprovação simulada do Gestor Financeiro em 15/09, sem horário informado, autorizou leitura da entrada e gravação da saída, sem privilégios administrativos.

<a id="configuracao"></a>

## 2. Concessões — 15/09

| Caminho da concessão | Finalidade |
|---|---|
| svc_relatorio_fin → GG_SVC_RELATORIO_FIN → DL_FIN_RELATORIOS_READ | Ler `C:\IAM-Lab\Relatorios-Financeiros\relatorio-teste.txt`. |
| svc_relatorio_fin → GG_SVC_RELATORIO_FIN → DL_FIN_SAIDA_WRITE | Gravar/atualizar `C:\IAM-Lab\Saidas-Relatorios-Financeiros\resumo.json`. |
| Pasta `C:\IAM-Lab\Scripts-Relatorios` | Ler/executar o script; alteração reservada à administração. Concessão descrita no atendimento e teste negativo mostrado adiante. |

| Prova | O que observar | Limite |
|---|---|---|
| [02 — Grupos e ACL da saída](02-grupos-e-permissoes-saida.png) | Conta no GG de serviço; GG nas duas DL; DL de saída com Write, ReadAndExecute e Synchronize; SYSTEM/Administrators com FullControl | A consulta de grupos não é teste funcional de acesso. |
| [03 — Propagação das regras](03-aplicacao-arquivos-subpastas.png) | ContainerInherit e ObjectInherit; PropagationFlags=None | Mostra flags das regras consultadas; não mostra AreAccessRulesProtected nem consulta individual de cada arquivo/subpasta. |

O [script da rotina](../../../05-automacao/IAM-005/README.md) conta linhas e produz o resumo. Foi fornecido após as execuções e anexado sem alteração.

RunLevel Limited, logon em lote e negação de logon local/RDP foram descritos no atendimento; não há XML completo da tarefa nem exportação da GPO nesta pasta.

<a id="execucao-e-testes"></a>

## 3. Execuções e testes — 15/09

| Prova | Resultado |
|---|---|
| [04 — Primeira execução e resumo](04-primeira-execucao-testes.png) | Às 20:56:14 UTC (17:56:14 Brasília), identidade EMPRESA\svc_relatorio_fin, duas linhas lidas e negativas esperadas. |
| [05 — Resultado da primeira tarefa](05-primeira-execucao-resultado-zero.png) | Início às 17:56:11 pelo relógio da VM; LastTaskResult=0. |
| [06 — Reexecução e resultado](06-reexecucao-testes-e-resultado-zero.png) | Início às 18:00:35; saída atualizada às 21:00:36 UTC (18:00:36 Brasília), mesmos testes e código 0. |

**Positivo:** leitura da entrada e criação/atualização do resumo na saída. **Negativos:** criação de arquivo na entrada e alteração de arquivo descartável na pasta dos scripts negadas, conforme resultado reportado pelo script. O código 0 sozinho não comprova todos os controles: deve ser lido junto do resumo e dos testes registrados.

<a id="desativacao"></a>

## 4. Desativação e fechamento — 15/09

[07 — Estado final](07-estado-final-desabilitado.png): tarefa Disabled e conta Enabled=False. **Grupos e ACLs permaneceram configurados nesse fechamento.**

<a id="tratamento-posterior"></a>

Consulta opcional: [estado posterior das concessões da mesma conta, em 29/09](../IAM-010/10-servico-remocao-concessoes.md).

## Limites e preservação

- Conta AD tradicional, não gMSA; a execução na DC01 é adaptação ao laboratório de uma VM.
- Os negativos foram reportados pelo script; os erros brutos não foram anexados. Exclusão e alteração de ACL não foram testadas.
- Não há tentativa de logon interativo/RDP anexada nem teste de rotação de credencial. Conferência de sintaxe do script não equivale a nova execução.
- Capturas do operador preservadas sem edição; datas de execução vêm dos resultados. Origens e hashes no manifesto privado; credenciais omitidas.
