# IAM-003 — Leaver de Carla

**Objetivo:** corrigir a conta habilitada e a associação financeira de Carla (EMP0003), desligada no RH fictício. **Fechado em 23/09/2026:** bloqueio, retirada de GG_FIN_READ, ação de revogação e nova entrada bloqueada comprovados. A única regra cadastral de Carla no comparador passou de EXCECAO para CONFORME.

[Ticket: decisão simulada, execução e fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-003).

Leia na ordem: **divergência inicial → decisão → ações auditadas → estado final e tentativa de entrada → comparação posterior**. Os links principais levam às provas de Carla. A coleta conjunta com Gabriela só aparece onde é necessária para preservar a origem do relatório.

<a id="estado-anterior"></a>

## 1. Estado anterior e regra — por que o Leaver foi necessário

RH vigente: Carla DESLIGADO desde 28/08/2026 no cenário. Esperado: conta desabilitada e associação financeira retirada. A conta foi criada em 21/09 para reproduzir a divergência; não há alegação de acesso contínuo desde agosto.

| Prova de Carla | O que mostra | Por que entra neste caso |
|---|---|---|
| [Perfil habilitado — 23/09](../inventario-entra-2026-09-23/05-carla-conta-habilitada.png) | EMP0003 e Account enabled=Yes; relógio às 12:00, sem fuso explícito | Confirma a conta incompatível com o RH desligado. |
| [GG_FIN_READ presente](../inventario-entra-2026-09-23/01-carla-grupos.png) | Associação financeira na tela Groups | Define o vínculo a retirar; não demonstra acesso a aplicação. |
| [Papéis de diretório](../inventario-entra-2026-09-23/02-carla-papeis-diretorio.png) | No directory roles assigned | Delimita as atribuições encontradas antes da mudança. |
| [Atribuições de aplicações](../inventario-entra-2026-09-23/03-carla-aplicacoes.png) | No application assignments found | Delimita a consulta; não é auditoria de permissões internas de todos os aplicativos. |
| [Exceção calculada — somente EMP0003](../reconciliacao-2026-09-23/excecoes-entra.csv) | Habilitação esperada False, observada True | Compara RH com CSV de usuários do Entra de 22/09, executado em 23/09. Grupo foi conferido separadamente. |

As telas de grupos, papéis e aplicações não têm horário/fuso interno. Estão armazenadas na coleta compartilhada de 23/09, mas os links acima abrem somente as capturas de Carla.

<a id="decisao"></a>

## 2. Decisão simulada e responsabilidade

Wesley solicitou tratar conta, associação financeira e sessões e atuou como executor/responsável técnico. Registro às 17:10, com consulta de relógio às 17:10:52; bloqueio auditado às 17:10:26. **O registro não comprova aprovação anterior à ação.** A cronologia é preservada no [extrato de auditoria](05-auditoria-leaver.md).

A [prova 01 — owner do grupo](01-owner-grupo-financeiro.png) é apoio de responsabilidade técnica: mostra “wesley lima” como único owner, sem horário interno. Não é aprovação de negócio nem prova de papel administrativo do tenant e não compõe a validação do bloqueio.

<a id="execucao"></a>

## 3. Execução — três ações, com auditoria

| Ação em 23/09, UTC−03:00 | Prova | Resultado |
|---|---|---|
| 17:10:26 — desabilitar conta | [05 — Auditoria do Leaver](05-auditoria-leaver.md) | AccountEnabled true → false; success. |
| 17:15:36 — revogar refresh tokens anteriores | [05 — Auditoria do Leaver](05-auditoria-leaver.md) | Atualização de StsRefreshTokensValidFrom; success. |
| 17:17:18 — retirar associação financeira | [05 — Auditoria do Leaver](05-auditoria-leaver.md) | Remove member from group para Carla/GG_FIN_READ; success. |

O extrato reúne cinco eventos referentes a essas três ações; eventos pareados não representam intervenções independentes.

<a id="validacao"></a>

## 4. Validação — estado observado e nova tentativa

| Prova | O que comprova | Limite |
|---|---|---|
| [02 — Perfil desabilitado](02-carla-conta-desabilitada.png) | EMP0003, Account enabled=No; relógio às 17:15 | Fuso não explícito na captura. |
| [03 — Consulta sem grupos](03-carla-sem-grupos.png) | Not a member of any groups, sem filtro de pesquisa; relógio às 17:18 | Estado da consulta, complementado pela auditoria de retirada. |
| [04 — Mensagem de entrada bloqueada](04-entrada-bloqueada.png) | Identidade de Carla e indicação de bloqueio | Sem horário interno; o horário exato está no log. |
| [06 — Sign-in bloqueado](06-sign-in-bloqueado.md) | Às 17:29:19 UTC−03:00, AMC PROD, 50057 por conta desabilitada | Comprova uma nova entrada negada; não valida senha nem encerra toda sessão anterior. |

<a id="comparacao-final"></a>

## 5. Comparação posterior e fechamento

[08 — Resultado de Carla e critérios de fechamento](08-validacao-final.md): usando a exportação de 23/09, a regra de habilitação passou a **False esperado / False observado / CONFORME**. Conta preservada, sem exclusão.

[07 — CSV posterior compartilhado](07-reconciliacao-pos-leaver.csv): consultar a linha **EMP0003** para este Leaver. O arquivo original contém também duas regras de Gabriela, que permaneceu em Suporte; essas linhas explicam o total da execução (**três conformes, zero exceções**), mas não são ações ou testes sobre Carla. O documento 08 distingue esse contexto do resultado deste ticket.

## Limites e preservação

Sem aplicação financeira integrada, a retirada do grupo não é um teste de leitura de arquivo no Entra. Azure RBAC, permissões internas de aplicações, AD independente e encerramento universal de sessões ficam fora deste caso. Revogação auditada e tentativa de entrada bloqueada são verificações distintas.

Capturas preservadas sem edição, com originais e logs brutos privados; extratos omitem IPs e identificadores de sessão. A reorganização documental não executa novas alterações ou testes no Entra.
