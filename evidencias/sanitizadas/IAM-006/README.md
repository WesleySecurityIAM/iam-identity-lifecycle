# IAM-006 — Diagnóstico e recuperação da autenticação de Felipe

**Objetivo:** explicar por que Felipe (EMP0006) não concluía a entrada e comprovar o restabelecimento da autenticação. Os eventos técnicos ocorreram em **03/09/2026**, em UTC; o ticket registra fechamento em **04/09**.

**Resultado:** a senha apresentada era aceita, mas a entrada era interrompida por expiração/exigência de troca. A auditoria registra o tratamento e os logs mostram entradas posteriores bem-sucedidas. O caso trata de autenticação no Entra; não testa leitura de relatórios financeiros.

<a id="linha-do-tempo"></a>

## 1. Investigar e tratar — sequência dos eventos de 03/09

Leia pelos horários UTC. Os extratos 01–03 se complementam; a terceira interrupção ocorreu entre o reset administrativo e a troca final, por isso não é apresentada como falha anterior a todo o tratamento.

| Quando (UTC) | O que aconteceu e por quê interessa | Prova correspondente |
|---|---|---|
| 19:52:21 | Primeira entrada interrompida; senha aceita na etapa, login com 50055. | [01 — evento A](EV-IAM-006-01-eventos-50055.md) e [02 — detalhes A](EV-IAM-006-02-detalhes-autenticacao.md). |
| 19:55:48–19:58:30 | Três tentativas de alteração recusadas pela política. | [03 — eventos de senha](EV-IAM-006-03-eventos-senha.md). |
| 20:01:38 | Nova interrupção, ainda com senha aceita e 50055. | [01 — evento B](EV-IAM-006-01-eventos-50055.md) e [02 — detalhes B](EV-IAM-006-02-detalhes-autenticacao.md). |
| 20:02:07–20:12:18 | Mais duas alterações recusadas; alteração bem-sucedida às 20:12:18. | [03 — eventos de senha](EV-IAM-006-03-eventos-senha.md). |
| 20:14:27 | Recuperação por autoatendimento indisponível para Felipe. | [03 — eventos de recuperação](EV-IAM-006-03-eventos-senha.md). |
| 20:29:54 | Redefinição administrativa concluída. | [03 — Reset password (by admin)](EV-IAM-006-03-eventos-senha.md). |
| 20:32:12 | Entrada ainda interrompida após o reset. | [01 — evento C](EV-IAM-006-01-eventos-50055.md) e [02 — detalhes C](EV-IAM-006-02-detalhes-autenticacao.md). |
| 20:33:21 | Alteração de senha concluída pelo usuário. | [03 — última alteração](EV-IAM-006-03-eventos-senha.md). |
| 20:33:27–20:34:08 | Entradas posteriores com êxito, concluindo a validação. | [04 — entradas posteriores](EV-IAM-006-04-login-posterior.md). |

Os registros sustentam o diagnóstico e as intervenções. Não mostram conteúdo de senha nem constituem aprovação de negócio. Todos tratam Felipe/EMP0006; cadastro do método MFA possui o próprio IAM-007.

## 2. Validação e fechamento original — 03–04/09

A prova 04 registra êxito em My Profile às 20:33:27Z e em My Signins às 20:33:43Z e 20:34:08Z. Na entrada das 20:33:43Z, o primeiro fator foi satisfeito por informação no token; não significa nova digitação de senha. Não foi localizada etapa correspondente a 20:33:27Z no arquivo de detalhes; o êxito vem do log principal.

O evento das 20:34:08Z também comprova uso de MFA no [IAM-007](../IAM-007/README.md). É reutilizado por ser a mesma identidade e o mesmo evento; não é uma nova execução. Fechamento registrado no ticket em 04/09.

## Complemento posterior — representação no ServiceNow

[Incidente INC0010001 na PDI, em 18/09](servicenow/README.md): classificação, atribuição, investigação, tratamento, validação e resolução registrados como exercício operacional. As quatro capturas ficam nesse índice separado porque demonstram **como o caso foi documentado na ferramenta**, sem uma nova intervenção no Entra. Os SLAs da PDI não medem o atendimento histórico de 03–04/09.

## Como interpretar estas provas

Os documentos 01–04 são extratos sanitizados dos logs; originais e identificadores de correlação permanecem privados. Resultado positivo de login comprova autenticação nos aplicativos listados, sem demonstrar acesso financeiro, cadastro do MFA ou exigência de MFA em todos os acessos.

[Voltar ao ticket: contexto, ações, riscos e conclusão](../../../00-operacao-itsm/05-fila-tickets.md#iam-006).
