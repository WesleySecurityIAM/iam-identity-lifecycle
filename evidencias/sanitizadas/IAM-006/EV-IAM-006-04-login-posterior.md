# EV-IAM-006-04 — Validação do acesso posterior

- Ticket: IAM-006
- Identidade: EMP0006 — Felipe Gomes
- Fonte: logs de entrada do Microsoft Entra ID
- Horário utilizado: UTC

| Data/hora UTC | Aplicativo | Status | Código | Detalhe |
|---|---|---|---:|---|
| 2026-09-03T20:33:27Z | My Profile | Êxito | Não preenchido | Primeiro login bem-sucedido após a alteração obrigatória |
| 2026-09-03T20:33:43Z | My Signins | Êxito | Não preenchido | First factor requirement satisfied by claim in the token |
| 2026-09-03T20:34:08Z | My Signins | Êxito | Não preenchido | MFA completed in Azure AD |

## Resultado

Após a alteração de senha registrada em 2026-09-03T20:33:21Z,
foram confirmadas três entradas com status Êxito:

- 20:33:27Z — My Profile: primeira entrada bem-sucedida após a alteração.
- 20:33:43Z — My Signins: primeiro fator satisfeito por uma informação
  já presente no token, sem indicar nova digitação da senha.
- 20:34:08Z — My Signins: MFA concluído por notificação de aplicativo móvel.

Os registros comprovam o restabelecimento da autenticação nos aplicativos
listados, mas não comprovam acesso ao sistema financeiro.

O uso do MFA também será referenciado no IAM-007, separado da comprovação
do cadastro do método.

## Limitações

- o evento das 20:33:27Z não apresentou uma etapa correspondente no arquivo de detalhes de autenticação;
- a entrada com MFA comprova seu uso, mas não comprova quando o método foi cadastrado;
- o cadastro do método MFA será documentado no IAM-007;
- IP, UPN, Request ID, Correlation ID e Session ID foram removidos.
