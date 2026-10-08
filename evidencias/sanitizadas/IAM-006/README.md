# IAM-006 — Diagnóstico e recuperação da autenticação de Felipe

**Resultado:** a senha de Felipe (EMP0006) era aceita, mas a entrada no Entra era interrompida por expiração/exigência de troca. A auditoria e os logs de **03/09/2026** registram o tratamento e a autenticação restabelecida. Ticket fechado em **04/09**.

<a id="linha-do-tempo"></a>

## 1. Diagnóstico e tratamento — 03/09, horários UTC

| Quando (UTC) | Evento | Prova |
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

## 2. Validação e fechamento original — 03–04/09

Na [prova 04](EV-IAM-006-04-login-posterior.md), o êxito das 20:33:27Z vem do log principal, sem etapa correspondente no arquivo de detalhes. Às 20:33:43Z, o primeiro fator foi satisfeito por informação no token; não significa nova digitação de senha.

O evento das 20:34:08Z comprova uso de MFA e é reutilizado no [IAM-007](../IAM-007/README.md), sem nova execução.

## 3. Documentação posterior — 18/09

[INC0010001 no ServiceNow](servicenow/README.md): quatro capturas da documentação retrospectiva do caso na PDI, sem nova intervenção no Entra. Os SLAs da PDI não medem o atendimento histórico de 03–04/09.

## Origem e limites

Extratos 01–04 sanitizados; logs originais e identificadores de correlação privados. Os resultados comprovam autenticação nos aplicativos listados, sem demonstrar acesso financeiro, cadastro do MFA ou exigência de MFA em todos os acessos.

[Ticket IAM-006](../../../00-operacao-itsm/05-fila-tickets.md#iam-006).
