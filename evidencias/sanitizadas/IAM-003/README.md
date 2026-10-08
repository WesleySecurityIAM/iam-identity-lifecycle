# IAM-003 — Leaver de Carla

Carla (EMP0003), desligada no RH fictício: **fechado em 23/09/2026** com conta desabilitada, GG_FIN_READ retirado, revogação registrada e nova entrada bloqueada. A regra cadastral passou de EXCECAO para CONFORME. [Ticket](../../../00-operacao-itsm/05-fila-tickets.md#iam-003).

<a id="estado-anterior"></a>

## 1. Divergência inicial — 23/09/2026

RH: DESLIGADO desde 28/08. A conta foi criada em 21/09 para reproduzir a divergência; não demonstra acesso contínuo desde agosto.

| Prova | O que demonstra |
|---|---|
| [Perfil habilitado](../inventario-entra-2026-09-23/05-carla-conta-habilitada.png) | EMP0003 e Account enabled=Yes; relógio às 12:00. |
| [Grupo financeiro](../inventario-entra-2026-09-23/01-carla-grupos.png) | GG_FIN_READ presente. |
| [Papéis de diretório](../inventario-entra-2026-09-23/02-carla-papeis-diretorio.png) | No directory roles assigned. |
| [Atribuições de aplicações](../inventario-entra-2026-09-23/03-carla-aplicacoes.png) | No application assignments found. |
| [Exceção — EMP0003](../reconciliacao-2026-09-23/excecoes-entra.csv) | RH × CSV Entra de 22/09: habilitação esperada False, observada True. |

<a id="decisao"></a>

## 2. Decisão simulada — 23/09/2026

Wesley solicitou o tratamento e foi o executor/responsável técnico. Registro às 17:10, relógio consultado às 17:10:52, bloqueio auditado às 17:10:26: **não comprova aprovação anterior à ação**.

[01 — Owner do grupo](01-owner-grupo-financeiro.png): “wesley lima” como único owner; apoio de responsabilidade técnica, sem prova de aprovação de negócio ou papel administrativo do tenant.

<a id="execucao"></a>
<a id="validacao"></a>

## 3. Ações e conferências — 23/09/2026

| Horário | Prova | O que demonstra |
|---|---|---|
| 17:10:26 | [05 — Auditoria](05-auditoria-leaver.md) | AccountEnabled true → false; success. |
| Relógio 17:15 | [02 — Perfil desabilitado](02-carla-conta-desabilitada.png) | EMP0003, Account enabled=No. |
| 17:15:36 | [05 — Auditoria](05-auditoria-leaver.md) | Atualização de StsRefreshTokensValidFrom; success. |
| 17:17:18 | [05 — Auditoria](05-auditoria-leaver.md) | Remove member from group: Carla/GG_FIN_READ; success. |
| Relógio 17:18 | [03 — Sem grupos](03-carla-sem-grupos.png) | Not a member of any groups, sem filtro. |
| 17:29:19 | [06 — Sign-in bloqueado](06-sign-in-bloqueado.md) | AMC PROD, código 50057: conta desabilitada. |

Horários de eventos em UTC−03:00; capturas de perfil sem fuso explícito. Os cinco eventos da auditoria representam três ações.

<details>
<summary>Apoio visual — mensagem de bloqueio</summary>

[04 — Mensagem de bloqueio](04-entrada-bloqueada.png): captura de Carla sem horário interno. Identidade, horário e código da tentativa constam do log 06.

</details>

<a id="comparacao-final"></a>

## 4. Comparação posterior e fechamento — 23/09/2026

| Prova | O que demonstra |
|---|---|
| [08 — Resultado de Carla](08-validacao-final.md) | CSV de 23/09: False esperado / False observado / CONFORME; mesmo Object ID. Conta mantida no diretório. |

## Limites e origem

- Código 50057 comprova nova entrada bloqueada por conta desabilitada; não valida a senha. Revogação de refresh tokens não comprova término imediato de todas as sessões de aplicações.
- Comparação cadastral não verifica grupos; retirada de GG_FIN_READ tem auditoria e captura próprias. Sem aplicação financeira integrada, não houve teste de acesso ao recurso.
- Azure RBAC, permissões internas de aplicações e AD independente ficaram fora do caso. As telas de grupos, papéis e aplicações não têm horário/fuso interno.
- Capturas sem edição e logs brutos preservados em área privada; extratos omitem IPs e identificadores de sessão. O relatório 08 identifica a origem do CSV compartilhado e apresenta somente o resultado EMP0003.
