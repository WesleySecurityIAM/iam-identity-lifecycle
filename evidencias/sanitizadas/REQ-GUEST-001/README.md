# REQ-GUEST-001 — Convite, aceite e encerramento do convidado

**Fechado em 25/09/2026.** O cenário demonstrou o ciclo de uma identidade externa controlada pelo operador: convite e aceite em 22/09, depois bloqueio e revogação auditada no prazo manual. Nenhum grupo, papel administrativo ou aplicação estava previsto para esta requisição.

## Sequência das provas

| Passo e propósito | Abrir a evidência | O que ela demonstra |
|---|---|---|
| 1. Criar o convite | [01 — Estado pendente e captura](01-estado-pendente.md) | Guest criado por Invitation, habilitado e com Pending acceptance. |
| 2. Confirmar o aceite | [02 — Estado aceito e captura](02-estado-aceito.md) | O mesmo convidado passou a Accepted. Aceite não demonstra acesso a aplicação. |
| 3. Correlacionar os eventos | [03 — Convite, sponsor e resgate](03-auditoria-convite-aceite.md) | Eventos de criação/convite, associação do sponsor e resgate, com horários e resultados. Este relatório pertence aos passos 1–2. |
| 4. Encerrar no prazo e conferir | [06 — Encerramento explicado](06-encerramento.md) | Reúne a captura 04 (Disabled e contadores zero) e o extrato 05 (bloqueio e revogação com success). |

A [requisição](../../../00-operacao-itsm/REQ-GUEST-001.md) registra finalidade, responsável, autorização de laboratório, prazo, ações e conclusão. Este índice contém somente provas do Guest. A conta ADMIN-LAB-001 aparece como executor/sponsor necessário à explicação dos eventos; não é evidência de outro teste administrativo.

## Limites do fechamento

O objeto foi preservado. O prazo foi cumprido manualmente, sem expiração automática. A ação de revogação não comprova término imediato de toda sessão de aplicação ou do provedor externo. Não houve novo teste de entrada/aplicação nem CSV final; a conclusão se apoia no perfil individual e na auditoria. Contadores zero cobrem o resumo do portal, não todas as permissões possíveis em outros serviços.

Capturas e extratos permanecem com seus identificadores e hashes documentados. Fontes integrais privadas; dados pessoais do operador nas capturas foram publicados com sua autorização.
