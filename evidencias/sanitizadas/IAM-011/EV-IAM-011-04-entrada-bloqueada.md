# IAM-011 — Entrada negada por conta desabilitada

| Campo | Resultado observado |
|---|---|
| Usuário | Ana Ribeiro (EMP0001, correlacionada com o inventário pelo UPN) |
| Data/hora UTC | 2026-09-14T19:18:05Z |
| Brasília | 14/09/2026 16:18:05 (UTC−03:00) |
| Aplicação | My Profile |
| Status | Failure |
| Sign-in error code | 50057 |
| Failure reason | The user account is disabled. |
| Authentication method | Password |
| Authentication method detail | Password in the cloud |
| Succeeded | false |
| Result detail | User account is disabled. The account has been disabled by an administrator. |

Os dois arquivos contêm uma linha e o mesmo Request ID, conferido nos originais. O controle de bloqueio impediu esta entrada. Não houve autenticação bem-sucedida, teste de acesso ao relatório ou comprovação de troca de senha.

Origens e SHA-256:

- `InteractiveSignIns_2026-09-13_2026-09-14.csv`: `1d6caa8955f3651d4281c6d609cf84b72641a0575be218da3a994fe6d24efa8f`.
- `InteractiveSignIns_AuthDetails_2026-09-13_2026-09-14.csv`: `970d9865958eb67d29699786cec4e0fe078a71f2592ee0e9f47ac87ccc309921`.

Identificadores, UPN e dados de rede foram omitidos. O exportador repetiu o cabeçalho Incoming token type no CSV principal; a leitura preservou o original e utilizou os campos acima, que não têm nomes duplicados.
