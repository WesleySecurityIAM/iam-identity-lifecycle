# IAM-003 — Auditoria das ações sobre Carla

Fonte privada: `AuditLogs_2026-09-23.json`, com 17 registros. Cinco eventos referenciam o Object ID de EMP0003 em targetResources. Os pares registram a mesma ação, não cinco intervenções distintas. Todos retornam result=success em 23/09/2026.

| UTC — activityDateTime | Brasília (UTC−03:00) | activityDisplayName | Propriedade e resultado |
|---|---|---|---|
| 20:10:26.8440604Z | 17:10:26 | Disable account | AccountEnabled: `[true]` → `[false]` |
| 20:10:26.8450568Z | 17:10:26 | Update user | Mesma alteração de AccountEnabled |
| 20:15:36.8098081Z | 17:15:36 | Update StsRefreshTokenValidFrom Timestamp | StsRefreshTokensValidFrom: `2026-09-21T14:59:32Z` → `2026-09-23T20:15:36Z` |
| 20:15:36.8108078Z | 17:15:36 | Update user | Mesma atualização do marco de validade |
| 20:17:18.2094674Z | 17:17:18 | Remove member from group | Alvos User/Group; Group.DisplayName: `GG_FIN_READ` → null |

## Correlação e leitura

O ID do alvo User foi conferido contra a conta de Carla no perfil e na reconciliação. O último evento inclui também o ID do grupo. A remoção é sustentada pela atividade, alvos e propriedades em conjunto, não pelo null isoladamente.

initiatedBy.user contém ID e UPN do executor; displayName está null. O mesmo ID de executor aparece nas cinco operações. UPN, IP e identificadores de eventos/correlação permanecem no original privado. Nome vazio não significa ausência de identificação do executor.

A atualização de StsRefreshTokensValidFrom sustenta a ação de revogação dos refresh tokens anteriores. Não demonstra término imediato de sessões próprias de todas as aplicações. A [entrada posterior bloqueada](06-sign-in-bloqueado.md) é uma verificação separada.

## Cronologia da decisão

A decisão simulada foi registrada neste atendimento às 17:10, com consulta de relógio local às 17:10:52. A auditoria situa o bloqueio às 17:10:26. O registro documental não comprova aprovação anterior ao bloqueio. Mantida essa limitação, sem alterar datas dos eventos.

SHA256 da fonte privada: `A6E67A59BE68309C101F7449A1B2946EF03C051772292C940EC44890DCF28A7F`.

[Índice de evidências](README.md).
