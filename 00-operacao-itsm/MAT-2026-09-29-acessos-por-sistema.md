# Matriz geral fictícia — cargos, recursos e acesso por sistema

Revisão de 29/09/2026, vinculada ao [IAM-010](05-fila-tickets.md#iam-010). Decisão de desenho solicitada por Wesley no laboratório. Não é aprovação corporativa real nem evidência de implantação dos itens planejados. Substitui a matriz de 28/09 para novas avaliações; [resultado e regras anteriores](REV-2026-09-28-escopo-reconciliacao.md) permanecem históricos.

## Origem e regra geral

O RH tem nove pessoas e quatro áreas: Financeiro, Suporte, RH e TI. A revisão anterior comparou três grupos departamentais. Identificamos em 29/09 uma **lacuna de cobertura de TI**, que afeta Diego (EMP0004) e Isabela (EMP0009). Não foi comprovada uma falha de concessão contra uma regra de TI anterior, pois essa regra não existia no recorte.

Regra: pessoa ativa + conta prevista no sistema + necessidade de recurso + decisão registrada → concessão mínima. Área/cargo sozinhos não concedem acesso nem privilégio administrativo. Prazo vencido/desligamento impede nova concessão, mesmo que a área passe a ser contemplada na matriz.

Fonte RH vigente: cópia de 29/09 com Diego DESLIGADO, conforme término simulado em 29/09 às 08:00 UTC−03:00. Preservar admissão e matrículas. O motivo do encerramento é **fim da vigência do terceiro**, não falta de acesso nem ausência de TI na matriz. Terceirização justifica planejar um prazo; a data concreta vem do cenário, não de uma regra universal.

<a id="populacao"></a>

## 1. População por sistema

“Esperado” é regra, não estado já comprovado. A população-base é da coleta de 28/09. Complemento de Diego em 29/09: prints, auditoria e novo All users comprovam encerramento e comparação final; [IAM-004](05-fila-tickets.md#iam-004). Isso não atualiza automaticamente todas as outras associações.

| Pessoa | Área / situação vigente | AD: estado e acesso esperados | Entra: estado e acesso esperados |
|---|---|---|---|
| Ana — EMP0001 | Financeiro, ativa | Não provisionar nesta fase; necessidade somente cloud no recorte | Habilitada, GG_FIN_READ |
| Bruno — EMP0002 | Suporte, ativo | Habilitada, GG_SUP_TICKET → leitura SuporteLab | Habilitada, GG_SUP_TICKET |
| Carla — EMP0003 | Financeiro, desligada | Não provisionar; investigar objeto inesperado | Bloqueada, sem concessões departamentais; preservar prova do Leaver |
| Diego — EMP0004 | TI, terceiro encerrado às 08:00 de 29/09 | Expiração vigente; validar efeito antes de eventual bloqueio manual; sem novas concessões; conferir e retirar concessões remanescentes | Bloqueada e sessões revogadas; nenhuma concessão departamental prevista; conferir papéis/aplicações |
| Elisa — EMP0005 | RH, ativa | Não provisionar nesta fase; necessidade somente cloud no recorte | Habilitada, GG_RH_READ |
| Felipe — EMP0006 | Financeiro, ativo | Habilitada, GG_FIN_READ → leitura RelatoriosFin | Habilitada, GG_FIN_READ |
| Gabriela — EMP0007 | Financeiro, ativa | Habilitada, OU Financeiro, GG_FIN_READ; sem GG_SUP_TICKET | Habilitada, GG_FIN_READ; sem GG_SUP_TICKET |
| Henrique — EMP0008 | RH, ativo | Não provisionar nesta fase; necessidade somente cloud no recorte | Habilitada, GG_RH_READ |
| Isabela — EMP0009 | TI, ativa | **Implementado no AD em 29/09:** habilitada, GG_TI_READ → DL_TI_PROCEDIMENTOS_READ; leitura de ProcedimentosTI permitida e criação negada | **Implantação planejada**, ainda sem conta: preferir futura origem sincronizada, após preflight; não criar uma conta cloud separada por antecipação |

Isabela deixa de ser uma ausência indefinidamente ignorada: agora tem encaminhamento explícito, responsável Fernanda Souza no cenário e execução Wesley. A execução local foi antecipada por solicitação de Wesley em 29/09: [provas de cadastro, grupos, ACL e testes](../evidencias/sanitizadas/IAM-010/ti-isabela/README.md). No AD, a regra passa a ser vigente e entra na conferência final; a ausência no Entra continua PLANEJADO para futura origem sincronizada após preflight. Não tratar essa ausência cloud como falha de provisionamento atual.

<a id="catalogo-acessos"></a>

## 2. Catálogo de acesso por área, cargo e recurso

Esta é a matriz geral do **recorte fictício do laboratório**, não um catálogo de todos os sistemas de uma empresa real. O RH informa pessoa, área, cargo, situação e datas. A matriz relaciona o perfil à necessidade de recurso e à concessão mínima; a decisão do ticket aplica a regra à pessoa. Estar na área ou na OU não concede acesso automaticamente.

| Área / cargo do perfil ativo | Recurso e nível necessário no AD | Associação no Entra / alcance | Responsável simulado / situação |
|---|---|---|---|
| Financeiro / Analista Financeiro | Consultar relatórios: `GG_FIN_READ → DL_FIN_RELATORIOS_READ → RelatoriosFin`; NTFS ReadAndExecute, SMB compatível com leitura; criação negada | `GG_FIN_READ`; somente associação, sem aplicação financeira integrada | Carlos Lima / implementado no recorte testado |
| Suporte / Analista de Suporte | Consultar chamados fictícios: `GG_SUP_TICKET → DL_SUP_TICKET_READ → SuporteLab`; leitura permitida, criação negada | `GG_SUP_TICKET`; sem integração com sistema de chamados | Daniela Alves / implementado no recorte testado |
| RH / Analista de RH | Recurso AD não modelado; não provisionar conta/pasta/grupo nesta fase | `GG_RH_READ`; associação para representar o perfil, sem documento/aplicação integrado | Gabriel Nunes / implementação parcial intencional |
| TI / Analista de Sistemas | Consultar procedimentos: `GG_TI_READ → DL_TI_PROCEDIMENTOS_READ → ProcedimentosTI`; leitura permitida, criação negada; edição/exclusão não testadas | Planejado: futura origem sincronizada; Isabela ainda sem conta cloud nesta entrega | Fernanda Souza / AD implementado em 29/09; Entra planejado |

**Perfis encerrados também constam da população:** Carla, Assistente Financeiro, não recebe novas concessões porque está desligada. Diego, Terceiro de Sistemas em TI, encerrou a vigência: nenhum acesso de TI é concedido a ele por esta revisão. Outro assistente ou terceiro futuro exige necessidade, prazo e decisão próprios; não inferir uma autorização inexistente só pelo título. Contas de serviço e administrativas usam os controles específicos abaixo, fora do perfil humano comum.

**Exemplo do Mover:** RH muda Gabriela para Analista Financeiro → decisão manda retirar Suporte e conceder Financeiro → AD recebe a associação ao GG financeiro → a DL autoriza leitura na ACL do recurso, sujeita também ao compartilhamento SMB → testes validam o observado. No Entra independente, comprova-se cadastro/grupo; não leitura desse arquivo.

Clareza de cargos e navegação acrescentada em 07/10/2026. As regras e os resultados continuam sendo os da revisão de 29/09; nenhuma concessão foi criada nesta atualização documental.

TI: não herdar permissões de administrador, reset de senhas, Financeiro ou RH por pertencer à área. Usar conteúdo fictício sem credenciais no futuro recurso. Confirmar proprietário, GPO/delegação da OU, ACL e SMB; testar leitura permitida e criação negada com conta comum. Registrar GUID/ID real de cada grupo quando implantado; o nome READ não impõe a permissão.

Para os grupos existentes, preservar os IDs e não renomear/recriar apenas para padronizar nomes. No Entra, GG/DL no nome não define escopo Global/Domain Local; essas categorias pertencem ao AD. Não copiar o aninhamento AD para um aplicativo cloud sem verificar o suporte.

<a id="controles-transversais"></a>

## 3. Controles transversais

| Categoria | Regra / decisão |
|---|---|
| Terceiros | Owner, finalidade, início e término; revisão de grupos/papéis/aplicações e sessões no encerramento; expiração AD não agenda bloqueio Entra neste ambiente independente |
| Administração | Conta técnica separada da conta comum; adm.wesley/GG_AD_SUP_RESET é delegação específica, não perfil de todo TI; revisar escopo da delegação |
| Serviço | svc_relatorio_fin permanece desabilitada; três vínculos retirados e comprovados em 29/09 no IAM-010 após consulta de dependências locais; nova finalidade exige decisão e concessões mínimas; não distribuir senha nem reativar para testar |
| Emergência | Preservar as duas contas cloud-only, fora do piloto híbrido e dos grupos departamentais; manter procedimento e limitações já registrados |
| Convidado | Sponsor, finalidade e prazo; manter encerramento comprovado e fora da sincronização AD |
| Internas AD | Administrator, Guest e krbtgt fora da população RH; não atribuir matrícula nem tratar Guest/krbtgt desabilitados como falha |
| SoD | Aplicar apenas a regra fictícia documentada de fornecedor/manutenção + aprovação de orçamento no mesmo escopo; leitura Financeiro não confere esses poderes |

## 4. Como reconciliar sem esconder lacunas

1. Registrar versão da matriz, versão do RH, sistema, horário/fuso e completude da coleta.
2. Classificar conta humana, privilegiada, serviço, emergência, convidado ou interna. Correlacionar pessoas por matrícula única e conferir IDs dos objetos.
3. Verificar se há regra para a área, função, sistema e recurso. Sem regra → **PENDÊNCIA_DE_REGRA**, nunca aprovação automática.
4. Verificar se a implantação está vigente. Item futuro explícito → **PLANEJADO**; ausência intencional de conta → **FORA_DO_ESCOPO_JUSTIFICADO**.
5. Para requisitos vigentes: comparar contas/estado e pares identidade-concessão → CONFORME, AUSENTE ou EXCEDENTE. Fonte faltante, duplicada ou desatualizada → INCONCLUSIVO.
6. Revisor decide manter/remover/investigar; executar e coletar de novo. Estado bloqueado não substitui conferência de permissões residuais.

O script Compare-DepartmentMembership.ps1 permanece **histórico de 28/09**: regras fixas e três grupos. Não executa esta matriz nova nem cobre TI, prazos ou readiness híbrido. Adaptar o comparador com coleta nova e regras versionadas antes de usar seu resultado para a nova revisão. Não rebatizar as nove associações conformes antigas como validação da matriz de 29/09.

## 5. Encaminhamento

Para a v0.5: correção documental registrada; Diego encerrado no IAM-004; serviço tratado; SoD e comparação final AD concluídos; IAM-010 fechado no escopo vigente. Alteração de Employee type não integra as tarefas do caso. Para a próxima fase: [análise e preparação híbrida](REV-2026-09-29-estrutura-hibrida.md), usando Isabela como candidata de menor risco ao primeiro piloto. A revisão documental foi seguida da implementação de TI pelo operador, com evidências próprias. Isso não comprova sincronização híbrida.

<a id="uso-nos-tickets"></a>

## 6. Qual regra consultar em cada ticket

O ticket mantém sua fonte e decisão históricas. Esta consolidação organiza a consulta; não transforma a matriz de 29/09 em aprovação anterior nem comprova execução.

| Ticket / assunto | Fonte aplicada e como usar a matriz |
|---|---|
| [IAM-001 — Felipe](05-fila-tickets.md#iam-001) | RH e [regra original do cargo](../evidencias/sanitizadas/IAM-001/EV-IAM-001-02-regra-matriz.csv) fundamentam a criação. Financeiro no catálogo ajuda a revisar o modelo; o resultado cloud é associação. |
| [IAM-002 — Gabriela](05-fila-tickets.md#iam-002-regra-acesso) | RH e decisão de 28/09: sair de Suporte, entrar em Financeiro. O ticket mostra exatamente grupo, recurso e teste esperado por sistema. |
| [IAM-003 — Carla](05-fila-tickets.md#iam-003) e [IAM-004 — Diego](05-fila-tickets.md#iam-004) | Desligamento/prazo individual prevalece sobre o perfil departamental: bloquear/expirar conforme o sistema, revisar vínculos e sessões. Não conceder acesso novo. |
| [IAM-005 — serviço](05-fila-tickets.md#iam-005) | Decisão da rotina de 15/09 define entrada de leitura e saída de escrita. A regra vigente de serviço registra o encerramento e retirada posterior no IAM-010; não altera o histórico. |
| [IAM-006 — login](05-fila-tickets.md#iam-006) e [IAM-007 — MFA](05-fila-tickets.md#iam-007) | Logs e requisitos de autenticação sustentam o resultado. A matriz de recursos não comprova senha correta, MFA utilizado ou login bem-sucedido. |
| [IAM-008 — acesso direto](05-fila-tickets.md#iam-008) e [IAM-009 — sessão SMB](05-fila-tickets.md#iam-009) | Regra financeira e configuração consultada em 17/09. O catálogo explica GG/DL/recurso; os testes pertencem às datas de cada caso. |
| [IAM-010 — recertificação](05-fila-tickets.md#iam-010) | Usa a [regra de 28/09](REV-2026-09-28-escopo-reconciliacao.md) na primeira comparação e esta revisão de 29/09 no fechamento AD com TI. SoD possui regra própria de direitos fictícios. |
| [IAM-011 — Ana](05-fila-tickets.md#iam-011) | RH PRE_ADMISSAO, data de entrada e decisão de 15/09: só então habilitar e conceder GG_FIN_READ. O perfil financeiro não autoriza entrada antecipada. |

Para outra combinação de cargo, recurso ou sistema ainda não definida, registrar **PENDÊNCIA_DE_REGRA** e decidir antes de conceder. A tabela de população determina quem precisa de conta em cada sistema; não basta copiar o grupo para todas as pessoas da área.
