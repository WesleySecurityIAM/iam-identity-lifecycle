# REQ-GUEST-001 — Convidado externo de laboratório

- Ambiente: Microsoft Entra ID — laboratório fictício
- Tipo: requisição de colaboração B2B, complementar à fila IAM
- Abertura: 2026-09-22
- Status: **Fechado em 2026-09-25** — conta desabilitada, revogação auditada e estado final conferido
- Solicitante e responsável: Wesley
- Nome de exibição: Convidado LAB 01
- Encerramento previsto: 2026-09-25, após validação

## Contexto e objetivo

Demonstrar convite e aceite de uma identidade externa B2B com finalidade, responsável e prazo documentados. Usar endereço externo controlado pelo operador, diferente da conta administrativa do tenant. O operador autorizou publicar o e-mail pessoal nas duas capturas do Guest; JSON bruto, tokens e dados de sessão permanecem privados.

## Estado anterior

Antes desta execução, convite pendente no registro. Em 22/09, a criação foi comprovada por Add user, com Guest, Invitation e PendingAcceptance. Endereço externo controlado pelo operador.

## Aprovação e fundamento

Preparação solicitada por Wesley em 22/09/2026 para o próprio laboratório. Finalidade restrita ao teste de convite e aceite. Sem aprovação corporativa real. Nenhum grupo financeiro, papel administrativo ou aplicação está previsto nesta etapa.

## Ações e validação

- **Concluído:** registrar finalidade, responsável, início e prazo de encerramento.
- **Concluído:** criar a identidade externa e processar o convite às 14:09:48 de 22/09 (UTC−03:00).
- **Concluído:** registrar Guest e PendingAcceptance (01); ADMIN-LAB-001 associado como sponsor às 14:09:49 (03). Wesley responde pelo ciclo de vida e a conta administrativa é o executor técnico.
- **Concluído:** aceite comprovado pela captura Accepted e pelos eventos Update user / Redeem external user invite às 14:17:23 (02–03).
- **Concluído:** preservar auditoria complementar e duas capturas na área privada; publicar extratos sanitizados e cópias das capturas autorizadas pelo operador.
- **Concluído — 25/09:** bloquear entrada às 11:38:41 e executar revogação às 11:40:20 (UTC−03:00), com auditoria success e alterações AccountEnabled / StsRefreshTokensValidFrom.
- **Concluído:** conferir Disabled e contadores de grupos, aplicações e papéis iguais a zero no resumo do portal. Objeto preservado. Não houve novo CSV ou teste de entrada/aplicação; o fechamento se apoia no estado individual e na auditoria.

## Evidências

- [01 — Estado inicial do Guest](../evidencias/sanitizadas/REQ-GUEST-001/01-estado-pendente.md).
- [02 — Aceite na captura](../evidencias/sanitizadas/REQ-GUEST-001/02-estado-aceito.md).
- [03 — Auditoria do convite, sponsor e aceite](../evidencias/sanitizadas/REQ-GUEST-001/03-auditoria-convite-aceite.md).

- [04–06 — Estado final, auditoria e interpretação do encerramento](../evidencias/sanitizadas/REQ-GUEST-001/06-encerramento.md).

## Riscos, limites e reversão

O prazo é controle documental/manual; não configura expiração automática no Entra. O aceite comprova resgate do convite, não acesso a aplicação. Se o convite for enviado à identidade errada, interromper o teste e remover o objeto indevido após conferir as dependências. Não registrar senhas ou links de resgate no Git.

## Fechamento

**Fechado em 25/09/2026:** convite, sponsor e aceite registrados em 22/09; conta desabilitada, ação de revogação auditada e ausência de grupos/aplicações/papéis indicada no portal em 25/09. Prazo manual cumprido, sem exclusão do objeto. A ação de revogação não comprova término imediato de toda sessão de aplicação ou do provedor externo. Sem nova tentativa de entrada; conclusão limitada ao escopo comprovado.

[Voltar à fila](05-fila-tickets.md).
