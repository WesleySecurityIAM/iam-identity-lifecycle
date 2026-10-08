# Auditoria do Mover no Entra — 28/09/2026

Recorte de três eventos de Gabriela, Object ID `2d5bee1a-e26c-47ef-bea2-a55a2fd8614d`. Resultado `success` em todos. Horário de Brasília = UTC−03:00. IP, dados de sessão/token, user-agent e dados pessoais do executor omitidos; original integral privado.

## 11:56:12 — Remove member from group

- UTC: `2026-09-28T14:56:12.8804785Z`
- Event ID: `Directory_d020e1f5-e637-4a63-945e-3e55b0687857_RTYP2_376371823`
- Correlation ID: `d020e1f5-e637-4a63-945e-3e55b0687857`
- Alvo: Gabriela Santos, EMP0007.
- Group.ObjectID: `"b60d7404-fb80-46f0-807e-15f235bc9b19"` → `None`.
- Group.DisplayName: `"GG_SUP_TICKET"` → `None`.

## 11:58:04 — Update user

- UTC: `2026-09-28T14:58:04.1502027Z`
- Event ID: `Directory_397f5f21-d20b-4dee-967f-dde5d9a9f149_0Y6KA_21105449`
- Correlation ID: `397f5f21-d20b-4dee-967f-dde5d9a9f149`
- Alvo: Gabriela Santos, EMP0007.
- Department: `["Suporte"]` → `["Financeiro"]`.
- JobTitle: `["Analista de Suporte"]` → `["Analista Financeiro"]`.

## 11:58:42 — Add member to group

- UTC: `2026-09-28T14:58:42.371507Z`
- Event ID: `Directory_533de902-2728-4f05-b2f1-5506a7fbfd1c_S2JIM_330444631`
- Correlation ID: `533de902-2728-4f05-b2f1-5506a7fbfd1c`
- Alvo: Gabriela Santos, EMP0007.
- Group.ObjectID: `None` → `"b2ae25fe-3f5a-46da-a763-9cbec8693bee"`.
- Group.DisplayName: `None` → `"GG_FIN_READ"`.

A remoção de Suporte precede a inclusão em Financeiro. Esses eventos comprovam operações de diretório; não comprovam acesso a uma aplicação nem revogação de todos os tokens.

[Voltar à sequência de evidências](README.md).
