# Guest — encerramento em 25/09/2026

**Resultado:** conta desabilitada, ação de revogação auditada e zero associações/atribuições nos contadores de grupos, aplicações e papéis do portal. Objeto mantido para rastreabilidade. REQ-GUEST-001 fechado no escopo do laboratório.

| Prova | Resultado |
|---|---|
| [04 — Estado final](04-guest-desabilitado-sem-atribuicoes.png) | Convidado LAB 01, Guest, Disabled; Groups = 0, Applications = 0, Assigned roles = 0. Relógio da captura: 25/09, 11:40. |
| [05 — Auditoria selecionada](05-auditoria-encerramento.json) | Disable account / Update user às 11:38:41; Update StsRefreshTokenValidFrom Timestamp / Update user às 11:40:20, todos success. |

Horários de Brasília (UTC−03:00). Em UTC: **14:38:41Z** e **14:40:20Z**. Correlação pelo Object ID `2e8dbab8-6f77-4652-9d2e-ca567b3c1b9f`; executor ADMIN-LAB-001.

## Como localizar a revogação

Em Audit logs, filtrar 25/09 e o usuário alvo. Procurar **Update StsRefreshTokenValidFrom Timestamp**, confirmar **success** e abrir **Target(s) → Modified properties**. A propriedade **StsRefreshTokensValidFrom** mudou de `2026-09-22T17:09:48Z` para `2026-09-25T14:40:20Z`. O Update user associado registra a mesma mudança. Para o bloqueio, procurar **Disable account** e **AccountEnabled**, de true para false.

## Limites e origem

O evento comprova a ação administrativa e a atualização do marco de validade dos tokens; não demonstra encerramento imediato de toda sessão de aplicação nem da sessão no provedor externo do Guest. Não foi realizado novo teste de entrada ou de aplicação nesta conclusão. Os contadores evidenciam o escopo exibido no portal, não uma auditoria de Azure RBAC, compartilhamentos ou permissões internas de serviços.

O prazo foi executado manualmente; não houve expiração automática. Accepted permanece como histórico do aceite, mesmo com a conta Disabled. Não foi necessário excluir o objeto. Captura sem edição, com e-mail pessoal autorizado pelo operador; JSON integral preservado em área privada. O extrato mantém IDs dos eventos e SHA-256 da fonte.

[Solicitação e ciclo completo](../../../00-operacao-itsm/REQ-GUEST-001.md).
