# IAM-001 — Provisionamento de Felipe no Entra

**Objetivo:** criar a identidade cloud-only de Felipe (EMP0006) conforme o RH e associá-la ao grupo financeiro previsto para seu cargo. **Resultado:** criação, associação e matrícula comprovadas no fechamento de 04/09/2026; cargo confirmado em coleta complementar de 10/09. Nenhum acesso a aplicação financeira foi testado.

[Ticket: contexto, aprovação simulada e fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-001).

Leia na ordem: **RH e regra → criação e grupo → conferência da identidade → complemento cadastral**. As provas abaixo pertencem somente ao provisionamento de Felipe; senha e MFA têm atendimentos próprios.

<a id="fundamento"></a>

## 1. Fundamento — por que provisionar e qual acesso esperar

| Documento | O que consultar | Papel no caso |
|---|---|---|
| [01 — Fonte de RH](EV-IAM-001-01-fonte-rh.csv) | EMP0006, ATIVO, Analista Financeiro, Financeiro, gestor Carlos Lima | Define o perfil da pessoa. Versão informada de 29/08/2026; não é consulta ao Entra. |
| [02 — Regra da matriz](EV-IAM-001-02-regra-matriz.csv) | Analista Financeiro → GG_FIN_READ; finalidade: consultar relatórios da área | Define o acesso esperado do cenário. O nome do grupo não demonstra integração com um recurso. |

O ticket registra que Felipe ainda não possuía conta e prevê aprovação simulada do Gestor Financeiro. Não há nesta pasta uma coleta anterior demonstrando ausência da conta. As colunas MFA e conflito SoD da matriz são requisitos do modelo; não representam testes executados neste provisionamento.

<a id="execucao"></a>

## 2. Execução — o que foi criado e concedido

| Prova | Passo e resultado | Limite da prova |
|---|---|---|
| [03 — Criação da identidade](EV-IAM-001-03-add-user.md) | Auditoria `Add user` bem-sucedida em 03/09/2026, 19:47:28 UTC | Comprova a criação; matrícula é conferida no inventário posterior. |
| [04 — Associação ao grupo](EV-IAM-001-04-add-member-group.md) | Auditoria `Add member to group` bem-sucedida em 03/09/2026, 19:47:28 UTC, para Felipe/GG_FIN_READ | Comprova associação. Sem aplicação integrada, não comprova leitura financeira. |

Os dois eventos têm frações de segundo distintas, preservadas nos extratos. As contas AD e os testes de arquivos de outros exercícios não são provas desta criação cloud-only.

<a id="validacao"></a>

## 3. Validação e fechamento original — 04/09

[05 — Matrícula no inventário](EV-IAM-001-05-inventario-employee-id.md) registra EMP0006 na exportação de usuários de 04/09. A correlação com o RH foi manual; não houve sincronização automática. O CSV dessa data não continha a coluna de cargo, razão do acompanhamento posterior.

O fechamento original sustenta **identidade criada + matrícula correlacionada + associação ao grupo**. Acesso efetivo ao sistema financeiro não integra o resultado.

<a id="complemento-cadastral"></a>

## 4. Complemento cadastral — 10/09

| Prova | Por que foi acrescentada | Conclusão |
|---|---|---|
| [06 — Tela de cargo e matrícula](EV-IAM-001-06-cargo-atual.png) | Conferência visual do campo que faltava no inventário anterior | A tela é de edição e, isoladamente, não comprova salvamento. |
| [07 — Cargo no CSV de 10/09](EV-IAM-001-07-cargo-inventario-2026-09-10.md) | Confirmar o valor efetivamente exportado | EMP0006 único, cargo Analista Financeiro, departamento Financeiro e accountEnabled=True. |

A prova 07 conclui o acompanhamento cadastral REV-IAM-001-01. Demonstra o estado coletado em 10/09, sem provar retroativamente o cargo em 03/09 nem alterar a data original do fechamento.

## Limites e preservação

O grupo financeiro não estava integrado a uma aplicação. Inventário de usuários não comprova grupos; associação a grupo não comprova uso de recurso. Extratos públicos identificam as fontes; logs e exportações integrais permanecem privados. A organização deste índice não altera as fontes, as datas ou os testes realizados.
