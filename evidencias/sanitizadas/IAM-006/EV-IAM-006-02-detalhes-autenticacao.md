# EV-IAM-006-02 — Detalhes da autenticação

- Ticket: IAM-006
- Identidade: EMP0006 — Felipe Gomes
- Fonte: detalhes de autenticação dos logs de entrada
- Horário utilizado: UTC

| Evento | Data/hora UTC | Método | Detalhe do método | Êxito | Resultado |
|---|---|---|---|---|---|
| A | 2026-09-03T19:52:21Z | Password | Password in the cloud | true | Correct password |
| B | 2026-09-03T20:01:38Z | Password | Password in the cloud | true | Correct password |
| C | 2026-09-03T20:32:12Z | Password | Password in the cloud | true | Correct password |

## Resultado

Os detalhes de autenticação registraram “Correct password” e êxito
da etapa de senha nos três eventos.

Nos logs de entrada correspondentes, correlacionados pelo Request ID,
constam código 50055 e razão “The password is expired.”, conforme
a EV-IAM-006-01.

Portanto, a senha apresentada foi aceita, mas o login completo
foi interrompido porque ela estava expirada.

## Limitações

- o valor `true` representa o êxito da etapa de validação da senha, não do login completo;
- Request IDs e demais identificadores técnicos foram removidos;
- os arquivos brutos permanecem no cofre privado.
