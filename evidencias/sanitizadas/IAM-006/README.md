# IAM-006 — Diagnóstico e recuperação da autenticação de Felipe

**Objetivo:** explicar por que Felipe (EMP0006) não concluía a entrada e comprovar o restabelecimento da autenticação. Os eventos técnicos ocorreram em **03/09/2026**, em UTC; o ticket registra fechamento em **04/09**.

**Resultado:** a senha apresentada era aceita, mas a entrada era interrompida por expiração/exigência de troca. A auditoria registra o tratamento e os logs mostram entradas posteriores bem-sucedidas. O caso trata de autenticação no Entra; não testa leitura de relatórios financeiros.

## 1. Sintoma e diagnóstico

| Ordem | Prova deste assunto | O que observar e por quê |
|---|---|---|
| 1 | [01 — Entradas interrompidas com 50055](EV-IAM-006-01-eventos-50055.md) | Três entradas no My Profile, às 19:52:21Z, 20:01:38Z e 20:32:12Z. O resultado geral informa senha expirada; isso delimita o problema investigado. |
| 2 | [02 — Etapa de senha nos mesmos eventos](EV-IAM-006-02-detalhes-autenticacao.md) | `Correct password` e êxito da etapa de senha. A correlação com 01 explica por que senha correta não significou login concluído. |

Os três eventos atravessam o período de tratamento; não são três tentativas necessariamente anteriores a todas as ações. Leia os horários junto da próxima prova.

## 2. Tratamento e sua sequência

[03 — Auditoria das alterações e da redefinição de senha](EV-IAM-006-03-eventos-senha.md) reúne somente eventos relacionados à senha de Felipe. A sequência relevante é:

1. Cinco alterações recusadas pela política; uma alteração concluída às 20:12:18Z.
2. Às 20:14:27Z, tentativa de recuperação sem redefinição por autoatendimento habilitada para a conta.
3. Às 20:29:54Z, redefinição administrativa concluída.
4. Às 20:32:12Z, nova entrada interrompida (prova 01); às 20:33:21Z, alteração de senha concluída pelo usuário.

Esses registros sustentam as ações descritas no ticket. Os eventos, isoladamente, não constituem aprovação de negócio nem demonstram o conteúdo das senhas.

## 3. Validação e fechamento

[04 — Entradas posteriores bem-sucedidas](EV-IAM-006-04-login-posterior.md) mostra My Profile às **20:33:27Z** e My Signins às **20:33:43Z** e **20:34:08Z**. É a validação do resultado do atendimento.

- No evento das 20:33:43Z, o primeiro fator foi satisfeito por informação já presente no token; não significa nova digitação da senha.
- Às 20:34:08Z, há uso de MFA. Esse evento também é necessário ao [IAM-007](../IAM-007/README.md), que verifica cadastro e uso do método; o restante do diagnóstico de senha não faz parte daquela verificação.
- Não foi localizada uma etapa correspondente a 20:33:27Z no arquivo exportado de detalhes. O êxito dessa entrada vem do log principal.

## Complemento posterior — representação no ServiceNow

[Incidente INC0010001 na PDI, em 18/09](servicenow/README.md): classificação, atribuição, investigação, tratamento, validação e resolução registrados como exercício operacional. As quatro capturas ficam nesse índice separado porque demonstram **como o caso foi documentado na ferramenta**, sem uma nova intervenção no Entra. Os SLAs da PDI não medem o atendimento histórico de 03–04/09.

## Como interpretar estas provas

Os documentos 01–04 são extratos sanitizados dos logs; originais e identificadores de correlação permanecem privados. Resultado positivo de login comprova autenticação nos aplicativos listados, sem demonstrar acesso financeiro, cadastro do MFA ou exigência de MFA em todos os acessos.

[Voltar ao ticket: contexto, ações, riscos e conclusão](../../../00-operacao-itsm/05-fila-tickets.md#iam-006).
