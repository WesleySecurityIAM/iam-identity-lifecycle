# EV-IAM-011-06 — Entrada após ativação e troca de senha

- Identidade: Ana Ribeiro — EMP0001, correlacionada com a auditoria pelo identificador da conta.
- Origem: `InteractiveSignIns_2026-09-14_2026-09-15.json`, Microsoft Entra ID. Original privado preservado.
- Período: 14 e 15/09/2026; três eventos interativos.

## Resultado

| Data/hora UTC | Brasília (UTC−03:00) | Aplicação | Resultado geral |
|---|---|---|---|
| 2026-09-14T19:18:05Z | 14/09 16:18:05 | My Profile | 50057: conta desabilitada; entrada negada. |
| 2026-09-15T14:37:59Z | 15/09 11:37:59 | Azure Portal | 50055: senha expirada/exigindo troca; entrada interrompida. |
| 2026-09-15T14:40:18Z | 15/09 11:40:18 | Azure Portal | 0: entrada bem-sucedida, com MFA concluído. |

No evento intermediário, Password in the cloud apresentou succeeded=true e Correct password. Isso confirma a etapa de senha, mas não o sucesso da entrada, que foi interrompida com 50055.

No evento final, status.errorCode=0, authenticationRequirement=multiFactorAuthentication e authenticationDetails registra succeeded=true com MFA completed in Azure AD. O campo failureReason contém Other.; ele não representa falha de entrada diante de errorCode=0. authenticationMethod está null.

A auditoria (evidência 05) registra a troca de senha às 11:38:51 e o cadastro do Authenticator antes dessa entrada. A sequência sustenta o encerramento da ativação com troca obrigatória cumprida e entrada positiva.

## Limitações

O evento final comprova MFA concluído, mas não especifica notificação push nem o aparelho que aprovou. O teste positivo ocorreu no Azure Portal; não comprova entrada positiva no My Profile, autorização para administrar recursos Azure ou acesso ao relatório financeiro do AD.

UPNs, IPs e identificadores de correlação/sessão foram omitidos. O manifesto privado preserva as origens e SHA-256.
