# IAM-003 — Reconciliação posterior e fechamento

Após as mudanças, uma nova comparação entre o RH e a exportação do Entra de **23/09/2026** confirmou **três verificações conformes e zero exceções**. Foram mantidas as regras da comparação inicial.

| Pessoa/regra | Antes — CSV 22/09 | Depois — CSV 23/09 | Resultado posterior |
|---|---|---|---|
| Carla / habilitação | Esperado False, observado True | Esperado False, observado False | CONFORME |
| Gabriela / habilitação | True / True | True / True | CONFORME |
| Gabriela / departamento | Suporte / Suporte | Suporte / Suporte | CONFORME |

[CSV posterior](07-reconciliacao-pos-leaver.csv). Carla passou a corresponder ao RH desligado; Gabriela permanece habilitada em Suporte. Relatório anterior preservado e mesmos Object IDs mantidos.

## Validação complementar

- Habilitação: nova exportação, perfil e auditoria de AccountEnabled true → false.
- Associação financeira: Remove member from group para Carla/GG_FIN_READ e tela Groups sem associações. Verificação separada; o CSV de usuários não contém grupos.
- Revogação: atualização auditada de StsRefreshTokensValidFrom. Sem inferência de encerramento universal de sessões próprias de aplicações.
- Nova entrada: 50057 por conta desabilitada, às 17:29:19 UTC−03:00, com captura complementar.

**Critério atendido no escopo:** conta desabilitada, associação financeira retirada, revogação registrada, nova entrada bloqueada e exceção cadastral corrigida. Conta mantida no diretório; exclusão não integra o fechamento. AD independente e aplicações financeiras não integradas estão fora do teste.

## Integridade

| Fonte/resultado | SHA256 |
|---|---|
| RH vigente preservado | `532D4EB71ACF3DCBFE7C8BF94848FE1112F21A58D5501D64695B2F296D45B510` |
| exportUsers_2026-9-23.csv — privado | `C40A2BC7C2A2F0FC9F2DFF05CD3A7657AF86114F65A9A14FA7B037D4431CF2AA` |
| 07-reconciliacao-pos-leaver.csv | `2D01B6829E003453FFAD3C43804AE76EC29679E59E9C4731E53431BAE624829F` |

[Índice](README.md).
