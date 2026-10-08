# Recertificação simulada — 28/09/2026

Decisões de 28/09 e conclusão em 29/09. As três decisões iniciais de investigar foram resolvidas pela retirada dos vínculos de serviço.

## Escopo e decisão

Decisões simuladas por Wesley, após [comparação dos CSVs com a matriz](07-comparacao-populacao-grupos.md). Responsáveis de negócio fictícios, sem comunicação ou aprovação externa real.

Cada linha corresponde a uma associação observada, não a uma pessoa adicional. Os mesmos nomes de grupo no AD e no Entra identificam objetos independentes. Para o Entra, manter a associação não comprova permissão ou uso de aplicativo.

<a id="decisoes-2809"></a>

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

**28/09: 15 associações revisadas, 12 manter e 3 investigar**, estas da mesma conta de serviço. Sem nova concessão ou remoção nesta etapa.

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

<a id="cobertura-ti-2909"></a>

## Atualização de cobertura em 29/09

A [matriz de 29/09](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md) incluiu TI. Isabela foi implementada no AD: [cadastro, grupos e testes](ti-isabela/README.md). Decisão simulada por Wesley, com Fernanda Souza como responsável fictícia: manter Isabela em GG_TI_READ e GG_TI_READ na DL_TI_PROCEDIMENTOS_READ para consulta de procedimentos. São duas associações adicionais às quinze de 28/09. Entra permanece planejado. RH atualizado em 29/09; inventários anteriores preservados. Registro: [IAM-010](../../../00-operacao-itsm/05-fila-tickets.md#iam-010).

## Conclusão em 29/09

<a id="servico-2909"></a>

**Serviço:** três vínculos retirados; conta desabilitada e GG_FIN_READ preservado na DL de leitura. Capturas 12:08–12:14; decisão simulada formalizada às **12:23:24 -0300**, posteriormente. [Provas 11–13](10-servico-remocao-concessoes.md). Consolidado das quinze associações: **12 manter e 3 remover**.

| Demais verificações | Prova e resultado |
|---|---|
| Diego — encerramento pelo prazo | [IAM-004](../IAM-004/README.md): encerramento concluído; contadores de concessões zero. |
| SoD em dados separados | [SoD-001](14-sod-resultado.md): um conflito antes e zero depois. |
| Conferência final AD | [17](17-conferencia-final-ad.md), após a coleta das 17:24:44–17:24:48: oito associações conformes; zero ausentes/excedentes; cadastro e retirada dos vínculos de serviço conferidos. |

IAM-010 fechado em 29/09 no escopo das associações exportadas e finalidades documentadas; sem revalidação integral de ACLs, papéis, aplicações, licenças ou sessões.

[Voltar ao índice por assunto](README.md).
