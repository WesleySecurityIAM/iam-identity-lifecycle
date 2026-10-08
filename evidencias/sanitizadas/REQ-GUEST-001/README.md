# REQ-GUEST-001 — Convite, aceite e encerramento do convidado

**Fechado em 25/09/2026.** O cenário demonstrou o ciclo de uma identidade externa controlada pelo operador: convite e aceite em 22/09, depois bloqueio e revogação auditada no prazo manual. Nenhum grupo, papel administrativo ou aplicação estava previsto para esta requisição.

## Sequência das provas

| Ordem / data | Provas necessárias | O que demonstram |
|---|---|---|
| 1 — Convite, 22/09 às 14:09 | [03 — criação, convite e sponsor](03-auditoria-convite-aceite.md#convite) + [01 — estado pendente](01-estado-pendente.md). | Criação por Invitation; Guest habilitado, responsável técnico vinculado e Pending acceptance. |
| 2 — Aceite, 22/09 às 14:17 | [03 — resgate do convite](03-auditoria-convite-aceite.md#aceite) + [02 — estado aceito](02-estado-aceito.md). | O mesmo convidado passou a Accepted. Não demonstra acesso a aplicação. |
| 3 — Encerramento, 25/09 | [06 — ações auditadas e conferência final](06-encerramento.md). | Bloqueio e revogação (05), mais Disabled/contadores zero (04). |

Auditoria registra ação, executor e horário; captura mostra o estado consultado. A [requisição](../../../00-operacao-itsm/REQ-GUEST-001.md) contém finalidade, responsável e prazo.

## Limites do fechamento

O objeto foi preservado. O prazo foi cumprido manualmente, sem expiração automática. A ação de revogação não comprova término imediato de toda sessão de aplicação ou do provedor externo. Não houve novo teste de entrada/aplicação nem CSV final; a conclusão se apoia no perfil individual e na auditoria. Contadores zero cobrem o resumo do portal, não todas as permissões possíveis em outros serviços.

Capturas e extratos permanecem com seus identificadores e hashes documentados. Fontes integrais privadas; dados pessoais do operador nas capturas foram publicados com sua autorização.
