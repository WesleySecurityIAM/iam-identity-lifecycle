# IAM-003 — Reconciliação posterior e fechamento

Após as mudanças, uma nova comparação entre o RH e a exportação do Entra de **23/09/2026** confirmou Carla desabilitada conforme o RH. Foi mantida a regra da comparação inicial. Este é o resultado cadastral que pertence ao IAM-003:

| Pessoa/regra | Antes — CSV 22/09 | Depois — CSV 23/09 | Resultado posterior |
|---|---|---|---|
| Carla / habilitação | Esperado False, observado True | Esperado False, observado False | CONFORME |

Carla passou a corresponder ao RH desligado, preservando o Object ID da conta. O relatório anterior também foi preservado. A comparação cadastral não verifica grupos, sessões ou acesso a aplicações.

## Validação complementar

- Habilitação: nova exportação, [perfil desabilitado](02-carla-conta-desabilitada.png) e [auditoria](05-auditoria-leaver.md) de AccountEnabled true → false.
- Associação financeira: Remove member from group para Carla/GG_FIN_READ na auditoria e [tela Groups sem associações](03-carla-sem-grupos.png). Verificação separada; o CSV de usuários não contém grupos.
- Revogação: atualização auditada de StsRefreshTokensValidFrom. Sem inferência de encerramento universal de sessões próprias de aplicações.
- Nova entrada: [sign-in 50057](06-sign-in-bloqueado.md) por conta desabilitada, às 17:29:19 UTC−03:00, com captura complementar.

**Critério atendido no escopo:** conta desabilitada, associação financeira retirada, revogação registrada, nova entrada bloqueada e exceção cadastral corrigida. Conta mantida no diretório; exclusão não integra o fechamento. AD independente e aplicações financeiras não integradas estão fora do teste.

<details>
<summary>Origem compartilhada do CSV — somente para conferir a fonte</summary>

O [CSV preservado](07-reconciliacao-pos-leaver.csv) tem três linhas: uma regra de Carla e duas de Gabriela ainda em Suporte. Para este ticket, consultar **EMP0003**. O total da execução foi três conformes/zero exceções, mas somente a regra False/False de Carla sustenta esta reconciliação de Leaver. As linhas EMP0007 são tratadas no [histórico de Gabriela](../IAM-002/09-11-referencias-antes-mover.md); não representam ações sobre Carla.

</details>

## Integridade

| Fonte/resultado | SHA256 |
|---|---|
| RH vigente preservado | `532D4EB71ACF3DCBFE7C8BF94848FE1112F21A58D5501D64695B2F296D45B510` |
| exportUsers_2026-9-23.csv — privado | `C40A2BC7C2A2F0FC9F2DFF05CD3A7657AF86114F65A9A14FA7B037D4431CF2AA` |
| 07-reconciliacao-pos-leaver.csv | `2D01B6829E003453FFAD3C43804AE76EC29679E59E9C4731E53431BAE624829F` |

[Índice](README.md).
