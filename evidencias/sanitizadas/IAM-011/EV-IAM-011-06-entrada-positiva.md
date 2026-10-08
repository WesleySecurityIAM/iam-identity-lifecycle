# EV-IAM-011-06 — Entrada após ativação e troca de senha

- Identidade: Ana Ribeiro — EMP0001, correlacionada com a auditoria pelo identificador da conta.
- Origem: `InteractiveSignIns_2026-09-14_2026-09-15.json`, Microsoft Entra ID. Original privado preservado.
- Recorte desta evidência: duas tentativas de 15/09/2026. O bloqueio pré-admissão de 14/09 pertence à evidência 04, preservado no mesmo arquivo bruto.

<a id="tentativa-intermediaria"></a>

## 1. Tentativa intermediária — antes de concluir a troca

| UTC | Brasília (UTC−03:00) | Aplicação | Resultado |
|---|---|---|---|
| 2026-09-15T14:37:59Z | 15/09 11:37:59 | Azure Portal | 50055: senha expirada/exigindo troca; entrada interrompida. |

Password in the cloud apresentou succeeded=true e Correct password. A senha foi aceita, mas a entrada não terminou. A [auditoria 05](EV-IAM-011-05-ativacao-grupo-autenticacao.md#senha-e-cadastro) registra depois a troca às 11:38:51 e o cadastro de autenticação.

<a id="entrada-positiva"></a>

## 2. Entrada positiva — após cumprir os requisitos

| UTC | Brasília (UTC−03:00) | Aplicação | Resultado |
|---|---|---|---|
| 2026-09-15T14:40:18Z | 15/09 11:40:18 | Azure Portal | errorCode=0: entrada bem-sucedida; MFA completed in Azure AD. |

authenticationRequirement=multiFactorAuthentication; authenticationDetails.succeeded=true. O campo failureReason contém Other.; ele não representa falha diante de errorCode=0. authenticationMethod está null. Esta entrada sustenta o resultado após a troca e o cadastro.

## Limitações

O evento final comprova MFA concluído, mas não especifica notificação push nem o aparelho que aprovou. O teste positivo ocorreu no Azure Portal; não comprova entrada positiva no My Profile, autorização para administrar recursos Azure ou acesso ao relatório financeiro do AD.

UPNs, IPs e identificadores de correlação/sessão foram omitidos. O manifesto privado preserva as origens e SHA-256.

[Voltar à sequência de evidências](README.md).
