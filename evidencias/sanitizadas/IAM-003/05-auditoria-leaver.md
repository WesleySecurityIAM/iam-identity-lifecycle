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

<a id="revogacao"></a>

## Como identificar e interpretar a revogação

No evento **Update StsRefreshTokenValidFrom Timestamp**, confirme Carla em `targetResources`, `result=success` e a propriedade **StsRefreshTokensValidFrom**. O valor avançou para `2026-09-23T20:15:36Z` (**17:15:36 UTC−03:00**): um novo marco de validade para os tokens de renovação. STS refere-se ao serviço de emissão de tokens; *timestamp* é a data/hora desse marco.

O refresh token permite obter novos tokens de acesso sem pedir a senha a cada operação. A revogação invalida tokens de renovação anteriores e sessões de autenticação do Entra, exigindo nova autenticação quando a aplicação voltar ao provedor. Pode haver alguns minutos de propagação. [Microsoft Graph — revokeSignInSessions](https://learn.microsoft.com/en-us/graph/api/user-revokesigninsessions?view=graph-rest-1.0).

**Se uma aplicação já estiver aberta, esse evento não prova que ela fechou ou perdeu acesso imediatamente.** Um token de acesso ainda válido ou uma sessão própria da aplicação pode continuar até expiração/reavaliação ou revogação pela própria aplicação. [Microsoft — limites e revogação de acesso](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access).

No caso de Carla, o evento sustenta a ação administrativa de revogação. O bloqueio da conta impede uma nova entrada; a [tentativa posterior negada, com log e captura](06-sign-in-bloqueado.md), comprova esse controle separado. Não foi testado o encerramento de todas as sessões anteriores.

A decisão simulada foi registrada às 17:10, com consulta de relógio às 17:10:52; o bloqueio auditado ocorreu às 17:10:26. O registro não comprova aprovação anterior ao bloqueio.

SHA256 da fonte privada: `A6E67A59BE68309C101F7449A1B2946EF03C051772292C940EC44890DCF28A7F`.

[Índice de evidências](README.md).
