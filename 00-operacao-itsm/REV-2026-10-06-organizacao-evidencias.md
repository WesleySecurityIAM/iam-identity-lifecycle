# Revisão documental — tickets e evidências

**Data: 06/10/2026.** Revisão dos 11 tickets IAM, do procedimento de emergência e da requisição Guest, para permitir leitura rápida do resultado e conferência técnica da sequência. Esta revisão organiza a documentação da v0.5; não constitui nova execução no AD/Entra ou nova certificação dos acessos.

## Critério de organização

**Motivo e regra → estado anterior → decisão/diagnóstico → ações → validação → fechamento e limites.** O ticket conta a história; o índice de evidências identifica as provas de cada etapa e explica o que demonstram. Datas de eventos, coleta e complementos permanecem distintas.

## Ajustes realizados

| Casos | Ajuste para a leitura e a conferência |
|---|---|
| IAM-001 e IAM-011 — provisionamento/Joiner | Separados fundamento, criação, associação e validação. Cargo consultado depois e atualização posterior do RH aparecem como complementos datados. |
| IAM-002 — Mover | Matriz consolidada vinculada ao fundamento, com distinção da decisão original. Provas separadas em preparação, execução de 28/09 e complemento de OU. Referências históricas focadas em EMP0007. |
| IAM-003 — Leaver | Estado anterior, exceção, três ações e validação focados em Carla. A regra dela foi distinguida das duas regras de Gabriela no CSV compartilhado. |
| IAM-004 — terceiro | Prazo configurado, autenticação expirada, ações no Entra e estado final apresentados por etapa. Expiração e desabilitação continuam distintas. |
| IAM-005 — serviço | Sete provas organizadas pela rotina de 15/09. Remoção posterior de vínculos identificada como tratamento do IAM-010 em 29/09. |
| IAM-006 e IAM-007 — autenticação/MFA | Diagnóstico, intervenções e entradas posteriores separados. O IAM-007 aponta exatamente o evento compartilhado que demonstra uso de MFA. ServiceNow identificado como documentação retrospectiva. |
| IAM-008 e IAM-009 — autorização/sessão | Cadeia de grupos/ACL separada do teste funcional histórico; remoção, leitura persistente, reconexão e restauração ordenadas pelos eventos. |
| IAM-010 — recertificação/SoD | Inventário, regras, decisões, Bruno, serviço, TI, SoD e fechamento com páginas próprias. Pendências históricas distinguidas do resultado final; captura de coleta não apresentada como saída de zero exceções. |
| Emergência e Guest | Preparação, operações, autenticação e encerramento separados. Métodos registrados não tratados como prova automática de uso ou independência. |

## Conferência e limites

- Links locais e âncoras dos documentos públicos verificados; cada caso possui índice acessível a partir da fila e do índice geral.
- Alterações restritas a Markdown. Capturas, CSVs, JSONs, scripts e datas dos registros preservados.
- Referência a outro caso mantida apenas quando sustenta a mesma identidade, evento, recurso ou encaminhamento, com motivo explícito.
- Resultados apresentados no escopo comprovado: associação não equivale a uso de recurso; coleta não equivale a comparação; zero exceções depende das regras e fontes avaliadas.
- Não foi acrescentado teste financeiro negado antes do Mover: essa prova não foi localizada no material examinado. Isso não afirma que a tentativa nunca ocorreu.

[Fila de tickets](05-fila-tickets.md) · [Evidências por caso](../evidencias/README.md).
