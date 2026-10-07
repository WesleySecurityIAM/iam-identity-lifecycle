# IAM-007 — Cadastro, estado e uso de MFA de Felipe

**Objetivo:** verificar três afirmações diferentes sobre Felipe (EMP0006): o método foi cadastrado, estava disponível na consulta e foi usado em uma entrada. A verificação ocorreu em **08/09/2026** e aproveitou eventos de **03/09**. Não houve novo cadastro ou alteração de configuração neste atendimento.

**Resultado:** alterações de cadastro localizadas, Authenticator observado como utilizável e uso por notificação comprovado no evento indicado abaixo. Ticket resolvido em 08/09.

## 1. O que faltava verificar

Já havia uma entrada com MFA registrada durante o IAM-006. Ainda era necessário conferir o método atual e localizar o cadastro. Por isso, uma captura do método e um evento de uso não são provas intercambiáveis.

## 2. Provas na ordem dos fatos — cadastro, uso e consulta posterior

| Pergunta | Prova correspondente | O que ela demonstra |
|---|---|---|
| Quando os dados do método foram registrados? | [02 — Auditoria do cadastro](EV-IAM-007-02-cadastro-authenticator.md) | Em 03/09 às 20:19:20 UTC, duas atualizações bem-sucedidas incluíram dados do aplicativo e dos métodos em propriedades antes vazias. |
| Houve uso em uma entrada? | [03 — Uso em 03/09 às 20:34:08 UTC](03-uso-mfa.md) | Entrada no My Signins com êxito, notificação de aplicativo móvel e `MFA completed in Azure AD`. Consultar somente esse evento para a prova de uso. |
| O método estava disponível na consulta? | [01 — Método atual, consultado em 08/09](EV-IAM-007-01-metodo-atual.md) | Authenticator utilizável; dispositivo identificado como iPhone 12; notificação como padrão. Não fornece a data original do cadastro. |

**Por que reutilizar esse evento?** É a mesma autenticação de Felipe, já preservada no IAM-006. O recorte 03 abre somente a prova do uso de MFA; a origem compartilhada fica disponível como consulta opcional.

## 3. Conclusão e limites

A sequência dos fatos é **cadastro em 03/09 → uso em 03/09 → consulta do estado em 08/09**. A ordem de coleta neste ticket começou pela consulta e depois conferiu o histórico; nenhuma data foi alterada para coincidir com a verificação.

- O cadastro e o uso foram comprovados separadamente; não foi necessário alterar a conta.
- As propriedades anteriores vazias não comprovam ausência de todo tipo de autenticação.
- O ator `Azure MFA StrongAuthenticationService` é o serviço que registrou a alteração, não a identificação da pessoa que operou o celular.
- O evento de uso não identifica, por si só, o aparelho físico que aprovou a notificação, nem comprova exigência de MFA em todos os acessos.

[Voltar ao ticket: objetivo, verificações e fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-007).
