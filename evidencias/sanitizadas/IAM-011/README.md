# IAM-011 — Pré-admissão e ativação de Ana

**Objetivo:** preparar Ana Ribeiro (EMP0001) com entrada bloqueada antes da admissão de **15/09/2026**; depois da confirmação e aprovação simuladas, habilitar a conta, conceder o grupo previsto e validar a entrada.

**Resultado:** pré-admissão bloqueada em 14/09; ativação, inclusão no grupo, troca de senha e entrada com MFA comprovadas em 15/09. A atualização documental do RH foi anexada em 18/09 e aparece separada abaixo.

## 1. Fundamento — pessoa, data e acesso esperado

| Campo relevante de Ana | Esperado no cenário |
|---|---|
| Matrícula | EMP0001; correlacionar a pessoa e a conta. |
| Área e cargo | Financeiro / Analista Financeiro. |
| Gestor | Carlos Lima. |
| Admissão | 15/09/2026. |
| Estado anterior no RH | PRE_ADMISSAO na fonte fictícia de 29/08. |
| Acesso previsto no Entra | Associação ao `GG_FIN_READ` após a admissão e aprovação simuladas. |

O [ticket](../../../00-operacao-itsm/05-fila-tickets.md#iam-011) registra a decisão simulada: preparar a conta bloqueada em 14/09 e confirmar a admissão/ativação em 15/09 às 11:24 UTC−03:00. Essa decisão dá o fundamento do atendimento; logs técnicos não comprovam aprovação real do RH ou gestor.

## 2. Preparação e teste negativo — 14/09

| Ordem | Prova deste assunto | O que procurar |
|---|---|---|
| 1 | [02 — Auditoria da criação](EV-IAM-011-02-auditoria-criacao.md) | `Add user` e `Update PasswordProfile`. Confirma a criação; a ausência anterior da conta foi relatada pelo operador. |
| 2 | [01 — Estado da pré-admissão](EV-IAM-011-01-estado-pre-admissao.md) | Conta desabilitada, EMP0001, cadastro e admissão corretos, troca de senha exigida. É um extrato somente de Ana. |
| 3 | [03 — Grupo financeiro sem Ana](EV-IAM-011-03-grupo-sem-ana.md) | Ana ausente da lista de membros diretos do `GG_FIN_READ`. Felipe aparece porque já era membro desse mesmo grupo; sua presença contextualiza a lista e não é outra entrega. |
| 4 | [04 — Entrada bloqueada](EV-IAM-011-04-entrada-bloqueada.md) | My Profile, 14/09 às 16:18:05 em Brasília: código 50057, conta desabilitada. Comprova o bloqueio dessa tentativa. |

## 3. Ativação e teste positivo — 15/09

| Etapa | Prova correspondente | O que foi demonstrado |
|---|---|---|
| Habilitar e conceder o grupo | [05 — Auditoria das ações](EV-IAM-011-05-ativacao-grupo-autenticacao.md) | Às 11:30:41, `AccountEnabled` false → true; às 11:33:44, inclusão no `GG_FIN_READ`. |
| Cumprir a troca e cadastrar autenticação | [05 — Eventos de senha e cadastro, no mesmo documento](EV-IAM-011-05-ativacao-grupo-autenticacao.md) | Às 11:38:51, troca de senha e exigência cumprida; às 11:39:49, cadastro do Authenticator; às 11:40:18, informações exigidas concluídas. |
| Validar a entrada | [06 — Interrupção por troca obrigatória e entrada positiva](EV-IAM-011-06-entrada-positiva.md) | Azure Portal: 50055 às 11:37:59; êxito e MFA concluído às 11:40:18. O evento bloqueado de 14/09 também está na tabela apenas como comparação antes/depois da mesma conta. |

Horários desta seção: Brasília, UTC−03:00. A auditoria demonstra as mudanças; o log de entrada demonstra seu resultado na autenticação. Cadastro do Authenticator e MFA concluído pertencem à ativação de Ana e estão separados por propósito nas provas 05 e 06.

## 4. Complemento documental do RH — 18/09

[09 — Comparação focada em Ana e explicação das versões do RH](EV-IAM-011-09-atualizacao-rh.md) mostra **EMP0001: PRE_ADMISSAO → ATIVO**, mantendo a admissão em 15/09. É o ponto de entrada para revisar o RH deste caso.

As fontes integrais [07 — RH de 29/08](EV-IAM-011-07-rh-2026-08-29.csv) e [08 — RH atualizado em 18/09](EV-IAM-011-08-rh-2026-09-18.csv) ficam como suporte para conferir que somente a linha/campo de Ana mudou. Cada arquivo tem nove pessoas fictícias; os demais registros não são evidências de execução deste ticket nem foram novamente validados aqui.

## Limites do fechamento

- Atualização manual simulada do CSV em 18/09 não prova atualização do RH em 15/09; o ticket foi encerrado em 15/09 pela execução e validação registradas.
- Estado após ativação sustentado por alterações auditadas e entrada positiva; não há nova exportação cadastral anexada após todos os eventos.
- O evento positivo comprova MFA concluído, mas o método específico está `null`; não afirma notificação push ou qual aparelho aprovou.
- Grupo no Entra e login no Azure Portal não comprovam acesso ao relatório financeiro no AD nem privilégios administrativos no Azure. Os ambientes eram independentes.

[Voltar ao ticket: decisões, ações, reversão prevista e conclusão](../../../00-operacao-itsm/05-fila-tickets.md#iam-011).
