# IAM-002 — Gabriela no Entra antes do Mover

Guia de leitura preparado em 06/10/2026 a partir das fontes históricas abaixo. Não é nova coleta nem reexecução do comparador. Este documento reúne somente os resultados de Gabriela, EMP0007, para acompanhar o estado anterior à mudança de 28/09.

## 09 — Associação de Suporte

[Captura de grupos de Gabriela em 23/09](../inventario-entra-2026-09-23/04-gabriela-grupos.png): GG_SUP_TICKET visível na conta. Data de coleta informada pelo operador, sem horário interno. Prova associação no Entra; não acesso ao arquivo SuporteLab do AD.

## 10 — Primeira comparação cadastral

Comparação executada em 23/09, com o CSV Entra de 22/09 e RH então vigente em Suporte. A [captura do resultado](../reconciliacao-2026-09-23/01-resultado-reconciliacao-entra.png) mostra 16:57:25 UTC−03:00; considerar as duas linhas EMP0007.

| Regra de Gabriela | Esperado | Observado | Resultado |
|---|---|---|---|
| Conta habilitada | True | True | CONFORME |
| Departamento | Suporte | Suporte | CONFORME |

Fonte dos valores: [CSV original compartilhado](../reconciliacao-2026-09-23/reconciliacao-entra.csv), filtro de leitura `Matricula = EMP0007`. A exceção de Carla presente no mesmo arquivo pertence ao IAM-003, não ao Mover.

## 11 — Conferência posterior ainda em Suporte

Nova comparação com CSV Entra de 23/09: Gabriela permanece True/True e Suporte/Suporte, nas mesmas duas regras. Fonte: [CSV original posterior](../IAM-003/07-reconciliacao-pos-leaver.csv), somente linhas EMP0007. Ele também contém o resultado do Leaver de Carla, por isso é reutilizado como fonte, sem repetir a narrativa daquele ticket aqui.

O Object ID de Gabriela nos dois relatórios é `2d5bee1a-e26c-47ef-bea2-a55a2fd8614d`. Nenhuma dessas comparações concedeu acesso ou executou o Mover. Os CSVs não comparam grupos, aplicações, AD, sessões ou acesso a arquivos. A prova 09 consulta associação separadamente.

## Continuação do caso

Em 28/09, a [nova fonte de RH](12-fonte-rh-mover-2026-09-28.csv) passa a indicar Financeiro. A [execução do Mover](README.md#execução-e-fechamento--2809) e a [comparação final](23-comparacao-final.md) possuem fontes e provas próprias. Não usar os resultados históricos acima como estado final.
