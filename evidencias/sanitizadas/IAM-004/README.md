# IAM-004 — Prazo e encerramento de Diego

Diego (EMP0004): vínculo fictício encerrado em **29/09/2026 às 08:00 UTC−03:00**. Fechado em 29/09 com nova autenticação recusada no AD, bloqueio/revogação no Entra e comparação cadastral conforme. [Ticket e decisão simulada](../../../00-operacao-itsm/05-fila-tickets.md#iam-004).

<a id="prazo-e-regra"></a>

## 1. Prazo configurado — 28/09/2026

O ticket registra Wesley como responsável pela decisão didática e Fernanda Souza como responsável de negócio fictícia. RH: ATIVO em 28/09 e DESLIGADO após a vigência de 29/09; admissão de 01/06/2026 preservada. O horário de término vem do ticket.

| Prova | O que demonstra — UTC−03:00 |
|---|---|
| [01 — Expiração configurada](01-expiracao-configurada.png) | 17:11:26: EMP0004, Enabled=True, AccountExpirationDate=29/09/2026 08:00:00. |

<a id="validacao-ad"></a>

## 2. Expiração e tentativa no AD — 29/09/2026

| Prova | O que demonstra — UTC−03:00 |
|---|---|
| [02 — Prazo vencido](02-ad-prazo-vencido.png) | 11:08:10: prazo vencido, Enabled=True e fuso da VM conferido. |
| [03 — Nova autenticação](03-ad-autenticacao-conta-expirada.png) | 11:16:33: `runas` como EMPRESA\diego.rocha retorna 1793, conta expirada. |

<a id="execucao-entra"></a>

## 3. Bloqueio e revogação no Entra — 29/09/2026

| Prova | O que demonstra — UTC−03:00 |
|---|---|
| [06 — Auditoria de Diego](06-audit-encerramento-extrato.json) | Bloqueio às 11:19:45 e revogação às 11:19:56, ambos bem-sucedidos. Eventos pareados representam duas ações; JSON preserva UTC. |
| [04 — Perfil e validade das sessões](04-entra-bloqueio-vigencia-sessoes.png) | EMP0004, Account enabled=No, On-premises sync enabled=No e sessões válidas a partir de 11:19. |

<details>
<summary>Apoio visual — bloqueio</summary>

[05 — Identidade bloqueada](05-entra-identidade-bloqueada.png): captura complementar do mesmo objeto desabilitado, sem abrir as listas de concessões.

</details>

<a id="validacao-final"></a>

## 4. Conferência final — 29/09/2026

| Prova | O que demonstra |
|---|---|
| [07 — Comparação posterior](07-comparacao-final.md) | RH DESLIGADO × CSV de 29/09: EMP0004 único, mesmo Object ID e accountEnabled=False; conforme. |
| [08 — Contadores no portal](08-entra-zero-concessoes.png) | 11:58: Disabled e zero em Group memberships, Applications, Assigned roles e Assigned licenses. |

## Limites e origem

- AD e Entra independentes: o AD permaneceu Enabled=True e expirado; o Entra foi desabilitado separadamente.
- O teste `runas` não documenta eventual redefinição prévia de senha nem encerramento de sessões existentes. A revogação no Entra não comprova corte imediato de toda sessão de aplicação.
- CSV comprova cadastro; contadores comprovam o resumo consultado, sem auditoria de permissões internas de todos os aplicativos. Não houve remoção de vínculos inexistentes.
- Employee type não foi alterado nem integrou o controle; User type=Member não define contrato.
- Capturas, JSON, CSV e hashes de origem preservados em área privada.
