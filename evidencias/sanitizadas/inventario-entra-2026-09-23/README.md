# Entra - conferência de Carla e Gabriela em 23/09/2026

Coleta visual fornecida pelo operador para preparar a reconciliação e os casos IAM-002/IAM-003. Sem alteração de identidade, grupo, papel ou aplicação nesta organização documental.

| Evidência | Resultado observado |
|---|---|
| [01 - Grupos de Carla](01-carla-grupos.png) | A tela Groups mostra GG_FIN_READ, Security, Assigned, origem Cloud. |
| [02 - Papéis de Carla](02-carla-papeis-diretorio.png) | Assigned roles / Directory roles mostra “No directory roles assigned.” |
| [03 - Aplicações de Carla](03-carla-aplicacoes.png) | Applications mostra “No application assignments found.” |
| [04 - Grupos de Gabriela](04-gabriela-grupos.png) | A tela Groups mostra GG_SUP_TICKET, Security, Assigned, origem Cloud. |
| [05 - Perfil atual de Carla](05-carla-conta-habilitada.png) | EMP0003, Account enabled = Yes, Member, Financeiro; criação em 21/09/2026, 11:59 no portal. |

Data da coleta informada pelo operador: 23/09/2026. As capturas 01–04 não mostram horário/fuso interno; os horários dos arquivos são metadados de recebimento, não horários comprovados da consulta. A captura 05 mostra o relógio do computador em 23/09/2026 às 12:00, sem fuso explícito. As pesquisas visíveis estão vazias. Não houve exportação completa por API ou teste de acesso nesta conferência.

## Carla: associação residual, sem papel ou aplicação atribuída nas telas

Carla tem associação ao GG_FIN_READ comprovada na captura. As consultas de papéis de diretório e atribuições de aplicações retornaram vazias. Portanto, não há papel administrativo de diretório nem atribuição de aplicação demonstrados nessas telas.

Isso não permite afirmar que Carla não pode acessar nenhum recurso: Azure role assignments não foi consultado, permissões internas de aplicações não foram auditadas, sessões não foram verificadas e aplicações que dispensam atribuição podem admitir autenticação. A consulta Applications informa limite de até 1000 atribuições diretas, herdadas ou consentidas; aqui retornou vazia.

O [CSV de 22/09](../inventario-entra-2026-09-22/05-conferencia-reconciliacao-2026-09-23.md) comprova historicamente EMP0003 habilitada; a captura 05 confirma Account enabled = Yes em 23/09. Object ID: `e7e071d7-e369-4438-ba91-19c1caac8d8b`. Conta habilitada e associação ao grupo divergem do esperado para o RH desligado dentro da regra do laboratório, mas não comprovam leitura de recurso financeiro no Entra.

### Cronologia do cenário simulado

O desligamento em **28/08/2026** é um evento fictício da fonte de RH. A conta foi efetivamente criada no laboratório em **21/09/2026**, para reproduzir uma divergência entre RH e diretório; a associação ao grupo foi registrada em 22/09 e o estado atual conferido em 23/09. Essas provas não demonstram que a conta permaneceu habilitada desde agosto nem permitem calcular um SLA real desde aquela data.

A reconciliação continua válida: compara o estado esperado no RH com a conta e associações observadas na coleta. A data de criação real é preservada. O campo `createdDateTime` é preenchido automaticamente e não pode ser alterado, conforme a [documentação do Microsoft Graph](https://learn.microsoft.com/en-us/graph/api/resources/user?view=graph-rest-1.0).

## Gabriela: referência de Suporte

A tela Groups retorna GG_SUP_TICKET. Essa associação é compatível com o RH vigente em Suporte. Papéis e aplicações de Gabriela não foram auditados nesta coleta. O [estado AD de 23/09](../IAM-002/08-gabriela-ad-grupos-diretos-2026-09-23.png) é uma prova separada; não há sincronização AD/Entra demonstrada.

## Limitação da simulação e da licença

No AD, a DL foi referenciada na ACL NTFS e nas permissões SMB de uma pasta, com testes de leitura/gravação. No Entra, o GG_FIN_READ é um grupo cloud independente, sem integração demonstrada com essa pasta ou uma aplicação. Recursos não ficam dentro de grupos: o recurso ou a aplicação precisa reconhecer a identidade/grupo e aplicar uma concessão.

Não é correto dizer que Entra Free impede toda permissão ou integração. A atribuição individual a aplicações existe; a atribuição de grupos a aplicações empresariais exige Entra ID P1/P2. Cada recurso possui mecanismos e requisitos próprios. O nome GG_FIN_READ, sozinho, não concede leitura.

Fontes oficiais consultadas em 23/09/2026: [atribuição individual e por grupo](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/what-is-access-management) e [grupos e recursos](https://learn.microsoft.com/en-us/entra/fundamentals/concept-learn-about-groups).

## Evolução posterior à coleta

- Comparação cadastral concluída em 23/09: [relatório e exceções](../reconciliacao-2026-09-23/README.md). Carla com habilitação incompatível; Gabriela conforme em habilitação/departamento. Comparação automática de grupos ainda não realizada.
- Leaver de Carla concluído posteriormente em 23/09: [prints, auditoria, sign-in e reconciliação final](../IAM-003/README.md). Este inventário preserva o estado anterior habilitado; não descreve o estado final.
- Executar o Mover de Gabriela somente com fonte efetiva e decisão registradas.

[Fila de tickets](../../../00-operacao-itsm/05-fila-tickets.md).
