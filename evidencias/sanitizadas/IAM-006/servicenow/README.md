# IAM-006 no ServiceNow — Incident Management

**Resultado:** INC0010001 em Resolved, com classificação, atribuição, investigação, tratamento e validação registrados. Transcrição didática realizada em 18/09/2026 em uma PDI; o incidente original ocorreu em 03–04/09. Nenhuma nova alteração no Entra foi executada nesta atividade.

| Evidência | O que demonstra |
|---|---|
| [01 — Classificação e atribuição](servicenow-iam006-01-classificacao-atribuicao.png) | Caller Felipe Gomes; IAM-LAB; ADMIN-LAB-001; impacto e urgência 3-Low; prioridade exibida 4-Low; estado Resolved. |
| [02 — Investigação](servicenow-iam006-02-investigacao.png) | Work note com interpretação dos eventos 50055 e registro inicial do incidente. |
| [03 — Tratamento e validação](servicenow-iam006-03-tratamento-validacao.png) | Work note com ações históricas e entradas posteriores; transições New → In Progress → Resolved e código Solution provided. |
| [04 — Resolução e SLAs](servicenow-iam006-04-resolucao-sla.png) | Notas de resolução; SLA de resposta Completed e SLA de resolução Paused. |

## SLAs, horários e limites

- Os SLAs pertencem à PDI e à transcrição de 18/09; não medem o SLA didático histórico do IAM-006. A definição de resolução não foi inspecionada: a causa de Paused não está comprovada. Estado Resolved do incidente não equivale a SLA de resolução Completed.
- O operador informou configuração America/Los_Angeles. A captura não mostra essa configuração. Os horários do histórico são mantidos como exibidos; os eventos Entra dentro das notas estão explicitamente em UTC.
- O operador informou ter preenchido manualmente Resolved com horário de Brasília; a tela mostra 18/09 às 15:52:00, enquanto o histórico da transição mostra 11:51:51. Digitar outro fuso nesse campo não é conversão de exibição. Esse valor manual não é usado para calcular duração nem certificar SLA. Para comparação de fusos, preservar o timestamp automático e registrar a conversão com offset em nota.
- Categoria Software / Operating System foi a classificação escolhida no exercício; não é uma causa de falha do sistema operacional nem uma taxonomia IAM validada. Service e Configuration item estão vazios.
- Quatro capturas preservadas sem edição; origens e hashes no manifesto privado. Sem exportação do registro ou das definições de SLA: demonstram operação básica de Incident Management, não configuração ou validação de SLA.

Os logs Entra são a prova técnica do incidente; estas telas comprovam sua representação operacional no ServiceNow.

[IAM-006 e evidências técnicas](../../../../00-operacao-itsm/05-fila-tickets.md#iam-006).

Referências: [condições de SLA](https://www.servicenow.com/docs/r/it-service-management/service-level-management/c_SLAConditions.html) e [definição, agenda e fuso](https://www.servicenow.com/docs/r/it-service-management/service-level-management/t_CreateAnSLADefinition.html).
