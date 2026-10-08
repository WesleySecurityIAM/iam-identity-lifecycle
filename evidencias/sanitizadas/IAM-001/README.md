# IAM-001 — Provisionamento de Felipe no Entra

Felipe (EMP0006): identidade cloud-only criada, associada a GG_FIN_READ e matrícula conferida no fechamento de **04/09/2026**. Cargo confirmado em complemento de 10/09. [Ticket e aprovação simulada](../../../00-operacao-itsm/05-fila-tickets.md#iam-001).

<a id="fundamento"></a>

## 1. RH e acesso esperado — fonte de 29/08/2026

| Prova | O que demonstra |
|---|---|
| [01 — Fonte de RH](EV-IAM-001-01-fonte-rh.csv) | EMP0006, ATIVO, Analista Financeiro, Financeiro, gestor Carlos Lima. |
| [02 — Regra da matriz](EV-IAM-001-02-regra-matriz.csv) | Analista Financeiro → GG_FIN_READ para consultar relatórios da área. |

<a id="execucao"></a>

## 2. Criação e associação — 03/09/2026

| Prova | O que demonstra |
|---|---|
| [03 — Criação da identidade](EV-IAM-001-03-add-user.md) | `Add user` bem-sucedido às 19:47:28.0287472 UTC. |
| [04 — Associação ao grupo](EV-IAM-001-04-add-member-group.md) | `Add member to group` bem-sucedido às 19:47:28.6788099 UTC: Felipe/GG_FIN_READ. |

<a id="validacao"></a>

## 3. Conferência e fechamento — 04/09/2026

| Prova | O que demonstra |
|---|---|
| [05 — Matrícula no inventário](EV-IAM-001-05-inventario-employee-id.md) | EMP0006 na exportação do Entra, correlacionado manualmente ao RH. O CSV não continha a coluna de cargo. |

<a id="complemento-cadastral"></a>

## 4. Complemento cadastral — 10/09/2026

| Prova | O que demonstra |
|---|---|
| [07 — Cargo no inventário](EV-IAM-001-07-cargo-inventario-2026-09-10.md) | EMP0006 único, Analista Financeiro, Financeiro e accountEnabled=True no CSV. Conclui REV-IAM-001-01. |

<details>
<summary>Apoio visual — tela de edição</summary>

[06 — Tela de cargo e matrícula](EV-IAM-001-06-cargo-atual.png): valores exibidos, sem prova de salvamento. O valor exportado está na prova 07.

</details>

## Limites e origem

- GG_FIN_READ não estava integrado a uma aplicação financeira; não houve teste de acesso ao recurso. Inventário de usuários não comprova associação a grupos.
- Matrícula preenchida manualmente, sem sincronização RH–Entra. O complemento de 10/09 não prova o cargo em 03–04/09 nem altera o fechamento original.
- Ausência anterior da conta consta do ticket, sem coleta nesta pasta. MFA e conflito SoD da matriz não foram testados neste provisionamento.
- Extratos identificam as fontes; logs e exportações integrais permanecem privados.
