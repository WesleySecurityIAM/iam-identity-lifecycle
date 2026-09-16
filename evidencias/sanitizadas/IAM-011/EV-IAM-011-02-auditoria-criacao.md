# IAM-011 — Auditoria de criação

Eventos de Ana no Entra, identificados no original pelo UPN da conta. Aprovações de negócio não são comprovadas por estes eventos.

| Data/hora UTC | Atividade | Resultado |
|---|---|---|
| 2026-09-14T18:24:46.0013757+00:00 | Add user | Success |
| 2026-09-14T18:24:45.7423764+00:00 | Update PasswordProfile | Success |

Horários aproximados em Brasília: 15:24:45 para Update PasswordProfile e 15:24:46 para Add user, em 14/09/2026. Não inferir uma redefinição manual separada somente pela presença de Update PasswordProfile na criação.

Origem: `AuditLogs_2026-09-14.csv`. SHA-256: `bdaf67abdb9deec11483fd77d2faa8b29700f08c1d2c14682cccafa765422b1b`.
Identificadores, conta administrativa e IP foram omitidos desta transcrição sanitizada.
