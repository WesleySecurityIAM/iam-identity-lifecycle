# IAM-007 — Cadastro, estado e uso de MFA de Felipe

**Resultado da verificação em 08/09/2026:** cadastro e uso de MFA de Felipe (EMP0006) localizados em eventos de **03/09**; Authenticator utilizável na consulta de **08/09**. Ticket resolvido sem novo cadastro ou alteração de configuração.

## Provas em ordem cronológica

| Etapa | Prova | O que demonstra |
|---|---|---|
| 1. Cadastro — 03/09, 20:19:20 UTC | [02 — Auditoria do cadastro](EV-IAM-007-02-cadastro-authenticator.md) | Duas atualizações bem-sucedidas incluíram dados do aplicativo e dos métodos em propriedades antes vazias. |
| 2. Uso — 03/09, 20:34:08 UTC | [03 — Evento de uso](03-uso-mfa.md) | My Signins com êxito, notificação de aplicativo móvel e `MFA completed in Azure AD`. |
| 3. Estado — consulta em 08/09 | [01 — Método atual](EV-IAM-007-01-metodo-atual.md) | Authenticator utilizável; dispositivo identificado como iPhone 12; notificação como padrão. |

Cadastro, estado consultado e uso são comprovados por registros distintos. Eles não demonstram uma política que exija MFA em todos os acessos. Os limites de identificação do aparelho, do ator e das propriedades constam nas respectivas provas.

[Ticket IAM-007](../../../00-operacao-itsm/05-fila-tickets.md#iam-007).
