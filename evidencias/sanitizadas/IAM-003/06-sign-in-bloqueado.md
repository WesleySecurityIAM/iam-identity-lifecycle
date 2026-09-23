# IAM-003 — Nova entrada bloqueada

Fonte privada: `InteractiveSignIns_2026-09-22_2026-09-23.json`, três registros. Um evento corresponde ao userId de Carla, conferido contra seu perfil.

| Campo | Valor observado |
|---|---|
| Identidade correlacionada | EMP0003 — Carla Mendes |
| createdDateTime | `2026-09-23T20:29:19Z` — 17:29:19 UTC−03:00 |
| appDisplayName / resourceDisplayName | AMC PROD / AMC PROD |
| status.errorCode | `50057` |
| status.failureReason | The user account is disabled. |
| authenticationDetails.authenticationMethod | Password |
| authenticationDetails.authenticationMethodDetail | Password in the cloud |
| authenticationDetails.succeeded | false |
| authenticationDetails.authenticationStepResultDetail | User account is disabled. The account has been disabled by an administrator. |

**Resultado:** entrada bloqueada por conta desabilitada, após as alterações auditadas. Não é interpretada como senha incorreta nem como validação bem-sucedida da senha.

A [captura da mensagem](04-entrada-bloqueada.png) mostra Carla e indicação de bloqueio, sem horário interno. A hora exata vem do log. O nome técnico da aplicação foi preservado como AMC PROD.

O teste comprova uma nova tentativa bloqueada, não encerramento de toda sessão anterior ou negação de acesso a arquivo financeiro. A conta foi desabilitada, não excluída. O [significado oficial de AADSTS50057](https://learn.microsoft.com/en-us/troubleshoot/entra/entra-id/app-integration/error-code-aadsts50057-user-account-is-disabled) é compatível com o resultado observado.

SHA256 da fonte privada: `628948E68E48FD9CD43420388754E068B1892B79A7C367F52575D0441EC9AA98`.

[Índice de evidências](README.md).
