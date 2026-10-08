# Conta de serviço — decisão e retirada de concessões

**Resultado:** três associações residuais retiradas em 29/09/2026, conta mantida desabilitada e GG_FIN_READ preservado na DL financeira. Tratamento do achado do IAM-010; não altera o estado histórico entregue no IAM-005.

Tratamento das três associações apontadas na [recertificação inicial](08-recertificacao-simulada.md#decisoes-2809), pois a rotina já estava encerrada.

## Antes, dependências e depois

| Prova | Resultado observado |
|---|---|
| [11 — Antes](11-servico-antes-associacoes.png) | 12:08:09 UTC−03:00: conta Enabled=False; tarefa Disabled; GG com svc_relatorio_fin como único membro; GG associado a DL_FIN_RELATORIOS_READ e DL_FIN_SAIDA_WRITE |
| [12 — Dependências locais](12-servico-dependencias-locais.png) | Relógio visível 12:12 de 29/09; filtro de tarefas por Principal.UserId encontra apenas IAM-005-Relatorio-Financeiro, Disabled; filtro de Win32_Service por StartName não retorna linhas |
| [13 — Depois](13-servico-depois-remocoes.png) | 12:14:13 UTC−03:00: GG de serviço vazio; DL de escrita vazia; DL de leitura contém somente GG_FIN_READ; conta permanece Enabled=False |

## Registro da decisão simulada — 12:23:24, após as capturas

Registro em **29/09/2026 12:23:24 -0300**. Responsável de negócio fictício: Carlos Lima. Execução técnica: Wesley. Formalização solicitada pelo operador após apresentação das capturas; o roteiro de retirada havia sido fornecido antes da execução. Não representa aprovação corporativa prévia.

A decisão registra a retirada dos vínculos abaixo, mantendo conta/tarefa desabilitadas e os grupos preservados. Sem necessidade futura de reativação documentada.

| Associação revisada | Decisão final | Verificação |
|---|---|---|
| svc_relatorio_fin → GG_SVC_RELATORIO_FIN | Remover | GG com zero membros |
| GG_SVC_RELATORIO_FIN → DL_FIN_RELATORIOS_READ | Remover | DL contém somente GG_FIN_READ |
| GG_SVC_RELATORIO_FIN → DL_FIN_SAIDA_WRITE | Remover | DL com zero membros |

## Limites

- Consultas locais filtradas pelo nome; não cobrem outros hosts, consumidores externos ou todas as formas de referência, como SID. Ausência de linhas não prova ausência universal de dependências.
- Antes/depois sustenta a retirada dos três vínculos; os comandos de remoção não aparecem nas capturas. A tarefa foi observada desabilitada antes e na consulta de dependências; seu estado não é reconsultado na prova 13.
- GG_FIN_READ permanece na DL de leitura. Não foram repetidos testes dos usuários humanos nem consultados todos os membros do GG humano nesta rodada. ACLs e demais caminhos de acesso não foram reexportados.
- Não se declara conta sem qualquer permissão: grupo primário, direitos de logon, permissões diretas e outros grupos não foram auditados integralmente. DLs/ACLs/arquivos não foram excluídos nesta operação de associação.
Capturas sem edição, hashes conferidos; originais e manifesto privados. [Ticket IAM-010](../../../00-operacao-itsm/05-fila-tickets.md#iam-010).

[Voltar ao índice por assunto](README.md).
