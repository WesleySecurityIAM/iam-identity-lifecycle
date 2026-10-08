# IAM-003 — Auditoria das ações sobre Carla

Origem: `AuditLogs_2026-09-23.json`, privado, 17 registros. Recorte: cinco eventos de EMP0003 em targetResources, todos result=success em 23/09/2026. Eventos pareados representam três ações.

| UTC — activityDateTime | Brasília (UTC−03:00) | activityDisplayName | Propriedade e resultado |
|---|---|---|---|
| 20:10:26.8440604Z | 17:10:26 | Disable account | AccountEnabled: `[true]` → `[false]` |
| 20:10:26.8450568Z | 17:10:26 | Update user | Mesma alteração de AccountEnabled |
| 20:15:36.8098081Z | 17:15:36 | Update StsRefreshTokenValidFrom Timestamp | StsRefreshTokensValidFrom: `2026-09-21T14:59:32Z` → `2026-09-23T20:15:36Z` |
| 20:15:36.8108078Z | 17:15:36 | Update user | Mesma atualização do marco de validade |
| 20:17:18.2094674Z | 17:17:18 | Remove member from group | Alvos User/Group; Group.DisplayName: `GG_FIN_READ` → null |

O alvo User corresponde ao perfil e à reconciliação de Carla; a remoção também identifica o grupo. Mesmo ID de executor nos cinco eventos. UPN, IP e identificadores de eventos/correlação permanecem privados.

A atualização de StsRefreshTokensValidFrom sustenta a ação de revogação dos refresh tokens anteriores. Não demonstra término imediato de sessões próprias de todas as aplicações. A [entrada posterior bloqueada](06-sign-in-bloqueado.md) é uma verificação separada.

A decisão simulada foi registrada às 17:10, com consulta de relógio às 17:10:52; o bloqueio auditado ocorreu às 17:10:26. O registro não comprova aprovação anterior ao bloqueio.

SHA256 da fonte privada: `A6E67A59BE68309C101F7449A1B2946EF03C051772292C940EC44890DCF28A7F`.

[Índice de evidências](README.md).
