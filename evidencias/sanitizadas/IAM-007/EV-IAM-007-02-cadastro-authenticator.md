# EV-IAM-007-02 — Registro do Microsoft Authenticator

- Ticket: IAM-007
- Identidade: EMP0006 — Felipe Gomes
- Fonte: logs de auditoria do Microsoft Entra ID
- Arquivo bruto: AuditLogs_2026-09-08.csv
- Data da coleta: 2026-09-08
- Armazenamento bruto: cofre local privado
- Horários dos eventos: UTC

## Eventos identificados

| Data/hora UTC | Atividade | Propriedade alterada | Resultado |
|---|---|---|---|
| 2026-09-03T20:19:20.4121854Z | Update user | StrongAuthenticationPhoneAppDetail | Success |
| 2026-09-03T20:19:20.8079706Z | Update user | StrongAuthenticationMethod | Success |

## Alterações observadas

| Propriedade | Valor anterior | Novo valor — resumo sanitizado |
|---|---|---|
| StrongAuthenticationPhoneAppDetail | [] — lista vazia | Aplicativo identificado como Authenticator; dispositivo “iPhone 12”. |
| StrongAuthenticationMethod | [] — lista vazia | MethodType 6, Default true; MethodType 7, Default false. |

- MethodType 6: notificação do aplicativo, definida como padrão.
- MethodType 7: código de uso único do aplicativo, sem definição como padrão.
- Ator registrado: Azure MFA StrongAuthenticationService.

## Resultado

Os dois eventos registram a inclusão dos dados do aplicativo
e dos métodos de autenticação na identidade de EMP0006 em
03/09/2026, às 20:19:20 UTC, com sucesso.

A notificação foi definida como método padrão. O código do
aplicativo também foi registrado como alternativa.

## Limitações

- Os valores anteriores vazios referem-se às propriedades
  registradas; não comprovam ausência de todo tipo de autenticação.
- O ator identifica o serviço que gravou as alterações,
  não a pessoa que operou o celular.
- Os eventos comprovam alterações no cadastro, não o uso em um login.
- DeviceToken, UPN e identificadores técnicos foram omitidos
  desta versão pública.
