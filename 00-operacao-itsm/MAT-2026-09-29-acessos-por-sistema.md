# Matriz vigente — população, acesso e responsabilidade

Revisão de 29/09/2026, vinculada ao [IAM-010](05-fila-tickets.md#iam-010). Decisão de desenho solicitada por Wesley no laboratório. Não é aprovação corporativa real nem evidência de implantação dos itens planejados. Substitui a matriz de 28/09 para novas avaliações; [resultado e regras anteriores](REV-2026-09-28-escopo-reconciliacao.md) permanecem históricos.

## Origem e regra geral

O RH tem nove pessoas e quatro áreas: Financeiro, Suporte, RH e TI. A revisão anterior comparou três grupos departamentais. Identificamos em 29/09 uma **lacuna de cobertura de TI**, que afeta Diego (EMP0004) e Isabela (EMP0009). Não foi comprovada uma falha de concessão contra uma regra de TI anterior, pois essa regra não existia no recorte.

Regra: pessoa ativa + conta prevista no sistema + necessidade de recurso + decisão registrada → concessão mínima. Área/cargo sozinhos não concedem acesso nem privilégio administrativo. Prazo vencido/desligamento impede nova concessão, mesmo que a área passe a ser contemplada na matriz.

Fonte RH vigente: cópia de 29/09 com Diego DESLIGADO, conforme término simulado em 29/09 às 08:00 UTC−03:00. Preservar admissão e matrículas. O motivo do encerramento é **fim da vigência do terceiro**, não falta de acesso nem ausência de TI na matriz. Terceirização justifica planejar um prazo; a data concreta vem do cenário, não de uma regra universal.

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
| Isabela — EMP0009 | TI, ativa | **Implantação planejada**, ainda sem conta: candidata ao caso TI/piloto híbrido, com leitura de procedimentos | **Implantação planejada**, ainda sem conta: preferir futura origem sincronizada, após preflight; não criar uma conta cloud separada por antecipação |

Isabela deixa de ser uma ausência indefinidamente ignorada: agora tem encaminhamento explícito, responsável Fernanda Souza no cenário e execução Wesley. Sem prazo de provisionamento vencido: iniciar após v0.5, no preparo do piloto. Até a ativação dessa etapa, classificar como **PLANEJADO**, não CONFORME nem acesso ausente de uma conta já provisionada. Se a etapa começar sem satisfazer o requisito, registrar pendência de implantação. Não ampliar a v0.5 com um novo Joiner apenas para preencher a matriz.

## 2. Catálogo de acesso por área

| Área / responsável de negócio simulado | Finalidade e elegibilidade | AD / recurso | Entra / limite da prova | Situação |
|---|---|---|---|---|
| Financeiro / Carlos Lima | Consultar relatórios; cargo com necessidade de leitura | GG_FIN_READ → DL_FIN_RELATORIOS_READ; ACL NTFS ReadAndExecute e compartilhamento compatível em RelatoriosFin; criação negada | GG_FIN_READ, associação direta; não comprova autorização em aplicativo | Implementado no recorte testado |
| Suporte / Daniela Alves | Consultar chamados fictícios | GG_SUP_TICKET → DL_SUP_TICKET_READ; leitura de SuporteLab, criação negada | GG_SUP_TICKET, associação direta; sem integração com sistema de chamados | Implementado no recorte testado |
| RH / Gabriel Nunes | Representar população de RH | Recurso AD não modelado; não criar pasta/grupo sem necessidade | GG_RH_READ; somente associação, sem documento/aplicação integrado | Implementação parcial intencional |
| TI / Fernanda Souza | Analista de Sistemas ativo, com necessidade aprovada de consultar procedimentos fictícios; terceiro somente durante vigência e mediante decisão individual | **Planejado:** GG_TI_READ → DL_TI_PROCEDIMENTOS_READ → pasta de procedimentos; leitura, sem criar/alterar/excluir | **Planejado:** avaliar sincronizar GG_TI_READ do AD; associação só comprovará acesso quando ligada a recurso/aplicação e testada | Regra definida em 29/09; objetos/recurso ainda não criados |

TI: não herdar permissões de administrador, reset de senhas, Financeiro ou RH por pertencer à área. Usar conteúdo fictício sem credenciais no futuro recurso. Confirmar proprietário, GPO/delegação da OU, ACL e SMB; testar leitura permitida e criação negada com conta comum. Registrar GUID/ID real de cada grupo quando implantado; o nome READ não impõe a permissão.

Para os grupos existentes, preservar os IDs e não renomear/recriar apenas para padronizar nomes. No Entra, GG/DL no nome não define escopo Global/Domain Local; essas categorias pertencem ao AD. Não copiar o aninhamento AD para um aplicativo cloud sem verificar o suporte.

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

Para a v0.5: correção documental registrada; Diego encerrado no IAM-004; serviço tratado; concluir SoD, tratar a classificação de vínculo de Diego e comparar o estado final no escopo vigente. Para a próxima fase: [análise e preparação híbrida](REV-2026-09-29-estrutura-hibrida.md), usando Isabela como candidata de menor risco ao primeiro piloto. Nenhuma mudança de diretório foi executada nesta revisão documental.
