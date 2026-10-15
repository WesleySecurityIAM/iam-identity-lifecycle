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

**Por que ampliar:** a revisão encontrou pessoas de TI no RH, mas a matriz inicial só definia perfis de Financeiro, Suporte e RH. Isabela (EMP0009) já era Analista de Sistemas, ativa, em TI; faltava definir o acesso necessário. [Fontes de RH e lacuna da matriz](00-fontes-rh-e-lacuna-ti.md).

**Decisão simulada de 29/09:** Wesley, com Fernanda Souza como responsável de negócio fictícia, definiu leitura de procedimentos de TI para Isabela no AD. A [matriz ampliada](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md#catalogo-acessos) passou a cobrir esse perfil. A ausência anterior era prevista no escopo de 28/09, não uma infração retroativa.

Após [provisionamento e testes de leitura permitida/criação negada](ti-isabela/README.md), a decisão complementar foi:

| Associação AD | Decisão | Justificativa |
|---|---|---|
| Isabela → GG_TI_READ | Manter | Consulta de procedimentos necessária à função simulada. |
| GG_TI_READ → DL_TI_PROCEDIMENTOS_READ | Manter | Encadeamento que concede leitura no recurso; sem privilégio administrativo pelo cargo. |

São **duas associações adicionais** às quinze de 28/09. Entra permanece planejado. Isabela não mudou de área no RH; a atualização de 29/09 registrou o encerramento de Diego. Inventários e regras anteriores foram preservados. A [conferência final AD](17-conferencia-final-ad.md) valida o novo recorte.

## Conclusão em 29/09

<a id="servico-2909"></a>

**Serviço — investigar → remover:** rotina encerrada, sem necessidade futura de reativação documentada; três vínculos retirados, conta desabilitada e GG_FIN_READ preservado na DL de leitura. Carlos Lima representa o responsável financeiro fictício e Wesley executa. Capturas 12:08–12:14; a [decisão simulada foi registrada às 12:23:24 UTC−03:00](10-servico-remocao-concessoes.md#decisao-servico), depois da retirada, sem comprovar aprovação anterior. [Provas 11–13](10-servico-remocao-concessoes.md). Consolidado das quinze associações: **12 manter e 3 remover**.

| Demais verificações | Prova e resultado |
|---|---|
| Diego — encerramento pelo prazo | [IAM-004](../IAM-004/README.md): encerramento concluído; contadores de concessões zero. |
| SoD em dados separados | [SoD-001](14-sod-resultado.md): um conflito antes e zero depois. |
| Conferência final AD | [17](17-conferencia-final-ad.md), após a coleta das 17:24:44–17:24:48: oito associações conformes; zero ausentes/excedentes; cadastro e retirada dos vínculos de serviço conferidos. |

IAM-010 fechado em 29/09 no escopo das associações exportadas e finalidades documentadas; sem revalidação integral de ACLs, papéis, aplicações, licenças ou sessões.

[Voltar ao índice por assunto](README.md).
