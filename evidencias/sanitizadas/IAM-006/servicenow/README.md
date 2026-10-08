# IAM-006 no ServiceNow — Incident Management

**Resultado:** INC0010001 em Resolved. Documentação retrospectiva realizada em **18/09/2026** em uma PDI, sobre o incidente de **03–04/09**; nenhuma nova alteração no Entra.

As capturas seguem as etapas registradas, sem comprovar o horário original de criação de cada nota. A causa técnica e os logins constam nas [provas do Entra](../README.md).

| Evidência | O que demonstra |
|---|---|
| [01 — Classificação e atribuição](servicenow-iam006-01-classificacao-atribuicao.png) | Caller Felipe Gomes; IAM-LAB; ADMIN-LAB-001; impacto e urgência 3-Low; prioridade exibida 4-Low; estado Resolved. |
| [02 — Investigação](servicenow-iam006-02-investigacao.png) | Work note com interpretação dos eventos 50055 e registro inicial do incidente. |
| [03 — Tratamento e validação](servicenow-iam006-03-tratamento-validacao.png) | Work note com ações históricas e entradas posteriores; transições New → In Progress → Resolved e código Solution provided. |
| [04 — Resolução e SLAs](servicenow-iam006-04-resolucao-sla.png) | Notas de resolução; SLA de resposta Completed e SLA de resolução Paused. |

## SLAs, horários e limites

- Os SLAs da PDI não medem o atendimento de 03–04/09. A definição de resolução não foi inspecionada: a causa de Paused não está comprovada. Incidente Resolved não equivale a SLA de resolução Completed.
- O operador informou configuração America/Los_Angeles. A captura não mostra essa configuração. Os horários do histórico são mantidos como exibidos; os eventos Entra dentro das notas estão explicitamente em UTC.
- O operador informou preenchimento manual de Resolved com horário de Brasília: a tela mostra 18/09 às 15:52:00, enquanto a transição mostra 11:51:51. O valor manual não representa conversão de exibição nem comprova duração ou SLA.
- Categoria Software / Operating System foi a classificação escolhida no exercício; não é uma causa de falha do sistema operacional nem uma taxonomia IAM validada. Service e Configuration item estão vazios.
- Quatro capturas preservadas sem edição; origens e hashes no manifesto privado. Sem exportação do registro ou das definições de SLA.

[IAM-006 e evidências técnicas](../../../../00-operacao-itsm/05-fila-tickets.md#iam-006).

Referências: [condições de SLA](https://www.servicenow.com/docs/r/it-service-management/service-level-management/c_SLAConditions.html) e [definição, agenda e fuso](https://www.servicenow.com/docs/r/it-service-management/service-level-management/t_CreateAnSLADefinition.html).
