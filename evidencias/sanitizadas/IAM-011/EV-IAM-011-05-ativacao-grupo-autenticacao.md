# EV-IAM-011-05 — Ativação, grupo e cadastro de autenticação

- Identidade: Ana Ribeiro — EMP0001, correlacionada pelo Object ID com o evento de criação.
- Origem: `AuditLogs_2026-09-15-ana.json`, Microsoft Entra ID. Original privado preservado.
- Período: 14 e 15/09/2026. Horários abaixo em Brasília (UTC−03:00), sem frações de segundo.

## Resultado

| Data/hora Brasília | Evento/propriedade | Resultado observado |
|---|---|---|
| 14/09 15:24:46 | Add user | Conta criada com AccountEnabled=false, EMP0001, Analista Financeiro e Financeiro. |
| 15/09 11:30:41 | Enable account / Update user | Success; AccountEnabled mudou de false para true. |
| 15/09 11:33:44 | Add member to group | Success; Ana incluída no GG_FIN_READ. |
| 15/09 11:38:51 | Change password (self-service) / Change user password | Success; alteração de senha pela identidade Ana. |
| 15/09 11:38:51 | Update PasswordProfile | Success; ForceChangePassword mudou de True para False. |
| 15/09 11:39:49 | Update user | Success; StrongAuthenticationPhoneAppDetail e StrongAuthenticationMethod passaram de listas vazias a dados cadastrados; aplicativo identificado como Authenticator. |
| 15/09 11:40:18 | User registered all required security info | Success; cadastro das informações exigidas concluído. |

Os eventos de habilitação e inclusão no grupo identificam a conta administrativa do operador como iniciadora. Registros técnicos relacionados à mesma alteração não são contados como novas ações independentes. A mudança de ForceChangePassword acompanha a troca bem-sucedida, não uma dispensa manual comprovada da exigência.

## Limitações

A auditoria comprova alterações nos horários registrados, não uma nova consulta do inventário após todos os eventos. Aprovação de RH/gestor é simulação registrada no ticket. Associação ao grupo no Entra não comprova acesso ao relatório do AD. Cadastro do Authenticator não comprova, isoladamente, uso em uma entrada: consultar a evidência 06.

UPNs, IPs, identificadores de objeto/sessão e dados técnicos do dispositivo/token foram omitidos. SHA-256 e caminhos de origem constam apenas no manifesto privado dos brutos.
