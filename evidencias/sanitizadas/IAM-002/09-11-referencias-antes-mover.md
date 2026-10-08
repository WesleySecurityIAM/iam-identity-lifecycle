# IAM-002 — Gabriela no Entra antes do Mover

Recorte documental de **EMP0007 — Gabriela Santos**, preparado em 06/10/2026 a partir das coletas de setembro; sem nova coleta ou reexecução. Object ID nos dois relatórios: `2d5bee1a-e26c-47ef-bea2-a55a2fd8614d`.

## 09 — Associação em 23/09

[Captura de grupos de Gabriela](../inventario-entra-2026-09-23/04-gabriela-grupos.png): GG_SUP_TICKET presente. Coleta de 23/09 informada pelo operador, sem horário interno. Comprova associação no Entra, sem teste de acesso a recurso.

## 10–11 — Comparações em 23/09

| Regra de Gabriela | Esperado | CSV Entra 22/09 — prova 10 | CSV Entra 23/09 — prova 11 |
|---|---|---|---|
| Conta habilitada | True | True — CONFORME | True — CONFORME |
| Departamento | Suporte | Suporte — CONFORME | Suporte — CONFORME |

O comparador consultou habilitação e departamento; não verificou grupos, AD, aplicações ou sessões. Esses resultados antecedem o Mover de 28/09.

<details>
<summary>Origens compartilhadas — consultar somente EMP0007</summary>

- Prova 10: [CSV original](../reconciliacao-2026-09-23/reconciliacao-entra.csv) e [captura da execução em 23/09 às 16:57:25 UTC−03:00](../reconciliacao-2026-09-23/01-resultado-reconciliacao-entra.png), usando RH então vigente e CSV Entra de 22/09.
- Prova 11: [CSV posterior](../IAM-003/07-reconciliacao-pos-leaver.csv), usando a exportação Entra de 23/09.

</details>

[Voltar à sequência de evidências](README.md).
