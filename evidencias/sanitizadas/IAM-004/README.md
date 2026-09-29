# IAM-004 — Prazo e encerramento de Diego

**Resultado comprovado:** prazo AD vencido, nova autenticação recusada por expiração, bloqueio Entra, revogação auditada e comparação final do estado da conta conforme RH. **Encerrado em 29/09 no escopo do IAM-004:** captura final com zero grupos, aplicações, papéis e licenças.

| Evidência | O que comprova |
|---|---|
| [01 — Configuração em 28/09](01-expiracao-configurada.png) | Prazo 29/09 às 08:00 UTC−03:00; Enabled=True |
| [02 — Prazo vencido](02-ad-prazo-vencido.png) | Em 29/09 às 11:08:10, mesmo prazo e Enabled=True; fuso da VM conferido |
| [03 — Nova autenticação](03-ad-autenticacao-conta-expirada.png) | Às 11:16:33, runas como EMPRESA\diego.rocha retorna 1793: The user's account has expired |
| [04 — Estado Entra](04-entra-bloqueio-vigencia-sessoes.png) | EMP0004, Account enabled=No, On-premises sync enabled=No e sessões válidas a partir de 11:19; relógio do computador visível |
| [05 — Identidade bloqueada](05-entra-identidade-bloqueada.png) | Mesmo Object ID e Account status Disabled; links View não comprovam listas vazias |
| [06 — Auditoria selecionada](06-audit-encerramento-extrato.json) | Disable account/Update user às 11:19:45; Update StsRefreshTokenValidFrom Timestamp/Update user às 11:19:56, sucesso |
| [07 — Comparação posterior](07-comparacao-final.md) | RH DESLIGADO versus accountEnabled=False, matrícula única e ID preservado |

Horários narrados em Brasília UTC−03:00; JSON mantém UTC. Pares de eventos correlacionados descrevem duas ações, não quatro bloqueios/revogações independentes. Revogar sessões atualiza a validade dos refresh tokens/sessões abrangidos; não prova corte instantâneo de todo acesso em aplicativos.

[08 — Contadores finais no portal](08-entra-zero-concessoes.png): captura às 11:58 de 29/09 mostra o mesmo Object ID, Disabled e zero em Group memberships, Applications, Assigned roles e Assigned licenses. Não houve remoção de vínculos inexistentes. Não é auditoria de permissões internas de todo aplicativo nem de todos os tokens.

## Limites e encaminhamento

- A prova 05 apresenta View; a prova 08 posterior exibe os contadores zero e completa a conferência do portal no escopo registrado. A ausência nos três grupos de 28/09 permanece histórica.
- Employee type não integrou os controles de acesso deste encerramento; não foi alterado. User type=Member é compatível com uma conta interna de terceiro e não define tipo de contrato.
- A captura de runas não documenta eventual redefinição prévia de senha; nenhuma redefinição é apresentada como comprovada. O erro 1793 é a evidência da recusa por expiração.
- As quatro capturas de hoje são cópias sem edição, com hash conferido. Originais/JSON/CSV preservados privadamente. Sem senha ou token no extrato público.

[Ticket e pendências](../../../00-operacao-itsm/05-fila-tickets.md#iam-004). Término do prazo do terceiro é o motivo do encerramento; TI ausente da matriz era uma lacuna separada tratada no IAM-010.
