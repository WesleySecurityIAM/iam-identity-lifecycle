# Recertificação simulada — 28/09/2026

## Escopo e decisão

Decisões didáticas registradas a pedido de Wesley em 28/09, após comparação dos CSVs com a matriz. Os responsáveis de negócio abaixo são os personagens do cenário; não houve comunicação ou aprovação real dessas pessoas. Wesley executa e documenta a simulação. Fontes e limites: [comparação de população/grupos](07-comparacao-populacao-grupos.md).

Cada linha corresponde a uma associação observada, não a uma pessoa adicional. Os mesmos nomes de grupo no AD e no Entra identificam objetos independentes. Para o Entra, manter a associação não comprova permissão ou uso de aplicativo.

## Decisão por associação observada

| Sistema | Identidade ou grupo membro | Grupo concedido | Decisão | Responsável no cenário | Justificativa |
|---|---|---|---|---|---|
| AD | Bruno — EMP0002 | GG_SUP_TICKET | Manter | Daniela Alves | Leitura de chamados necessária à função simulada; tratamento e teste permitiram leitura e negaram criação. |
| AD | Felipe — EMP0006 | GG_FIN_READ | Manter | Carlos Lima | Consulta de relatórios financeiros compatível com função e matriz. |
| AD | Gabriela — EMP0007 | GG_FIN_READ | Manter | Carlos Lima | Transferência efetiva para Financeiro; acesso anterior retirado e retestes documentados. |
| Entra | Ana — EMP0001 | GG_FIN_READ | Manter | Carlos Lima | Joiner ativo em Financeiro, conforme RH e matriz. |
| Entra | Bruno — EMP0002 | GG_SUP_TICKET | Manter | Daniela Alves | Associação departamental de Suporte prevista no cenário. |
| Entra | Elisa — EMP0005 | GG_RH_READ | Manter | Gabriel Nunes | Atividade de RH e grupo previsto na matriz. |
| Entra | Felipe — EMP0006 | GG_FIN_READ | Manter | Carlos Lima | Cargo financeiro e associação previstos. |
| Entra | Gabriela — EMP0007 | GG_FIN_READ | Manter | Carlos Lima | Mover concluído; associação de Suporte removida. |
| Entra | Henrique — EMP0008 | GG_RH_READ | Manter | Gabriel Nunes | Atividade de RH e grupo previsto na matriz. |
| AD | adm.wesley | GG_AD_SUP_RESET | Manter no escopo do laboratório | Wesley — responsável técnico simulado | Finalidade de administração delegada em Suporte, com prova anterior de reset permitido e negação fora do escopo testado; não equivale a administração de todo o domínio. |
| AD | GG_FIN_READ | DL_FIN_RELATORIOS_READ | Manter | Carlos Lima | Encadeamento que sustenta leitura financeira; não concede escrita por si só. |
| AD | GG_SUP_TICKET | DL_SUP_TICKET_READ | Manter | Daniela Alves | Encadeamento que sustenta leitura de Suporte; teste de Bruno confirmou o comportamento esperado. |
| AD | svc_relatorio_fin | GG_SVC_RELATORIO_FIN | Investigar retenção | Carlos Lima, com execução técnica de Wesley | Conta e tarefa encerradas no IAM-005, mas associação persiste. Definir se existe necessidade de futura reativação ou se os acessos devem ser retirados. |
| AD | GG_SVC_RELATORIO_FIN | DL_FIN_RELATORIOS_READ | Investigar retenção | Carlos Lima | Caminho de leitura da rotina desativada; justificar retenção ou remover após decisão. |
| AD | GG_SVC_RELATORIO_FIN | DL_FIN_SAIDA_WRITE | Investigar retenção | Carlos Lima | Caminho de escrita da rotina desativada; preservar como pendência, não aprovar automaticamente por estar desabilitada. |

**Resultado inicial em 28/09: 15 associações revisadas, 12 decisões de manter e 3 de investigar; nenhuma remoção executada naquela coleta.** As três pendências pertencem ao mesmo caso de retenção de acessos da conta de serviço, não a três incidentes independentes. Não há concessão nova nesta recertificação.

## Contas especiais e ausências

