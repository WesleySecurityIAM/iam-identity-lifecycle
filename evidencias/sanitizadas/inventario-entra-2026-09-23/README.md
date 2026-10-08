# Entra - conferência de Carla e Gabriela em 23/09/2026

Fonte coletiva da preparação de 23/09, com duas identidades. Para acompanhar somente uma delas, use [Carla — IAM-003](../IAM-003/README.md) ou [Gabriela — IAM-002](../IAM-002/README.md#conferencias-anteriores). Esta página preserva a coleta original; não descreve o estado após os tratamentos.

| Evidência | Resultado observado |
|---|---|
| [01 - Grupos de Carla](01-carla-grupos.png) | A tela Groups mostra GG_FIN_READ, Security, Assigned, origem Cloud. |
| [02 - Papéis de Carla](02-carla-papeis-diretorio.png) | Assigned roles / Directory roles mostra “No directory roles assigned.” |
| [03 - Aplicações de Carla](03-carla-aplicacoes.png) | Applications mostra “No application assignments found.” |
| [04 - Grupos de Gabriela](04-gabriela-grupos.png) | A tela Groups mostra GG_SUP_TICKET, Security, Assigned, origem Cloud. |
| [05 - Perfil atual de Carla](05-carla-conta-habilitada.png) | EMP0003, Account enabled = Yes, Member, Financeiro; criação em 21/09/2026, 11:59 no portal. |

Data da coleta informada pelo operador: 23/09/2026. As capturas 01–04 não mostram horário/fuso interno; os horários dos arquivos são metadados de recebimento, não horários comprovados da consulta. A captura 05 mostra o relógio do computador em 23/09/2026 às 12:00, sem fuso explícito. As pesquisas visíveis estão vazias. Não houve exportação completa por API ou teste de acesso nesta conferência.

## Carla: associação residual, sem papel ou aplicação atribuída nas telas

As capturas mostram GG_FIN_READ presente e listas de papéis/aplicações vazias. Não comprovam ausência de todo acesso: Azure RBAC, permissões internas de aplicações e sessões não foram auditados. A consulta Applications informa limite de até 1000 atribuições diretas, herdadas ou consentidas; retornou vazia neste caso.

O [CSV de 22/09](../inventario-entra-2026-09-22/05-conferencia-reconciliacao-2026-09-23.md) comprova historicamente EMP0003 habilitada; a captura 05 confirma Account enabled = Yes em 23/09. Object ID: `e7e071d7-e369-4438-ba91-19c1caac8d8b`. Conta habilitada e associação ao grupo divergem do esperado para o RH desligado dentro da regra do laboratório, mas não comprovam leitura de recurso financeiro no Entra.

### Cronologia do cenário simulado

O desligamento em **28/08/2026** é um evento fictício da fonte de RH. A conta foi efetivamente criada no laboratório em **21/09/2026**, para reproduzir uma divergência entre RH e diretório; a associação ao grupo foi registrada em 22/09 e o estado atual conferido em 23/09. Essas provas não demonstram que a conta permaneceu habilitada desde agosto nem permitem calcular um SLA real desde aquela data.

## Gabriela: referência de Suporte

A tela Groups retorna GG_SUP_TICKET. Essa associação é compatível com o RH vigente em Suporte. Papéis e aplicações de Gabriela não foram auditados nesta coleta. O [estado AD de 23/09](../IAM-002/08-gabriela-ad-grupos-diretos-2026-09-23.png) é uma prova separada; não há sincronização AD/Entra demonstrada.

<details>
<summary>Comparação e tratamentos posteriores — evidências próprias</summary>

- Comparação cadastral concluída em 23/09: [relatório e exceções](../reconciliacao-2026-09-23/README.md). Carla com habilitação incompatível; Gabriela conforme em habilitação/departamento. Comparação automática de grupos ainda não realizada.
- Leaver de Carla concluído posteriormente em 23/09: [prints, auditoria, sign-in e reconciliação final](../IAM-003/README.md). Este inventário preserva o estado anterior habilitado; não descreve o estado final.
- Mover de Gabriela concluído em 28/09: [alterações e comparação final](../IAM-002/README.md#mudanca-e-estado-anterior). Não altera o estado histórico de Suporte nesta coleta.

</details>

[Fila de tickets](../../../00-operacao-itsm/05-fila-tickets.md).
