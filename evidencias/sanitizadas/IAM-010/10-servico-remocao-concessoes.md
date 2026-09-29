# Conta de serviço — decisão e retirada de concessões

**Resultado:** três associações residuais retiradas em 29/09/2026, conta mantida desabilitada e GG_FIN_READ preservado na DL financeira. Tratamento do achado do IAM-010; não altera o estado histórico entregue no IAM-005.

## Decisão simulada

Registro em **29/09/2026 12:23:24 -0300**. Responsável de negócio fictício: Carlos Lima. Execução técnica: Wesley. Formalização solicitada pelo operador após apresentação das capturas; o roteiro de retirada havia sido fornecido antes da execução. Não representa aprovação corporativa prévia.

Após revisão da finalidade encerrada da rotina e das dependências locais consultadas, decidiu-se retirar svc_relatorio_fin de GG_SVC_RELATORIO_FIN e retirar esse GG das DL de leitura e escrita. Manter conta e tarefa desabilitadas e preservar os grupos. Não há necessidade futura de reativação documentada. Nova utilização exigirá nova decisão, concessões mínimas e reteste.

## Antes, dependências e depois

| Prova | Resultado observado |
|---|---|
| [11 — Antes](11-servico-antes-associacoes.png) | 12:08:09 UTC−03:00: conta Enabled=False; tarefa Disabled; GG com svc_relatorio_fin como único membro; GG associado a DL_FIN_RELATORIOS_READ e DL_FIN_SAIDA_WRITE |
| [12 — Dependências locais](12-servico-dependencias-locais.png) | Relógio visível 12:12 de 29/09; filtro de tarefas por Principal.UserId encontra apenas IAM-005-Relatorio-Financeiro, Disabled; filtro de Win32_Service por StartName não retorna linhas |
| [13 — Depois](13-servico-depois-remocoes.png) | 12:14:13 UTC−03:00: GG de serviço vazio; DL de escrita vazia; DL de leitura contém somente GG_FIN_READ; conta permanece Enabled=False |

| Associação revisada | Decisão final | Verificação |
|---|---|---|
| svc_relatorio_fin → GG_SVC_RELATORIO_FIN | Remover | GG com zero membros |
| GG_SVC_RELATORIO_FIN → DL_FIN_RELATORIOS_READ | Remover | DL contém somente GG_FIN_READ |
| GG_SVC_RELATORIO_FIN → DL_FIN_SAIDA_WRITE | Remover | DL com zero membros |

Consolidado das quinze associações revisadas em 28/09: doze decisões de manter e três de remover, estas comprovadas nas consultas de 29/09. Isso atualiza o tratamento do achado, não constitui nova exportação completa dos dois diretórios. As outras doze decisões continuam referenciando suas próprias evidências/coletas.

## Limites e reversão

- Consultas locais filtradas pelo nome; não cobrem outros hosts, consumidores externos ou todas as formas de referência, como SID. Ausência de linhas não prova ausência universal de dependências.
- Antes/depois sustenta a retirada dos três vínculos; os comandos de remoção não aparecem nas capturas. A tarefa foi observada desabilitada antes e na consulta de dependências; seu estado não é reconsultado na prova 13.
- GG_FIN_READ permanece na DL de leitura. Não foram repetidos testes dos usuários humanos nem consultados todos os membros do GG humano nesta rodada. ACLs e demais caminhos de acesso não foram reexportados.
- Não se declara conta sem qualquer permissão: grupo primário, direitos de logon, permissões diretas e outros grupos não foram auditados integralmente. DLs/ACLs/arquivos não foram excluídos nesta operação de associação.
- Reversão somente se houver necessidade confirmada: restaurar vínculos estritamente necessários e validar dependências antes de reativar conta/tarefa. Não reativar apenas para fabricar teste negativo.

Capturas sem edição, hashes conferidos; originais e manifesto privados. Sem credenciais nas provas. [IAM-010](../../../00-operacao-itsm/05-fila-tickets.md#iam-010) fechado em 29/09 após SoD e conferência final; esta evidência documenta o tratamento do serviço.
