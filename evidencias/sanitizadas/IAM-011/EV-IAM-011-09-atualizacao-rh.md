# IAM-011 — Atualização do cadastro fictício de RH

Em 18/09/2026, a pedido do operador Wesley, foi criada uma nova versão da fonte fictícia de RH de 29/08. A única alteração de conteúdo é o status de EMP0001, Ana Ribeiro: **PRE_ADMISSAO → ATIVO**. A admissão permanece em 15/09/2026.

| Versão | Papel |
|---|---|
| [RH de 29/08](EV-IAM-011-07-rh-2026-08-29.csv) | Cópia integral preservada do estado histórico. |
| [RH atualizado em 18/09](EV-IAM-011-08-rh-2026-09-18.csv) | Nove registros fictícios; somente o status de Ana foi alterado. |

Esta atualização manual simulada alinha o cadastro ao resultado da ativação já demonstrada pelas evidências 05 e 06. Não é exportação de um sistema de RH, nem prova de atualização do RH em 15/09. Os demais oito registros foram copiados sem nova validação do estado atual.

Validação: comparação por employee_id; nove registros nas duas versões; somente EMP0001/status difere. O arquivo original de 29/08 foi preservado e o fechamento histórico do ticket permanece em 15/09.

[Ticket IAM-011](../../../00-operacao-itsm/05-fila-tickets.md#iam-011).
