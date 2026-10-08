# IAM-003 — Reconciliação posterior e fechamento

Comparação do RH com a exportação Entra de **23/09/2026**, mantendo a regra inicial e o Object ID da conta de Carla (EMP0003):

| Regra | Antes — CSV 22/09 | Depois — CSV 23/09 | Resultado posterior |
|---|---|---|---|
| Conta habilitada conforme RH | False esperado / True observado | False esperado / False observado | CONFORME |

A exceção cadastral foi corrigida; conta mantida no diretório, sem exclusão. O CSV de usuários não verifica grupos, sessões ou aplicações.

As demais condições de fechamento têm provas próprias: [perfil desabilitado](02-carla-conta-desabilitada.png), [auditoria de bloqueio, revogação e retirada de GG_FIN_READ](05-auditoria-leaver.md), [consulta sem grupos](03-carla-sem-grupos.png) e [nova entrada bloqueada às 17:29:19 UTC−03:00](06-sign-in-bloqueado.md). Revogação não comprova encerramento universal das sessões; código 50057 não valida a senha.

<details>
<summary>Origem compartilhada e integridade — consultar somente EMP0003</summary>

[CSV preservado](07-reconciliacao-pos-leaver.csv): somente a linha EMP0003 sustenta o resultado acima. As outras duas linhas estão documentadas no [histórico de Gabriela](../IAM-002/09-11-referencias-antes-mover.md).

| Fonte/resultado | SHA256 |
|---|---|
| RH vigente preservado | `532D4EB71ACF3DCBFE7C8BF94848FE1112F21A58D5501D64695B2F296D45B510` |
| exportUsers_2026-9-23.csv — privado | `C40A2BC7C2A2F0FC9F2DFF05CD3A7657AF86114F65A9A14FA7B037D4431CF2AA` |
| 07-reconciliacao-pos-leaver.csv | `2D01B6829E003453FFAD3C43804AE76EC29679E59E9C4731E53431BAE624829F` |

</details>

[Índice de evidências](README.md).