| Categoria | Contas | Tratamento |
|---|---|---|
| Internas AD | Administrator, Guest, krbtgt | Classificar como contas internas; não criar matrícula RH ou conceder grupo departamental. Revisão completa de privilégios internos fora do escopo. |
| Administração AD | adm.wesley | Finalidade técnica identificada; decisão da associação delegada consta acima. |
| Serviço AD | svc_relatorio_fin | Desabilitada na coleta; retenção das três associações requer decisão. Não comprovar necessidade apenas pelo estado Enabled=False. |
| Administração Entra | wesley lima | Conta administrativa do laboratório; conservar fora da matriz departamental. Papéis não foram reexportados nesta rodada. |
| Emergência Entra | Emergência LAB 01 e 02 | Finalidade documentada no PROC-BG-001; conservar separadas do provisionamento RH. Limites de independência/custódia permanecem os do procedimento. |
| Convidado Entra | Convidado LAB 01 | Encerrado no REQ-GUEST-001; coleta de usuários mostra desabilitado e os três grupos departamentais não o contêm. |
| Carla — EMP0003 | Entra | Manter bloqueada e sem grupos departamentais; não reprovisionar no AD. |
| Diego — EMP0004 | AD e Entra | Encerramento definido para 29/09 às 08:00 UTC−03:00 no IAM-004. Configuração/efeito do prazo e encerramento Entra precisam de evidência própria; a coleta de 16:59 antecede essa definição. |
| EMP0009 e demais ausências previstas | Conforme matriz | Não provisionar por ausência isolada. Rever escopo se surgir necessidade de negócio. |

## Atualização de cobertura em 29/09

A ausência de TI na matriz foi tratada por nova regra documentada no [IAM-010](../../../00-operacao-itsm/05-fila-tickets.md#iam-010) e na [matriz vigente](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md). Diego encerra pelo prazo; Isabela é implantação planejada, sem conta/concessão nova nesta revisão. As quinze decisões acima permanecem históricas dos vínculos coletados; não validam TI, todos os papéis nem prontidão híbrida. RH corrente atualizado em 29/09, sem modificar inventários anteriores.

## Pendências para conclusão

### Encaminhamento da conta de serviço

Recomendação de tratamento: retirar svc_relatorio_fin de GG_SVC_RELATORIO_FIN e, confirmada a ausência de outra rotina ou membro dependente, retirar esse GG das DL_FIN_RELATORIOS_READ e DL_FIN_SAIDA_WRITE. A finalidade original foi demonstrada e encerrada no IAM-005; não há necessidade futura de reativação documentada neste registro. Preservar a conta desabilitada e os grupos para rastreabilidade, sem reabilitar só para testar.

Esse encaminhamento integra a entrega do IAM-010. Antes da execução, conferir novamente conta, tarefa, membros e dependências; registrar a decisão simulada final. Depois, comprovar as três associações ausentes e a preservação dos caminhos de Felipe, Gabriela e Bruno. Não remover GG_FIN_READ da DL nem alterar ACL compartilhada. A evidência será de revogação de concessões; uma tentativa com conta desabilitada não isola o efeito dessa retirada.

**Tratamento concluído em 29/09:** três vínculos retirados conforme antes/depois; conta desabilitada e GG_FIN_READ preservado na DL de leitura. Decisão simulada formalizada em 29/09/2026 12:23:24 -0300, após as capturas. [Decisão, provas 11–13 e limites](10-servico-remocao-concessoes.md). Consolidado: doze manter e três remover; a tabela inicial registra a decisão histórica de investigar. O IAM-005 permanece histórico, com o estado entregue naquela ocasião.

1. **Concluído:** tratar os três vínculos residuais da conta de serviço; decisão e comparação das consultas registradas na evidência 10. Nova coleta integral dos vínculos atuais fica para a conferência final da revisão.
2. **IAM-004 concluído em 29/09:** comparação final do estado da conta conforme. [Provas](../IAM-004/README.md). Ajuste cadastral: Employee type=Funcionário no Entra versus vínculo Terceiro de Sistemas no RH; confirmar/corrigir mantendo conta bloqueada. Contadores de concessões zero já comprovados.
3. Executar e documentar o microcaso SoD-001 em dados separados.

Esta revisão não revalida todas as ACLs, papéis administrativos, aplicações, licenças ou sessões. As decisões se limitam às associações exportadas e às finalidades documentadas. IAM-010 permanece em andamento até tratamento ou aceitação formal das pendências no cenário e conclusão dos critérios previstos.
