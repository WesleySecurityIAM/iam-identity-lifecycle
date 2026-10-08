# EV-IAM-006-01 — Eventos de entrada interrompidos

- Ticket: IAM-006
- Identidade: EMP0006 — Felipe Gomes
- Fonte: logs de entrada do Microsoft Entra ID
- Período analisado: 2026-09-03
- Horário utilizado: UTC

| Evento | Data/hora UTC | Código | Status | Razão | Aplicativo |
|---|---|---:|---|---|---|
| A | 2026-09-03T19:52:21Z | 50055 | Interrompido | The password is expired. | My Profile |
| B | 2026-09-03T20:01:38Z | 50055 | Interrompido | The password is expired. | My Profile |
| C | 2026-09-03T20:32:12Z | 50055 | Interrompido | The password is expired. | My Profile |

## Resultado

Três entradas interativas interrompidas por expiração da senha (50055).

## Limitações

- IP, UPN e identificadores técnicos foram removidos;
- os arquivos brutos permanecem no cofre privado;
- esta evidência comprova a interrupção da autenticação, mas não comprova acesso a um sistema financeiro.

[Voltar à sequência de evidências](README.md).
