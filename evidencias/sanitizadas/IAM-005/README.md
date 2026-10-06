# IAM-005 — Rotina financeira com conta de serviço

**Objetivo:** usar `svc_relatorio_fin` para ler dados fictícios e gerar um resumo em pasta separada, sem escrever na entrada nem alterar o código. **Fechado em 15/09/2026:** duas execuções com código 0, leitura/saída permitidas, negativas reportadas pelo script e tarefa/conta desabilitadas ao final.

[Ticket: aprovação simulada, execução e manutenção da credencial](../../../00-operacao-itsm/05-fila-tickets.md#iam-005).

Leia na ordem: **conta antes da integração → desenho e concessões → execução e testes → desativação**. O tratamento posterior dos vínculos residuais, no IAM-010, fica separado ao final; não é apresentado como ação de 15/09.

<a id="estado-anterior"></a>

## 1. Estado anterior e decisão — por que usar uma conta de serviço

[01 — Conta antes da integração](01-conta-desabilitada-2026-09-11.png) mostra, em 11/09, a conta desabilitada, responsável Wesley e integração pendente. A descrição ainda continha AM-005. A correção para IAM-005 e a consulta que retornou somente Domain Users em 15/09 foram registradas pelo operador no atendimento.

A decisão simulada do Gestor Financeiro, registrada em 15/09 sem horário informado, autorizou leitura da entrada e gravação da saída, sem privilégios administrativos. A rotina usa uma identidade própria para distinguir sua execução da de uma pessoa.

<a id="configuracao"></a>

## 2. Configuração — onde a rotina deve ler e escrever

| Caminho da concessão | Finalidade |
|---|---|
| svc_relatorio_fin → GG_SVC_RELATORIO_FIN → DL_FIN_RELATORIOS_READ | Ler `C:\IAM-Lab\Relatorios-Financeiros\relatorio-teste.txt`. |
| svc_relatorio_fin → GG_SVC_RELATORIO_FIN → DL_FIN_SAIDA_WRITE | Gravar/atualizar `C:\IAM-Lab\Saidas-Relatorios-Financeiros\resumo.json`. |
| Pasta `C:\IAM-Lab\Scripts-Relatorios` | Ler/executar o script; alteração reservada à administração. Concessão descrita no atendimento e teste negativo mostrado adiante. |

| Prova | O que observar | Limite |
|---|---|---|
| [02 — Grupos e ACL da saída](02-grupos-e-permissoes-saida.png) | Conta no GG de serviço; GG nas duas DL; DL de saída com Write, ReadAndExecute e Synchronize; SYSTEM/Administrators com FullControl | A presença de GG_FIN_READ na DL de leitura mostra o vínculo humano preservado. Não é um teste de acesso de Felipe ou Gabriela. |
| [03 — Propagação das regras](03-aplicacao-arquivos-subpastas.png) | ContainerInherit e ObjectInherit; PropagationFlags=None | Mostra flags das regras consultadas; não mostra AreAccessRulesProtected nem consulta individual de cada arquivo/subpasta. |

A rotina conta linhas e produz um resumo, sem copiar os dados financeiros. O [script e as instruções desta mesma rotina](../../../05-automacao/IAM-005/README.md) ajudam a entender o teste; o código foi fornecido após as execuções e anexado sem alteração.

A configuração da tarefa com RunLevel Limited e da GPO para logon em lote/negação de logon local e RDP, assim como as correções de nome e leitura do script, está descrita no atendimento. Não há XML completo da tarefa, exportação completa da GPO ou captura de todos esses passos nesta pasta.

<a id="execucao-e-testes"></a>

## 3. Execução e testes — o que funcionou e o que foi negado

| Prova de 15/09 | O que mostra | Propósito |
|---|---|---|
| [04 — Primeira execução e resumo](04-primeira-execucao-testes.png) | Às 20:56:14 UTC (17:56:14 Brasília), identidade EMPRESA\svc_relatorio_fin, duas linhas lidas e negativas esperadas | Associar o resultado à conta de serviço e aos caminhos testados. |
| [05 — Resultado da primeira tarefa](05-primeira-execucao-resultado-zero.png) | Início às 17:56:11 pelo relógio da VM; LastTaskResult=0 | Complementar o resumo com o resultado da tarefa agendada. |
| [06 — Reexecução e resultado](06-reexecucao-testes-e-resultado-zero.png) | Início às 18:00:35; novo resumo às 21:00:36 UTC (18:00:36 Brasília), mesmos testes e código 0 | Verificar repetição e atualização da saída. |

**Positivo:** leitura da entrada e criação/atualização do resumo na saída. **Negativos:** criação de arquivo na entrada e alteração de arquivo descartável na pasta dos scripts negadas, conforme resultado reportado pelo script. O código 0 sozinho não comprova todos os controles: deve ser lido junto do resumo e dos testes registrados.

<a id="desativacao"></a>

## 4. Desativação e fechamento — 15/09

[07 — Estado final](07-estado-final-desabilitado.png): tarefa Disabled e conta Enabled=False. A demonstração foi concluída e a rotina não permaneceu em operação. **Grupos e ACLs permaneceram configurados nesse fechamento**; desabilitar conta/tarefa não remove concessões.

<a id="tratamento-posterior"></a>

## 5. Evolução posterior — retirada das concessões em 29/09

Na recertificação IAM-010, foi decidido retirar os três vínculos residuais da rotina encerrada, mantendo a conta desabilitada. A [decisão e as provas específicas do IAM-010](../IAM-010/10-servico-remocao-concessoes.md) são uma referência necessária para consultar o estado posterior da mesma conta. Os testes e a desativação acima continuam sendo o histórico de 15/09.

## Limites e preservação

- Conta AD tradicional, não gMSA; a execução na DC01 é adaptação ao laboratório de uma VM.
- Os negativos foram reportados pelo script; os erros brutos não foram anexados. Exclusão e alteração de ACL não foram testadas.
- Não há tentativa de logon interativo/RDP anexada nem teste de rotação de credencial. Conferência de sintaxe do script não equivale a nova execução.
- Capturas fornecidas pelo operador, conferidas e preservadas sem edição; datas de execução vêm dos resultados. O manifesto privado registra origens, destinos e hashes. Credenciais não são publicadas.
