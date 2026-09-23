# IAM-003 — Leaver de Carla

**Fechado em 23/09/2026.** Conta desabilitada, associação financeira removida, revogação registrada e nova entrada bloqueada. Comparação posterior: três verificações conformes e zero exceções no escopo cadastral.

## Antes e depois

Antes: RH desligado, conta habilitada e GG_FIN_READ presente. Depois: Account enabled = No, Groups sem associações e sign-in 50057. [Reconciliação inicial](../reconciliacao-2026-09-23/README.md) e [coleta anterior](../inventario-entra-2026-09-23/README.md) preservadas.

| Evidência | O que comprova |
|---|---|
| [01 — Owner](01-owner-grupo-financeiro.png) | “wesley lima” como único owner do GG_FIN_READ; sem hora interna. Não demonstra papel administrativo ou aprovação de negócio. |
| [02 — Conta desabilitada](02-carla-conta-desabilitada.png) | EMP0003, Account enabled = No; relógio em 23/09 às 17:15, sem fuso explícito. |
| [03 — Sem grupos na consulta](03-carla-sem-grupos.png) | Not a member of any groups, pesquisa vazia; relógio em 23/09 às 17:18, sem fuso explícito. |
| [04 — Mensagem de bloqueio](04-entrada-bloqueada.png) | Identidade de Carla e mensagem de bloqueio; sem horário interno. |
| [05 — Auditoria](05-auditoria-leaver.md) | Bloqueio 17:10:26, revogação 17:15:36 e remoção 17:17:18, UTC−03:00; success. |
| [06 — Sign-in](06-sign-in-bloqueado.md) | AMC PROD, 17:29:19 UTC−03:00, errorCode=50057 por conta desabilitada. |
| [07 — CSV posterior](07-reconciliacao-pos-leaver.csv) | Carla False/False; Gabriela True/True e Suporte/Suporte. |
| [08 — Validação final](08-validacao-final.md) | Nova comparação após as mudanças: três verificações conformes e zero exceções. |

## Decisão e limites

Decisão simulada solicitada por Wesley: tratar conta, associação financeira e sessões. Executor/responsável técnico: Wesley. Registro às 17:10, com consulta de relógio às 17:10:52; o bloqueio auditado ocorreu às 17:10:26. O registro não comprova aprovação anterior à ação. [Cronologia](05-auditoria-leaver.md).

Capturas preservadas sem edição; originais e logs brutos arquivados privadamente. Os extratos omitem IPs e identificadores de sessão. Não se conclui encerramento universal de sessões nem acesso a aplicação financeira. Conta desabilitada, não excluída. A organização documental e a comparação local não alteraram o Entra.

[Ticket e fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-003).
