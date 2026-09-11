# EV-IAM-006-03 — Eventos relacionados à senha

- Ticket: IAM-006
- Identidade: EMP0006 — Felipe Gomes
- Fonte: logs de auditoria do Microsoft Entra ID
- Serviço: Self-service Password Management
- Categoria: UserManagement
- Horário utilizado: UTC

| Data/hora UTC | Atividade | Status | Razão | Iniciado por | Destino |
|---|---|---|---|---|---|
| 2026-09-03T19:55:48Z | Change password (self-service) | Falha | PasswordDoesnotComplyFuzzyPolicy | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T19:57:53Z | Change password (self-service) | Falha | PasswordDoesnotComplyFuzzyPolicy | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T19:58:30Z | Change password (self-service) | Falha | PasswordDoesnotComplyFuzzyPolicy | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T20:02:07Z | Change password (self-service) | Falha | PasswordDoesnotComplyFuzzyPolicy | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T20:05:21Z | Change password (self-service) | Falha | PasswordDoesnotComplyFuzzyPolicy | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T20:12:18Z | Change password (self-service) | Êxito | None | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T20:14:27Z | Self-service password reset flow activity progress | Êxito | User submitted their user ID | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T20:14:27Z | Self-service password reset flow activity progress | Falha | Password reset is not enabled for this user | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |
| 2026-09-03T20:29:54Z | Reset password (by admin) | Êxito | Successfully completed reset. | ADMIN-LAB-001 (Administrador Global) | EMP0006 — Felipe Gomes |
| 2026-09-03T20:33:21Z | Change password (self-service) | Êxito | None | EMP0006 — Felipe Gomes | EMP0006 — Felipe Gomes |

## Resultado

As primeiras tentativas de alteração foram recusadas pela política de senha.
Uma alteração foi concluída às 20:12:18Z.

Posteriormente, EMP0006 iniciou um fluxo de recuperação, mas a redefinição por
autoatendimento não estava habilitada. Às 20:29:54Z, ADMIN-LAB-001 realizou
uma redefinição administrativa. Às 20:33:21Z, EMP0006 concluiu a alteração
obrigatória da senha temporária.

## Limitações

- os nomes das atividades e os resultados foram preservados conforme os logs;
- as identidades foram substituídas por identificadores sanitizados;
- nenhuma senha temporária ou definitiva foi documentada;
- IDs técnicos, IP e UPN foram removidos.