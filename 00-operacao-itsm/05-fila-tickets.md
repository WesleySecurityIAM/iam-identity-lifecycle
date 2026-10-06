# Fila de tickets do laboratório

| Ticket | Objetivo | Resultado documentado |
|---|---|---|
| [IAM-001](#iam-001) | Provisionar Felipe no Entra | Identidade/grupo comprovados; cadastro complementado em 10/09. |
| [IAM-002](#iam-002) | Mover de Suporte para Financeiro | Fechado: Suporte retirado/negado, Financeiro validado e comparação final conforme. |
| [IAM-003](#iam-003) | Leaver de Carla no Entra | Fechado: conta/grupo tratados, revogação auditada, entrada bloqueada e comparação final conforme. |
| [IAM-004](#iam-004) | Encerrar acesso de terceiro por prazo | Fechado em 29/09: expiração AD validada; Entra bloqueado, sessões revogadas e comparação final conforme. |
| [IAM-005](#iam-005) | Executar rotina com conta de serviço | Duas execuções, escritas indevidas negadas e desativação final. |
| [IAM-006](#iam-006) | Restabelecer autenticação | Alteração/redefinição de senha e entradas posteriores confirmadas. |
| [IAM-007](#iam-007) | Verificar cadastro e uso de MFA | Método cadastrado e uso comprovados separadamente. |
| [IAM-008](#iam-008) | Avaliar acesso direto | Fechado: acesso por grupo mantido; permissão individual não concedida. |
| [IAM-009](#iam-009) | Investigar acesso após remoção de grupo | Fechado: acesso persistiu; reconexão negou leitura; restauração comprovada. |
| [IAM-010](#iam-010) | Recertificar acessos e avaliar conflito SoD | Fechado em 29/09: decisões e tratamentos registrados; TI, SoD e conferência final AD concluídos no escopo documentado. |
| [IAM-011](#iam-011) | Preparar e ativar Ana | Pré-admissão bloqueada; ativação, grupo, troca de senha e entrada com MFA. |

**Procedimento complementar:** [PROC-BG-001 — Acesso de emergência](PROC-BG-001-acesso-emergencia.md): teste administrativo validado em 24/09; independência da autenticação e custódia a validar. Não altera a contagem dos 11 cenários.

**Solicitação complementar:** [REQ-GUEST-001 — Convidado externo B2B](REQ-GUEST-001.md): fechado em 25/09; convite, sponsor e aceite em 22/09; conta desabilitada, revogação auditada e estado final sem grupos/aplicações/papéis no resumo do portal. Registro separado dos 11 cenários IAM do plano.

<a id="iam-001"></a>

# IAM-001 — Provisionamento de identidade — EMP0006

- Ambiente: laboratório fictício — Microsoft Entra ID Free
- Tipo: requisição de provisionamento
- Identidade: EMP0006 — Felipe Gomes
- Abertura: 2026-09-03
- Fechamento registrado: 2026-09-04
- Status registrado: Resolvido
- Acompanhamento documental: [REV-IAM-001-01](acompanhamentos.md), concluído em 2026-09-10 após validação do CSV (evidência 07); responsável Wesley
- SLA didático definido: 1 dia útil
- Tickets relacionados: IAM-006 e IAM-007

## Contexto e objetivo

Criar a conta de Felipe no Entra, preencher os atributos conforme o RH
e associá-la ao GG_FIN_READ, seguindo a regra de acesso do cargo.

## Estado anterior

Felipe estava ativo no RH, mas ainda não possuía conta no tenant,
conforme o registro do atendimento.

## Aprovação e fundamento

- [Fonte de RH](../evidencias/sanitizadas/IAM-001/EV-IAM-001-01-fonte-rh.csv), versão informada
  de 2026-08-29: EMP0006, Analista Financeiro, área Financeiro,
  gestor Carlos Lima.
- [Matriz de acesso](../evidencias/sanitizadas/IAM-001/EV-IAM-001-02-regra-matriz.csv):
  Analista Financeiro → GG_FIN_READ.
- Aprovador previsto: Gestor Financeiro.
- Aprovação simulada para fins didáticos.

## Ações realizadas

- **Concluído:** Conta cloud-only criada e associada ao GG_FIN_READ.
- **Concluído:** Employee ID EMP0006 e departamento Financeiro preenchidos.
- **Concluído:** conferir o cargo no CSV de 10/09; o preenchimento original foi informado no atendimento.
- **Concluído:** Inventário de usuários exportado em 2026-09-04.

## Validação

A auditoria confirmou criação, departamento Financeiro, conta habilitada e associação ao grupo. O inventário de 04/09 confirmou a identidade e a matrícula, mas não continha a coluna de cargo.

Em 10/09, nova exportação confirmou EMP0006, Analista Financeiro, Financeiro e accountEnabled=True (evidência 07). A captura 06 é complementar.

## Teste de acesso

Não realizado: o grupo não está integrado a uma aplicação. A evidência comprova provisionamento e associação ao grupo, sem afirmar acesso permitido ou negado ao recurso.

## Evidências

[Roteiro do IAM-001](../evidencias/sanitizadas/IAM-001/README.md): Felipe, do fundamento à conferência cadastral.

| Etapa e propósito | Provas do assunto |
|---|---|
| Definir identidade e acesso esperado | [01 — RH](../evidencias/sanitizadas/IAM-001/EV-IAM-001-01-fonte-rh.csv) e [02 — regra do cargo](../evidencias/sanitizadas/IAM-001/EV-IAM-001-02-regra-matriz.csv). |
| Comprovar provisionamento e associação | [03 — criação da conta](../evidencias/sanitizadas/IAM-001/EV-IAM-001-03-add-user.md) e [04 — inclusão no grupo](../evidencias/sanitizadas/IAM-001/EV-IAM-001-04-add-member-group.md). |
| Conferir o cadastro exportado | [05 — matrícula no inventário](../evidencias/sanitizadas/IAM-001/EV-IAM-001-05-inventario-employee-id.md). |
| Complementar o cargo em 10/09 | [06 — tela do cadastro](../evidencias/sanitizadas/IAM-001/EV-IAM-001-06-cargo-atual.png) e [07 — confirmação no CSV](../evidencias/sanitizadas/IAM-001/EV-IAM-001-07-cargo-inventario-2026-09-10.md). Complemento posterior, sem alterar o fechamento de 04/09. |

## Riscos e reversão

Risco: concessão de grupo incompatível com a necessidade autorizada.

Se a concessão for considerada inválida, remover a associação indevida
e avaliar o bloqueio da conta conforme o procedimento, preservando os logs.

## Limitações e pendências

- O grupo não está integrado ao sistema financeiro; não houve teste de acesso ao recurso.
- A correlação entre RH e Entra foi manual.
- A captura 06 é uma tela de edição, sem confirmação de salvamento. O CSV 07 comprova o estado cadastral de 10/09, mas não demonstra retroativamente o cargo em 03/09.

## Fechamento

Resolvido em 04/09/2026, com criação, matrícula e associação ao grupo comprovadas. Em 10/09, o CSV 07 concluiu REV-IAM-001-01, sem alteração de conta por esta revisão. A evidência posterior complementa a conferência cadastral e não modifica a data original do fechamento.

<a id="iam-002"></a>

# IAM-002 — Mover de Suporte para Financeiro — EMP0007

- Ambiente: laboratório fictício — AD DS/SMB e Microsoft Entra ID cloud-only, sem sincronização
- Tipo: requisição de mudança de função — Mover/JML
- Identidade: EMP0007 — Gabriela Santos
- Abertura e preparação: 2026-09-22
- Status: Fechado — Mover validado no escopo
- Responsável pela execução: Wesley
- Execução e fechamento: 2026-09-28

Complemento de 28/09, decidido às 16:14 UTC−03:00: [movimentação para OU Financeiro](REV-2026-09-28-escopo-reconciliacao.md). Provas 24–28 mostram antes/depois com identidade e grupo preservados e testes de acesso esperados entre 16:20 e 16:35. A análise de políticas/delegação e a renovação completa das conexões não constam das capturas; nova exportação AD de 16:59:31 confirma a localização e as associações, conforme validação do IAM-010.

## Contexto e objetivo

Transferir Gabriela de Suporte para Financeiro, removendo o acesso antigo antes de conceder o novo. Preservar a identidade e comprovar ausência de acesso acumulado. Em 22/09 foi preparada somente a referência inicial para comparação.

## Estado anterior

Na preparação, Gabriela estava habilitada no AD, EMP0007, Analista de Suporte, OU Suporte. Pertencia ao GG_SUP_TICKET, membro de DL_SUP_TICKET_READ. A DL concede leitura no recurso fictício SuporteLab. O inventário do Entra registra a mesma matrícula e área em uma conta independente.

## Aprovação e fundamento

- Preparação do laboratório solicitada por Wesley em 22/09.
- Fonte anterior de RH: EMP0007 em Suporte, Analista de Suporte, gestora Daniela Alves; preservada como referência inicial.
- **Evento simulado de RH registrado em 28/09/2026, com vigência em 28/09/2026:** EMP0007 passa a Analista Financeiro, área Financeiro, gestor Carlos Lima. Nova fonte copiada da versão de 23/09; somente cargo, área e gestor de Gabriela foram alterados. Matrícula, admissão, status ATIVO e demais pessoas preservados.
- Decisão simulada registrada em 28/09/2026: os responsáveis fictícios de Suporte (Daniela Alves) e Financeiro (Carlos Lima) autorizam transferir EMP0007 para Financeiro, retirando GG_SUP_TICKET antes de conceder GG_FIN_READ, mantendo a identidade existente e sem acumulação dos dois acessos. Execução técnica: Wesley.
- **Horário fictício da decisão no cenário: 28/09/2026, 10:53 UTC−03:00**, escolhido como 15 minutos antes das 11:08 mostradas no relógio da captura do Entra. Esse horário compõe a simulação; não é timestamp de auditoria nem comprovação de aprovação real prévia. Fonte de RH e decisão não comprovam execução nos diretórios.

<a id="iam-002-regra-acesso"></a>

### Matriz de acesso — referência do Mover

[Matriz consolidada de 29/09 — população e catálogo por sistema](MAT-2026-09-29-acessos-por-sistema.md). Vínculo explicitado na revisão documental de 06/10/2026. A matriz consolida as regras para avaliações posteriores; a autorização da execução de 28/09 é a decisão simulada registrada acima.

Aplicação da regra à Gabriela, conforme RH, necessidade e escopo do caso:

| Perfil / sistema | Acesso esperado | Recurso e validação |
|---|---|---|
| Financeiro / Analista Financeiro ativa, EMP0007 | Consulta de relatórios autorizada por Carlos Lima no cenário; preservar identidade e retirar Suporte | Área e cargo descrevem o perfil; não autorizam todos os recursos do departamento. |
| AD | GG_FIN_READ → DL_FIN_RELATORIOS_READ; sem GG_SUP_TICKET | RelatoriosFin: leitura permitida e criação negada; SuporteLab: leitura negada após retirada. |
| Entra | Habilitada, cadastro financeiro, GG_FIN_READ presente e GG_SUP_TICKET ausente | Cadastro e associação; nenhuma aplicação financeira integrada e testada. |

A matriz é referência do **esperado**; as capturas, auditoria e comparação abaixo documentam o **observado**.

## Ações realizadas

- **Concluído:** conferir cadastro e associação ao grupo global (01–02).
- **Concluído:** preparar associação GG/DL e permissões NTFS/SMB de leitura (03–04).
- **Concluído, conforme operador:** retirar a exigência de troca de senha para o teste do laboratório (05), sem alegar troca realizada pela usuária.
- **Concluído:** conectar como Gabriela, ler o arquivo e observar criação de arquivo negada (06–07).
- **Concluído — 23/09:** reconciliar RH × CSV Entra de 22/09 por matrícula; Gabriela conforme em habilitação e departamento Suporte, preservando o estado anterior ao Mover.
- **Concluído — 23/09, complemento:** nova exportação confirma Gabriela True/Suporte; comparação posterior ao Leaver de Carla mantém as duas regras conformes, sem executar o Mover.
- **Concluído — 28/09:** preparar fonte de RH com a mudança vigente; versão anterior preservada, nove registros mantidos e alteração limitada aos três campos de EMP0007.
- **Concluído — 28/09:** coletar estado anterior no AD (11:01:02 UTC−03:00) e perfil no Entra (relógio da estação às 11:08); registrar decisão simulada e reversão prevista.
- **Concluído — 28/09:** retirar Suporte, confirmar ausência no grupo e leitura negada após conexão explícita; atualizar cadastro, conceder Financeiro e comprovar leitura permitida/criação negada (15–19).
- **Concluído — 28/09:** conferir identidade/cadastro/grupos no Entra e auditoria de remoção → cadastro → inclusão; comparar RH com exportações finais: seis regras conformes (20–23).

## Validação e teste de acesso

Em 22/09, UTC−03:00: associação GG/DL às 11:26:08; ACL e compartilhamento às 11:35:49; conexão como EMPRESA\gabriela.santos e leitura às 11:57:15; criação de arquivo negada às 11:58:50. Estado inicial demonstrado, sem evidência de mudança de área nesta data.

Em 23/09 às 16:57:25 UTC−03:00, a captura da reconciliação apresenta duas verificações conformes para EMP0007: habilitação True/True e departamento Suporte/Suporte. A fonte observada continua sendo o CSV de 22/09; grupos e acessos efetivos não foram comparados pelo script.

Em 28/09, Suporte ausente no AD às 11:33:46 e leitura negada às 11:36:50. Cadastro e grupos finais às 11:42:55; leitura financeira permitida às 11:52:39 e criação negada às 11:54:34. Auditoria Entra confirma remoção às 11:56:12, cadastro às 11:58:04 e inclusão às 11:58:42 (UTC−03:00). Nova comparação após as mudanças: seis regras conformes e zero exceções no escopo, com fontes e limites na prova 23.

## Evidências

### Fonte da mudança e execução — 28/09

- [12 — Fonte de RH vigente em 28/09](../evidencias/sanitizadas/IAM-002/12-fonte-rh-mover-2026-09-28.csv): define o perfil esperado; não é consulta ao diretório. A regra de acesso está em [Matriz de acesso — referência do Mover](#iam-002-regra-acesso), acima.
- [13 — Estado anterior no AD](../evidencias/sanitizadas/IAM-002/13-gabriela-ad-antes-mover-2026-09-28.png): EMP0007 habilitada, Suporte/Analista de Suporte, GG_SUP_TICKET presente; GG_FIN_READ retorna somente Felipe.
- [14 — Estado anterior no Entra](../evidencias/sanitizadas/IAM-002/14-gabriela-entra-antes-mover-2026-09-28.png): EMP0007 habilitada, Suporte/Analista de Suporte, sem sincronização local; não mostra grupos.
- [15–21 — Execução e estado final](../evidencias/sanitizadas/IAM-002/README.md#execução-e-fechamento--2809): consultar a tabela desta seção para remoção, testes e cadastro/grupos finais.
- [22 — Auditoria Entra do Mover](../evidencias/sanitizadas/IAM-002/22-auditoria-entra-mover.md): remoção de Suporte, atualização cadastral e inclusão em Financeiro.
- [23 — Comparação final com RH](../evidencias/sanitizadas/IAM-002/23-comparacao-final.md): seis regras conformes no escopo.

### Complemento — mudança de OU e retestes

- [24–28 — OU Suporte → OU Financeiro](../evidencias/sanitizadas/IAM-002/README.md#complemento--movimentação-de-ou-em-2809): consultas e testes posteriores à mudança de localização; escopo e limitações próprios.

### Preparação histórica — 22 e 23/09

- [01–08 — Cadastro, grupos, permissões e testes de Suporte](../evidencias/sanitizadas/IAM-002/README.md#preparação-histórica--22-e-2309): estado anterior ao Mover. MemberOf não inclui grupo primário nem expande aninhamentos.
- [09 — Grupo de Gabriela no Entra](../evidencias/sanitizadas/inventario-entra-2026-09-23/04-gabriela-grupos.png): associação a GG_SUP_TICKET antes da mudança.

- [10–11 — Comparações anteriores de Gabriela](../evidencias/sanitizadas/IAM-002/09-11-referencias-antes-mover.md): guia somente de EMP0007, com as duas regras conformes em Suporte e vínculo às fontes históricas compartilhadas. Não é validação da mudança de 28/09.

## Riscos e reversão

Riscos: acumular acessos entre áreas e confundir remoção de grupo com encerramento de contexto SMB. Testes registram conexão explícita e resultado no recurso. Reversão prevista, não executada. Em caso de reversão autorizada, retirar a concessão nova, restaurar atributos/grupo anterior e retestar. Não alterar ACL compartilhada nem outros membros para revogar apenas Gabriela.

## Limitações e pendências

Recurso é pasta de teste, sem integração com sistema de chamados. Negativo comprova criação negada pela combinação SMB/NTFS; não testa exclusão ou edição existente. Ajuste de senha tem captura de edição e relato do operador. AD e Entra não sincronizam. Fonte de RH e decisão simulada registradas em 28/09; horário da decisão fictício, sem cálculo de SLA. A prova 16 mostra /delete com erro 2250, não uma desconexão bem-sucedida; a conexão e a leitura negada estão visíveis. Não foram avaliados todos os caminhos de acesso/sessões ou Manager. A comparação final da manhã não inclui OU; a localização foi comprovada separadamente no complemento 24–28 da tarde, sem auditoria completa de GPO/delegação. Entra comprova cadastro, grupos e operações, sem teste em aplicação integrada.

## Fechamento

**Fechado em 28/09/2026.** Identidade preservada, Suporte retirado, leitura antiga negada, Financeiro permitido somente no escopo testado e cadastro/grupos conferidos nos dois diretórios independentes. Comparação final conforme. A preparação histórica permanece preservada; SoD/recertificação serão tratados no IAM-010.

<a id="iam-003"></a>

# IAM-003 — Leaver e divergência entre RH e Entra — EMP0003

- Ambiente: laboratório fictício — Microsoft Entra ID cloud-only
- Tipo: tratamento de desligamento — Leaver/JML
- Identidade: EMP0003 — Carla Mendes
- Abertura e fechamento: 2026-09-23
- Status: Fechado
- Responsável pela execução: Wesley
- Validação final: nova comparação após as mudanças, em 23/09/2026

## Contexto e objetivo

Corrigir a incompatibilidade entre RH desligado e conta habilitada com associação financeira. Validar conta, associação, ação sobre sessões e nova entrada, preservando o antes/depois.

## Estado anterior

RH fictício: DESLIGADO desde 28/08. Conta criada em 21/09 para reproduzir a divergência; não se alega acesso contínuo desde agosto. CSV de 22/09 e perfil de 23/09 mostram habilitação; GG_FIN_READ presente. Telas de papéis de diretório e aplicações retornaram sem atribuições no escopo consultado.

## Aprovação e fundamento

- Regra: conta desabilitada e associação financeira retirada para EMP0003 desligada.
- Decisão simulada solicitada por Wesley: desabilitar conta, retirar GG_FIN_READ e revogar sessões. Registro documental às 17:10; consulta do relógio às 17:10:52 e bloqueio auditado às 17:10:26. Não se comprova aprovação anterior à ação.
- Wesley atua como responsável técnico/executor. Tela de owner do grupo não equivale a aprovação de negócio nem prova papel administrativo do tenant.

## Ações realizadas

- **Concluído:** preservar RH, exportação e provas do estado anterior.
- **Concluído:** comparar por matrícula; identificar habilitação incompatível e conferir associação financeira separadamente.
- **Concluído:** desabilitar conta, revogar refresh tokens e remover GG_FIN_READ, com auditoria success.
- **Concluído:** validar perfil desabilitado, ausência de grupos na consulta e nova entrada bloqueada.
- **Concluído:** repetir comparação com CSV de 23/09; Carla conforme. Conta preservada, sem exclusão.

## Validação e teste de acesso

Em 23/09, UTC−03:00: bloqueio às 17:10:26; atualização StsRefreshTokensValidFrom às 17:15:36; remoção do grupo às 17:17:18. Às 17:29:19, AMC PROD registra 50057 — conta desabilitada. A captura de bloqueio complementa o sign-in.

Após as mudanças, nova comparação confirmou Carla com habilitação False esperada / False observada: uma regra conforme e nenhuma exceção para EMP0003. A conta passou a corresponder ao RH desligado. O arquivo original contém também duas verificações de Gabriela, identificadas como contexto compartilhado na prova 08. Grupos foram validados por tela/auditoria, não por esse comparador.

## Evidências

[Roteiro do IAM-003](../evidencias/sanitizadas/IAM-003/README.md): somente Carla/EMP0003, com cada ação ligada à sua validação.

| Etapa e propósito | Provas do assunto |
|---|---|
| Delimitar o estado anterior | [Perfil, grupo, papéis e aplicações de Carla](../evidencias/sanitizadas/IAM-003/README.md#estado-anterior): links diretos às quatro capturas da pessoa. |
| Demonstrar a divergência cadastral | [Exceção EMP0003](../evidencias/sanitizadas/reconciliacao-2026-09-23/excecoes-entra.csv): False esperado / True observado. |
| Comprovar as três ações | [05 — auditoria do bloqueio, revogação e retirada do grupo](../evidencias/sanitizadas/IAM-003/05-auditoria-leaver.md). |
| Validar estado e tentativa de entrada | [Capturas 02–04 e sign-in 06](../evidencias/sanitizadas/IAM-003/README.md#validacao): perfil bloqueado, grupo ausente e nova entrada negada. |
| Comparar novamente com o RH | [08 — resultado final de Carla](../evidencias/sanitizadas/IAM-003/08-validacao-final.md): habilitação False/False, conforme. O CSV original também contém Gabriela; suas linhas são contexto da execução compartilhada. |

## Riscos e reversão

Reativação indevida pode restaurar acesso por concessões mantidas. Eventual reversão exige decisão justificada e revisão dos acessos; não restaurar automaticamente o estado incompatível com RH desligado. Sessões revogadas exigem nova autenticação, não simples reversão do evento.

## Limitações e pendências

Grupo cloud sem recurso financeiro integrado; sem teste de arquivo no Entra. Azure RBAC e permissões internas de aplicações não foram auditados. Revogação registrada não comprova fim imediato de toda sessão própria de aplicação. AD independente está fora deste caso. Sem cálculo de SLA desde o desligamento fictício. Nenhuma pendência de fechamento no escopo definido.

## Fechamento

Fechado em 23/09: conta desabilitada, associação financeira removida, ação de revogação auditada, nova entrada bloqueada e exceção de habilitação corrigida na comparação posterior. Exclusão da conta não faz parte do critério.

<a id="iam-004"></a>

# IAM-004 — Encerramento de terceiro — EMP0004

- Ambiente: laboratório fictício — AD DS e Entra independentes, sem sincronização
- Identidade: Diego Rocha — EMP0004
- Tipo: encerramento de acesso de terceiro por prazo
- Registro: 2026-09-28
- Status: Fechado em 29/09/2026 — expiração/autenticação AD, bloqueio/revogação Entra, contadores de concessões zero e comparação cadastral comprovados
- Responsável de negócio no cenário: Fernanda Souza
- Execução técnica: Wesley
- Encerramento vigente: **29/09/2026 às 08:00, horário de Brasília (UTC−03:00)**

## Contexto e objetivo

Encerrar o acesso do terceiro no início da manhã de 29/09 por **término da vigência simulada do vínculo**, registrada no RH e neste ticket. A lacuna de TI na matriz foi identificada separadamente no IAM-010 e não é a causa da expiração. Não conceder acesso novo ao terceiro encerrado para preencher essa lacuna. Configurar a expiração da conta AD e verificar uma nova autenticação após o prazo, tratando separadamente o encerramento no Entra. A conta e a matrícula existentes são preservadas.

## Regra e decisão simulada

Wesley definiu o prazo acima para o cenário didático. A fonte de RH vigente registra desligamento em 29/09/2026, mantendo admissão em 01/06/2026. O horário exato de vigência é definido neste ticket. Em 28/09, o status do RH permanece ATIVO; após a vigência, registrar DESLIGADO e conferir os diretórios. Não é uma aprovação corporativa real.

## Ações realizadas

1. **Concluído:** definir prazo e atualizar a data de desligamento na fonte de RH vigente.
2. **Concluído:** [consulta AD de 28/09 às 17:11:26 UTC−03:00](../evidencias/sanitizadas/IAM-004/README.md) confirma EMP0004, Enabled=True e AccountExpirationDate=29/09/2026 08:00:00.
3. **Concluído em 29/09:** Enabled=True com prazo vencido às 11:08; runas retorna erro 1793 (conta expirada) às 11:16:33. [Provas 02–03](../evidencias/sanitizadas/IAM-004/README.md).
4. **Concluído e auditado em 29/09:** bloqueio Entra às 11:19:45 e revogação às 11:19:56; perfil bloqueado e eventos success. **Concluído:** [captura final às 11:58](../evidencias/sanitizadas/IAM-004/08-entra-zero-concessoes.png) apresenta zero grupos, aplicações, papéis e licenças. Ausência final não representa remoção de vínculos inexistentes.
5. **RH atualizado em 29/09:** nova cópia vigente com EMP0004 DESLIGADO, preservando matrícula, admissão e demais campos; motivo e versão registrados na revisão do IAM-010. **Concluído:** [comparação posterior](../evidencias/sanitizadas/IAM-004/07-comparacao-final.md) confirma EMP0004 único, mesmo Object ID e accountEnabled=False.

## Evidências

[Roteiro do IAM-004](../evidencias/sanitizadas/IAM-004/README.md): configuração do prazo, efeito observado e tratamento separado no Entra.

| Etapa e propósito | Provas do assunto |
|---|---|
| Aplicar o prazo antes do término | [01 — expiração configurada](../evidencias/sanitizadas/IAM-004/01-expiracao-configurada.png), em 28/09. |
| Validar o efeito depois do término | [02 — prazo vencido](../evidencias/sanitizadas/IAM-004/02-ad-prazo-vencido.png) e [03 — autenticação recusada por expiração](../evidencias/sanitizadas/IAM-004/03-ad-autenticacao-conta-expirada.png). |
| Encerrar no Entra independente | [06 — auditoria](../evidencias/sanitizadas/IAM-004/06-audit-encerramento-extrato.json), [04 — perfil/sessões](../evidencias/sanitizadas/IAM-004/04-entra-bloqueio-vigencia-sessoes.png) e [05 — mesma identidade bloqueada](../evidencias/sanitizadas/IAM-004/05-entra-identidade-bloqueada.png). |
| Conferir o estado final | [07 — comparação cadastral](../evidencias/sanitizadas/IAM-004/07-comparacao-final.md) e [08 — contadores de concessões](../evidencias/sanitizadas/IAM-004/08-entra-zero-concessoes.png). |

## Validação e limites

A configuração comprova o prazo; uma tentativa posterior e seu resultado sustentam a validação da expiração. Sessões existentes e autorizações são verificações distintas. Não interpretar acesso negado a arquivo, isoladamente, como prova de conta expirada. Configuração, efeito após vigência, bloqueio Entra, revogação e comparação cadastral estão comprovados nas provas de 29/09. Captura das 11:58 completa a verificação com contadores zero de grupos, aplicações, papéis e licenças. Não foi alegada auditoria global de acessos externos ao escopo.

## Reversão e fechamento

Reabertura de acesso somente mediante nova decisão simulada justificada, com prazo explícito e reteste. Não remover o prazo nem reabilitar automaticamente a conta para conseguir um resultado de teste.

**Fechado em 29/09/2026.** Prazo aplicado, autenticação AD recusada por expiração, conta Entra bloqueada e revogação auditada, contadores de concessões zero e comparação cadastral conforme. Conta preservada sem nova concessão. [Matriz vigente](MAT-2026-09-29-acessos-por-sistema.md).

<a id="iam-005"></a>

# IAM-005 — Integração de conta de serviço — Relatórios financeiros

- Ambiente: laboratório fictício — AD DS, VM DC01
- Tipo: requisição de configuração e integração
- Identidade: svc_relatorio_fin — OU Contas-de-Servico
- Abertura: 2026-09-15
- Status: Fechado
- Responsável pela execução e manutenção: Wesley
- Fechamento: 2026-09-15

## Contexto e objetivo

Executar uma rotina com identidade de serviço: ler dados fictícios, gerar um resumo em pasta separada e testar as permissões permitidas e negadas.

## Estado anterior

Em 11/09, conta desabilitada, responsável Wesley, departamento Financeiro e integração pendente (01). Em 15/09, a consulta enviada pelo operador retornou somente Domain Users.

## Aprovação e fundamento

- Aprovação simulada do Gestor Financeiro registrada pelo operador em 15/09 para leitura da entrada e gravação da saída, sem privilégios administrativos; horário não informado.
- Modelo: svc_relatorio_fin → GG_SVC_RELATORIO_FIN → DL_FIN_RELATORIOS_READ / DL_FIN_SAIDA_WRITE. O GG_FIN_READ dos usuários foi preservado.
- Entrada: `C:\IAM-Lab\Relatorios-Financeiros\relatorio-teste.txt`; saída: `C:\IAM-Lab\Saidas-Relatorios-Financeiros\resumo.json`.
- Script: `C:\IAM-Lab\Scripts-Relatorios\gerar-resumo.ps1`, com leitura/execução para a rotina e alteração reservada à administração.

## Ações realizadas

- **Concluído:** conferir cadastro/grupos, responsável e corrigir AM-005 para IAM-005 na descrição, conforme operador.
- **Concluído:** configurar grupos e ACL da saída (02 e 03); conceder leitura do script, conforme atendimento.
- **Concluído:** configurar a tarefa sob svc_relatorio_fin, com RunLevel Limited, e a GPO LAB-IAM005-Logon-Servico para logon em lote e negação de logon local/RDP, conforme consultas do atendimento.
- **Concluído:** corrigir nome divergente do script e ausência de leitura; executar e repetir os testes (04 a 06).
- **Concluído:** desabilitar tarefa e conta, preservar provas e documentar manutenção da credencial (07).

## Validação

Em 15/09, horário de Brasília (UTC−03:00): primeira execução iniciou às 17:56:11 e gerou o resumo às 17:56:14; repetição iniciou às 18:00:35 e atualizou o resumo às 18:00:36. Ambas retornaram LastTaskResult=0. Os resumos registram EMPRESA\svc_relatorio_fin e duas linhas lidas. Estado final: tarefa Disabled e conta Enabled=False.

## Teste de acesso

- **Positivo:** leitura da entrada e criação/atualização do resumo na saída.
- **Negativo:** criação de arquivo de teste na entrada e alteração de arquivo descartável na pasta de scripts negadas, conforme resultado do script.
- **Logon:** configuração de restrições registrada no atendimento; não houve teste de tentativa interativa local/RDP anexado.

## Evidências

[Roteiro do IAM-005](../evidencias/sanitizadas/IAM-005/README.md): identidade da rotina, concessões, execução e desativação de 15/09.

| Etapa e propósito | Provas do assunto |
|---|---|
| Preservar a referência inicial | [01 — conta ainda desabilitada em 11/09](../evidencias/sanitizadas/IAM-005/01-conta-desabilitada-2026-09-11.png). |
| Configurar acessos da rotina | [02 — grupos e ACL](../evidencias/sanitizadas/IAM-005/02-grupos-e-permissoes-saida.png) e [03 — propagação](../evidencias/sanitizadas/IAM-005/03-aplicacao-arquivos-subpastas.png). |
| Executar e conferir operações | [04 — primeira execução/testes](../evidencias/sanitizadas/IAM-005/04-primeira-execucao-testes.png) e [05 — resultado da tarefa](../evidencias/sanitizadas/IAM-005/05-primeira-execucao-resultado-zero.png). |
| Repetir e desativar | [06 — reexecução](../evidencias/sanitizadas/IAM-005/06-reexecucao-testes-e-resultado-zero.png) e [07 — tarefa/conta desabilitadas](../evidencias/sanitizadas/IAM-005/07-estado-final-desabilitado.png). |

[Script da mesma rotina](../05-automacao/IAM-005/README.md): apoio para interpretar os testes. A [retirada posterior de concessões em 29/09](../evidencias/sanitizadas/IAM-010/10-servico-remocao-concessoes.md) pertence ao IAM-010; explica a evolução da mesma conta após este fechamento.

## Riscos e reversão

Riscos: exposição da credencial, alteração do código e acesso excessivo. No fechamento de 15/09, conta/tarefa desabilitadas e grupos/ACLs ainda configurados. A retirada de três vínculos em 29/09 está documentada no IAM-010, como evolução posterior. Reversão: retirar concessões específicas e revisar a GPO antes de desvinculá-la. Manutenção: guardar a senha fora de script/Git; conferir validade e atualizar a credencial da tarefa quando alterada, com reteste. Rotação não testada.

## Limitações e pendências

- Conta AD tradicional, não gMSA; execução na DC01 é adaptação ao laboratório de uma VM, não arquitetura recomendada para produção.
- Script fornecido após os testes e anexado sem alterações; sintaxe revisada, sem nova execução. XML da tarefa e erros brutos não anexados. O negativo testa arquivo descartável; exclusão e alteração de ACL não foram testadas.
- GPO, tarefa e correções descritas conforme atendimento, sem exportação completa anexada. Sem cálculo de SLA.

## Fechamento

Demonstração concluída: execução com a identidade prevista, testes positivos/negativos, repetição com sucesso e desativação final. A rotina não permanece em operação.

<a id="iam-006"></a>

# IAM-006 — Restabelecimento de login — EMP0006

- Ambiente: laboratório fictício — Microsoft Entra ID Free
- Tipo: incidente de autenticação
- Identidade: EMP0006 — Felipe Gomes
- Abertura: 2026-09-03
- Fechamento registrado: 2026-09-04
- Status registrado: Resolvido
- SLA didático definido: 1 dia útil
- Horários dos eventos: UTC, em 2026-09-03
- Tickets relacionados: IAM-001 e IAM-007

## Contexto e objetivo

Investigar três entradas interrompidas no My Profile, com código 50055
e mensagem “The password is expired.”, e restabelecer a autenticação.

## Estado anterior

A conta havia sido provisionada no IAM-001 com senha temporária e
troca exigida no primeiro acesso, conforme o atendimento.
As tentativas investigadas não concluíram a autenticação.

## Análise

Nos três eventos, os detalhes registraram “Correct password” e êxito
da etapa de senha. Os logs de entrada correspondentes apontaram
expiração: a senha foi aceita, mas o login completo foi interrompido.

A auditoria mostrou cinco alterações recusadas pela política de senha,
uma alteração concluída às 20:12:18Z e, depois, uma tentativa de
redefinição por autoatendimento indisponível para Felipe às 20:14:27Z.

## Ações realizadas

- **Concluído:** ADMIN-LAB-001 redefiniu a senha às 20:29:54Z.
- **Concluído:** Após nova interrupção às 20:32:12Z, Felipe concluiu uma alteração
  de senha às 20:33:21Z.
- **Concluído:** Logs foram preservados e correlacionados por identificadores
  mantidos somente no cofre privado.
- **Concluído — 18/09, complemento operacional:** transcrever o caso no Incident INC0010001 da PDI ServiceNow, com notas e estado Resolved; sem nova intervenção no Entra (05).

## Validação

Foram confirmadas três entradas posteriores com status Êxito:

- 20:33:27Z — My Profile.
- 20:33:43Z — My Signins, com primeiro fator satisfeito pelo token.
- 20:34:08Z — My Signins, com notificação de aplicativo móvel e
  resultado “MFA completed in Azure AD”.

O campo de código de erro não foi preenchido no CSV exportado.

## Evidências

[Roteiro do IAM-006](../evidencias/sanitizadas/IAM-006/README.md): distinguir sintoma informado, eventos observados e validação posterior.

| Etapa e propósito | Provas do assunto |
|---|---|
| Distinguir interrupção e etapa de senha | [01 — eventos com 50055](../evidencias/sanitizadas/IAM-006/EV-IAM-006-01-eventos-50055.md) e [02 — detalhes da autenticação](../evidencias/sanitizadas/IAM-006/EV-IAM-006-02-detalhes-autenticacao.md): senha aceita, entrada interrompida. |
| Identificar as intervenções registradas | [03 — eventos de senha](../evidencias/sanitizadas/IAM-006/EV-IAM-006-03-eventos-senha.md): considerar ação, ator, horário e resultado. |
| Comprovar entradas posteriores | [04 — logins posteriores](../evidencias/sanitizadas/IAM-006/EV-IAM-006-04-login-posterior.md): êxito e detalhes disponíveis, sem inferir causa única. |

**Complemento de documentação — 18/09:** [ServiceNow](../evidencias/sanitizadas/IAM-006/servicenow/README.md) demonstra classificação, atribuição, Work notes e resolução na PDI. É representação retrospectiva; não altera a data dos eventos técnicos nem comprova SLA histórico.

## Riscos e reversão

Riscos: indisponibilidade da conta e redefinições repetidas sem diagnóstico.

Não há reversão direta para a senha anterior. Eventual nova recuperação
exige validação da identidade e procedimento autorizado, com novo registro.

## Limitações e pendências

- Os eventos comprovam autenticação, não acesso ao sistema financeiro.
- Não foi localizada etapa de autenticação correspondente às 20:33:27Z
  no arquivo exportado de detalhes.
- O uso de MFA não comprova quando o método foi cadastrado;
  essa investigação pertence ao IAM-007.
- Datas de abertura e fechamento vêm do atendimento.
  Os extratos públicos omitem identificadores privados.

## Fechamento

Causa identificada, tratamento registrado e autenticação posterior
bem-sucedida comprovada. Critério de resolução atendido.
Status final registrado: Resolvido.

<a id="iam-007"></a>

# IAM-007 — Verificação de cadastro e uso de MFA — EMP0006

- Ambiente: laboratório fictício — Microsoft Entra ID Free
- Tipo: requisição de verificação de MFA
- Identidade: EMP0006 — Felipe Gomes
- Abertura: 2026-09-08
- Fechamento: 2026-09-08
- Status: Resolvido
- Tickets relacionados: IAM-001 e IAM-006

## Contexto e objetivo

Verificar o cadastro e o estado atual do Microsoft Authenticator
de EMP0006 e comprovar seu uso em uma entrada bem-sucedida.

## Estado anterior

Já havia registro de uso de MFA em 2026-09-03T20:34:08Z,
conforme a EV-IAM-006-04. Na abertura deste ticket, faltava
verificar o método atual e localizar os eventos de cadastro.

## Ações realizadas

- **Concluído:** Consultados os métodos de autenticação em 2026-09-08.
- **Concluído:** Conferidos dois eventos de cadastro no CSV de auditoria.
- **Concluído:** Correlacionada a entrada com seus detalhes de autenticação.
- **Concluído:** Reunidas as evidências sanitizadas e a referência ao IAM-006.

## Validação

- Estado atual: Authenticator utilizável, com dispositivo
  identificado como “iPhone 12” e notificação como padrão.
- Cadastro: duas atualizações com sucesso em 03/09/2026,
  às 20:19:20 UTC, adicionaram os dados do aplicativo e os métodos.
- Uso: entrada no My Signins em 03/09/2026, às 20:34:08 UTC,
  com Success, Mobile app notification e resultado
  “MFA completed in Azure AD”.

## Evidências

[Roteiro do IAM-007](../evidencias/sanitizadas/IAM-007/README.md): três perguntas diferentes sobre o MFA de Felipe.

| Pergunta | Prova do assunto |
|---|---|
| Quando o método foi cadastrado? | [02 — auditoria do Authenticator](../evidencias/sanitizadas/IAM-007/EV-IAM-007-02-cadastro-authenticator.md), em 03/09. |
| Há uso comprovado? | [Evento de 03/09 às 20:34:08 UTC](../evidencias/sanitizadas/IAM-006/EV-IAM-006-04-login-posterior.md#evento-mfa-compartilhado): notificação móvel e MFA concluída. É o mesmo evento preservado no IAM-006; os outros logins daquele documento não compõem esta prova de uso. |
| O método aparece na consulta posterior? | [01 — estado consultado em 08/09](../evidencias/sanitizadas/IAM-007/EV-IAM-007-01-metodo-atual.md). Cadastro disponível e uso em um evento não demonstram exigência em todos os acessos. |

## Riscos e reversão

Risco: confundir cadastro, uso e exigência de MFA.

A verificação foi somente leitura, sem alterações na conta
ou nos métodos. Não há alteração a reverter.

## Limitações e pendências

- A captura mostra o estado na consulta; a data das alterações
  de cadastro foi comprovada separadamente pela auditoria.
- A entrada comprova uso de MFA naquele evento, não exigência
  em todos os acessos.
- Os detalhes da entrada não identificam, por si só,
  o aparelho físico que aprovou a notificação.

## Fechamento

Critério atendido: estado atual verificado, alterações de
cadastro localizadas e uso de MFA comprovado.
Nenhuma alteração de configuração foi necessária.

<a id="iam-011"></a>

# IAM-011 — Pré-admissão e ativação — EMP0001

- Ambiente: laboratório fictício — Microsoft Entra ID, cloud-only
- Tipo: requisição de provisionamento
- Identidade: EMP0001 — Ana Ribeiro
- Abertura: 2026-09-14
- Status: Fechado
- Responsável pela execução: Wesley
- Admissão: 2026-09-15
- Fechamento: 2026-09-15

## Contexto e objetivo

Preparar Ana antes da admissão, com entrada bloqueada. Após confirmação simulada do RH e aprovação, ativar a conta, conceder o grupo previsto e validar a entrada.

## Estado anterior

A fonte de RH de 29/08 registra Ana como PRE_ADMISSAO. A ausência inicial da conta foi conferida conforme relato do operador. Em 14/09, a conta foi criada bloqueada e sem associação direta ao grupo financeiro.

## Aprovação e fundamento

- EMP0001: Analista Financeiro, Financeiro; gestor Carlos Lima. Matriz: Analista Financeiro → GG_FIN_READ.
- Preparação bloqueada: aprovação simulada informada pelo operador em 14/09.
- 15/09/2026, 11:24 UTC−03:00: confirmação simulada da admissão pelo RH e aprovação de Carlos Lima, Gestor Financeiro, registradas por Wesley na fila antes da execução.
- Atualização do RH para ATIVO informada no fechamento de 15/09. Em 18/09, foi criada e anexada uma nova versão simulada do CSV, preservando a fonte de 29/08 (07–09).

## Ações realizadas

- **Concluído — 14/09:** conferir a identidade, criar a conta bloqueada e validar atributos/troca obrigatória (01 e 02).
- **Concluído — 14/09:** conferir ausência direta no GG_FIN_READ e testar entrada bloqueada (03 e 04).
- **Concluído — 15/09:** registrar confirmação e aprovação simuladas; habilitar a conta e adicionar ao GG_FIN_READ (05).
- **Concluído — 15/09:** trocar a senha no fluxo do usuário e cadastrar as informações de autenticação exigidas (05).
- **Concluído — 15/09:** conferir entrada positiva com MFA, preservar os dois JSONs e anexar extratos sanitizados (06).
- **Concluído — 18/09, complemento documental:** copiar a fonte fictícia de RH e atualizar somente EMP0001 de PRE_ADMISSAO para ATIVO; comparar as versões e preservar o histórico (07–09).

## Validação

Horários de Brasília (UTC−03:00). Auditoria: AccountEnabled false → true às 11:30:41; inclusão no GG_FIN_READ às 11:33:44; troca de senha e ForceChangePassword True → False às 11:38:51. Cadastro do Authenticator às 11:39:49 e conclusão das informações exigidas às 11:40:18, com sucesso.

## Teste de acesso

- **Negativo:** 14/09 às 16:18:05, My Profile, 50057 — conta desabilitada.
- **Intermediário:** 15/09 às 11:37:59, Azure Portal, 50055 — troca de senha necessária; senha correta não concluiu o login.
- **Positivo:** 15/09 às 11:40:18, Azure Portal, errorCode=0 e MFA completed in Azure AD.

## Evidências

[Roteiro do IAM-011](../evidencias/sanitizadas/IAM-011/README.md): Ana/EMP0001, da pré-admissão à ativação e validação.

| Etapa e propósito | Provas do assunto |
|---|---|
| Preparar a identidade sem habilitar entrada | [01 — estado da pré-admissão](../evidencias/sanitizadas/IAM-011/EV-IAM-011-01-estado-pre-admissao.md), [02 — criação](../evidencias/sanitizadas/IAM-011/EV-IAM-011-02-auditoria-criacao.md) e [03 — grupo sem Ana](../evidencias/sanitizadas/IAM-011/EV-IAM-011-03-grupo-sem-ana.md). |
| Validar o bloqueio anterior | [04 — tentativa negada](../evidencias/sanitizadas/IAM-011/EV-IAM-011-04-entrada-bloqueada.md). |
| Ativar e associar conforme decisão | [05 — ativação, grupo, senha e cadastro](../evidencias/sanitizadas/IAM-011/EV-IAM-011-05-ativacao-grupo-autenticacao.md). |
| Validar a entrada posterior | [06 — login e MFA](../evidencias/sanitizadas/IAM-011/EV-IAM-011-06-entrada-positiva.md). |

**Complemento de RH, documentado em 18/09:** [09 — linha de Ana, alteração e limites](../evidencias/sanitizadas/IAM-011/EV-IAM-011-09-atualizacao-rh.md). Os CSVs 07–08 integrais estão vinculados ali para verificar origem e preservação das demais pessoas; não representam execução sobre os outros oito registros nem aprovação retroativa.

## Riscos e reversão

Risco: acesso antecipado ou excessivo. Conta mantida bloqueada até a admissão/aprovação. Reversão: bloquear a conta, remover concessões indevidas e avaliar/revogar sessões.

## Limitações e pendências

- Aprovações são simuladas; conferência anterior à criação foi informada pelo operador. O CSV de RH de 18/09 é atualização manual simulada posterior à ativação, não evidência contemporânea de 15/09.
- Estado após ativação comprovado por alterações auditadas e entrada, sem nova exportação cadastral anexada.
- Cadastro do Authenticator e MFA concluído estão comprovados; o evento de entrada não detalha o método específico (null).
- Grupo no Entra e entrada no Azure Portal não comprovam acesso ao relatório do AD ou privilégios administrativos Azure. Não há cálculo de SLA.

## Fechamento

Encerrado em 15/09: pré-admissão bloqueada, ativação e grupo aprovados, troca de senha e entrada com MFA comprovadas no Entra.

<a id="iam-008"></a>

# IAM-008 — Avaliação de acesso direto — EMP0006

- Ambiente: laboratório fictício — AD DS
- Tipo: requisição de acesso — cenário simulado
- Identidade: EMP0006 — Felipe Gomes
- Abertura: 2026-09-17
- Status: Fechado
- Responsável pela execução: Wesley
- Fechamento: 2026-09-17

## Contexto e objetivo

Avaliar um pedido simulado de leitura diretamente para Felipe na pasta financeira. Conferir o acesso por grupo e evitar uma permissão individual redundante.

## Estado anterior

Em 14/09, o caso AGDLP comprovou Felipe no GG_FIN_READ, associado ao DL_FIN_RELATORIOS_READ, com leitura permitida e criação de arquivo negada. Em 17/09, grupos e ACL foram novamente consultados.

## Aprovação e fundamento

- Necessidade simulada: consultar relatórios financeiros.
- Modelo: Felipe → GG_FIN_READ → DL_FIN_RELATORIOS_READ → leitura na pasta.
- Aprovador previsto: Gestor Financeiro.
- Recomendação: manter o acesso por grupo, sem permissão individual adicional.
- Decisão simulada — 17/09/2026: Gestor Financeiro aprova manter a leitura pelo modelo existente e não aprova a permissão individual redundante. Registrada por solicitação de Wesley neste atendimento; horário não informado.

## Ações realizadas

- **Concluído:** registrar o pedido e a necessidade simulados.
- **Concluído:** conferir Felipe no GG_FIN_READ e o GG na DL (01 e 02).
- **Concluído:** conferir a ACL da pasta, sem entrada direta para Felipe (03).
- **Concluído:** avaliar a configuração e recomendar manutenção do acesso por grupo.
- **Concluído:** vincular as três provas atuais e o teste histórico.
- **Concluído:** registrar a decisão simulada de manter o acesso por grupo e encerrar sem alteração de permissões.

## Validação

Consultas de 17/09 confirmam Felipe no GG_FIN_READ; a DL contém GG_FIN_READ e GG_SVC_RELATORIO_FIN. Na pasta, DL_FIN_RELATORIOS_READ possui Allow, ReadAndExecute/Synchronize; SYSTEM e Administrators possuem FullControl. Não há entrada direta para Felipe na ACL mostrada.

ContainerInherit e ObjectInherit permitem propagação aos filhos. IsInherited=False identifica entradas explícitas nesta pasta; não comprova, sozinho, a ACL efetiva de cada arquivo ou subpasta.

## Teste de acesso

Histórico de 14/09: leitura permitida e criação de arquivo negada para Felipe. Não houve novo teste de leitura em 17/09. O escopo atual avalia o pedido e a configuração, sem nova concessão.

## Evidências

[Roteiro do IAM-008](../evidencias/sanitizadas/IAM-008/README.md): avaliar o pedido de acesso direto pela cadeia já existente.

| Etapa e propósito | Prova do assunto |
|---|---|
| Conferir a associação de Felipe | [01 — usuário no GG_FIN_READ](../evidencias/sanitizadas/IAM-008/01-felipe-no-gg-fin-read.png). |
| Conferir o encadeamento | [02 — GG na DL](../evidencias/sanitizadas/IAM-008/02-membros-dl-fin-relatorios-read.png): outros membros visíveis são contexto da lista do grupo. |
| Conferir a autorização do recurso | [03 — ACL financeira](../evidencias/sanitizadas/IAM-008/03-acl-pasta-financeira.png): fundamenta manter a concessão por grupo, sem adicionar entrada individual. |

**Referência funcional anterior, de 14/09:** [teste de Felipe no mesmo recurso](../evidencias/sanitizadas/agdlp-financeiro/05-felipe-leitura-permitida-escrita-negada.png). Contextualiza o acesso existente; não é reteste executado neste atendimento de 17/09.

## Riscos e reversão

Risco: permissão individual redundante dificultar revisão e revogação. Nenhuma alteração de grupo ou ACL foi realizada neste atendimento; não há mudança a reverter.

## Limitações e pendências

- Solicitação e decisão do gestor são simuladas, sem aprovação corporativa real.
- Consultas atuais comprovam configuração, sem novo teste funcional ou auditoria de todos os arquivos.
- Sem cálculo de SLA.

## Fechamento

Encerrado em 17/09/2026: pedido avaliado, decisão simulada registrada e provas vinculadas. Mantido o acesso por grupo, sem acrescentar permissão individual. Nenhuma alteração no AD ou na ACL foi necessária.

<a id="iam-009"></a>

# IAM-009 — Acesso após remoção de grupo — EMP0006

- Ambiente: laboratório fictício — AD DS, DC01 e cliente SMB
- Tipo: incidente simulado — reprodução controlada
- Identidade: EMP0006 — Felipe Gomes
- Abertura: 2026-09-17
- Status: Fechado
- Responsável pela execução: Wesley
- Fechamento: 2026-09-17

## Contexto e objetivo

Comparar a leitura do relatório antes/depois da remoção temporária de Felipe do GG_FIN_READ, na conexão existente e após reconexão. Restaurar o acesso original ao terminar.

## Estado anterior

O IAM-008 conferiu o acesso por grupo, sem permissão individual. Nesta rodada, Felipe aparece no GG_FIN_READ às 11:51:53 e lê o arquivo às 11:55:20, após conexão SMB com sua credencial (01 e 02).

## Aprovação e fundamento

- Exercício solicitado por Wesley em 17/09, restrito ao laboratório.
- Aprovação simulada — 17/09/2026, 11:50 UTC−03:00 (horário fictício do cenário): responsável autoriza remover temporariamente Felipe do GG_FIN_READ, testar as conexões e restaurar a associação ao final.
- Escopo: Felipe e sua associação ao GG_FIN_READ; preservar ACLs e demais membros. Sem mudança no RH ou no Entra.

## Ações realizadas

- **Concluído:** conferir grupo/compartilhamento e leitura inicial como Felipe (01 e 02).
- **Concluído:** remover a associação conforme relato e comprovar FelipePresente=False (03).
- **Concluído:** testar a conexão mantida; leitura ainda permitida (04).
- **Concluído:** conferir lista vazia de conexões, reconectar como Felipe e observar leitura negada (05).
- **Concluído:** restaurar Felipe ao grupo, desconectar/reconectar e confirmar leitura (06).
- **Concluído:** ordenar as provas pelos horários exibidos, registrar a conclusão e a aprovação simulada.

## Validação

Em 17/09, UTC−03:00: às 12:06:10 o grupo tem zero membros; às 12:07:07 a leitura continua permitida. Às 12:10:22, após nova conexão, Get-Content retorna Access is denied/PermissionDenied. Felipe reaparece no grupo às 12:12:19 e a leitura funciona após reconexão às 12:16:59.

A sequência é compatível com manutenção do contexto de autorização da conexão anterior. As capturas demonstram o comportamento; não identificam o token, os tickets nem o protocolo de autenticação que o sustentaram.

## Teste de acesso

- **Positivo inicial:** leitura permitida com associação ao grupo.
- **Após remoção, conexão existente:** leitura ainda permitida.
- **Negativo após reconexão:** conexão aceita, leitura negada.
- **Positivo final:** associação restaurada, reconexão e leitura permitidas.

## Evidências

[Roteiro do IAM-009 — seis provas na sequência dos eventos](../evidencias/sanitizadas/IAM-009/README.md): estado inicial → grupo removido e leitura persistente → nova conexão e negação → restauração e leitura permitida.

Todas as capturas tratam Felipe e o mesmo recurso financeiro. A captura nominal de 12:25 contém o teste das 12:10 e precede a de restauração na ordem dos eventos; seguir o horário mostrado no comando, não apenas o nome do arquivo.

## Riscos e reversão

Risco: remover a associação sem verificar acesso pela conexão existente. Reversão executada: Felipe readicionado ao GG_FIN_READ, conexão renovada e leitura comprovada. Nenhuma alteração de ACL foi relatada.

## Limitações e pendências

- Horários vêm de Get-Date próximo aos comandos, não de eventos de auditoria das operações.
- Na prova 05, /delete retorna 2250 (conexão não encontrada); net use mostra lista vazia antes da reconexão. A desconexão anterior bem-sucedida não foi capturada.
- Sem exportação de sessões/tokens, identificação Kerberos/NTLM ou auditoria da remoção. Aprovação e horário simulados. Sem cálculo de SLA.

## Fechamento

Reprodução concluída: acesso persistiu na conexão mantida após remoção, foi negado após reconexão e voltou após restauração do grupo e nova conexão. Estado final de Felipe restaurado e comprovado.

<a id="iam-010"></a>

# IAM-010 — Recertificação de acessos e segregação de funções

- Ambiente: laboratório fictício — AD DS e Entra independentes; microcaso SoD em dados locais simulados
- Tipo: revisão de acesso e avaliação de segregação de funções (SoD)
- Registro do preparo: 2026-09-26
- Status: Fechado em 29/09/2026 — decisões registradas, serviço tratado, TI validada, SoD concluído e conferência final AD conforme no escopo documentado
- Início da coleta e análise: 2026-09-28; atividade de reconciliação prevista para 29/09 antecipada pelo operador. Conclusão após decisões, tratamento e validação, dentro da preparação da v0.5.
- Responsável pela execução: Wesley
- Identidade do microcaso: EMP0007 — Gabriela Santos
- Relação com o ciclo: [IAM-002 — Mover](#iam-002) → avaliação SoD → recertificação

## Contexto e objetivo

Revisar se as concessões da população escolhida continuam necessárias e registrar decisão por acesso: manter, remover ou investigar. Usar Gabriela após o Mover como contexto para um microcaso de combinação incompatível de direitos. A revisão deve ter responsável de negócio, justificativa e verificação posterior.

## Estado anterior

O Mover de Gabriela foi concluído em 28/09 no escopo de cadastro, grupos e acesso testado, conforme IAM-002. A coleta posterior encontrou o objeto ainda na OU Suporte. A movimentação para Financeiro foi comprovada depois por consultas e testes nas [provas 24–28 do IAM-002](../evidencias/sanitizadas/IAM-002/README.md#complemento--movimentação-de-ou-em-2809); nova exportação AD de 16:59:31 confirma a mudança.

O inventário e a reconciliação ampliada passam a integrar a preparação deste IAM-010: RH com nove pessoas; AD com nove contas, sete grupos GG/DL e oito associações diretas; Entra com doze contas e exportações dos grupos Financeiro, Suporte e RH. Fontes de 28/09, coletadas em horários distintos. A comparação de habilitação, departamento e cargo das contas correlacionadas por matrícula teve 34 verificações conformes. Não inclui todas as concessões nem comprova necessidade de acesso.

A análise identificou Bruno sem GG_SUP_TICKET no AD e Gabriela ainda em OU Suporte. Na [decisão de escopo de 28/09](REV-2026-09-28-escopo-reconciliacao.md), foi definido acesso de leitura de SuporteLab para Bruno, complemento de OU para Gabriela e ausência intencional de provisionamento de EMP0009 neste recorte. Bruno foi incluído no grupo, leu o recurso de Suporte e teve criação negada. A comparação AD de 15:52:51 com 16:59:31 confirmou somente a inclusão de Bruno e a mudança de OU de Gabriela nos campos coletados. Essa decisão de escopo não substitui a recertificação individual pelo responsável de negócio.

## Revisão de cobertura — 29/09/2026

A recertificação identificou uma lacuna: Diego e Isabela constam em TI no RH, mas os grupos comparados cobriam Suporte, Financeiro e RH. Wesley solicitou a ampliação da matriz. [Matriz vigente](MAT-2026-09-29-acessos-por-sistema.md): TI com leitura de procedimentos proposta, sem privilégio administrativo automático; Diego encerrado pelo prazo; Isabela inicialmente planejada e depois implementada no AD pelo operador em 29/09. [Provas TI](../evidencias/sanitizadas/IAM-010/ti-isabela/README.md): identidade, associações, ACL/SMB, conexão como Isabela, leitura e criação negada. Entra/híbrido permanecem planejados.

Nova fonte de RH de 29/09 registra Diego DESLIGADO. Cadastro técnico separado relaciona as nove matrículas aos IDs observados e ao futuro escopo híbrido. [Análise completa do recorte disponível](REV-2026-09-29-estrutura-hibrida.md): não há outra área de RH omitida; contas especiais têm controles próprios. A comparação histórica das nove associações permanece válida somente para os três grupos de 28/09. TI só é considerada implementada no AD pelas provas posteriores específicas; nova coleta integral ainda será comparada.

**Decisão simulada de desenho em 29/09:** incluir TI e as regras transversais na matriz por solicitação de Wesley; Fernanda Souza é a responsável de negócio fictícia pelo perfil TI. Lacuna documental tratada; provisionamento TI no AD executado depois, conforme evidências. Preflight híbrido e Entra continuam planejados. Atualização: Diego foi encerrado no IAM-004 com provas de 29/09. SoD e conferência final AD concluídos. A alteração de Employee type foi retirada do escopo por decisão de Wesley em 29/09; não condiciona o fechamento dos controles de acesso comprovados e não foi executada.

## Tratamento da conta de serviço — 29/09/2026

[Decisão e provas 11–13](../evidencias/sanitizadas/IAM-010/10-servico-remocao-concessoes.md). Às 12:08, conta/tarefa desabilitadas conservavam três vínculos. Consulta local de dependências encontrou somente a tarefa conhecida e nenhum serviço pelo filtro usado. Às 12:14:13, GG de serviço e DL de escrita vazios; DL de leitura mantém GG_FIN_READ; conta continua False. Formalização da decisão simulada em **29/09/2026 12:23:24 -0300**, com Carlos Lima como responsável fictício e Wesley como executor, após as capturas.

Resultado: três decisões de investigar convertidas em remover, com retirada comprovada no escopo consultado. Sem nova concessão, exclusão de grupos ou reteste de acesso dos humanos; manter os limites da consulta local explícitos. IAM-005 preservado como histórico da rotina.

## Aprovação e fundamento

- Conferir RH e matriz vigentes, definir população, sistemas, recursos e data das coletas antes da revisão.
- Registrar a decisão simulada do responsável de negócio no momento do exercício, com data e justificativa. Wesley executa o laboratório; atuação técnica não equivale a aprovação independente.
- A regra abaixo é uma política fictícia do processo **Compras-LAB**. Não é uma incompatibilidade universal deduzida pelo nome do cargo ou do grupo.

| Regra SoD-001 | Definição do microcaso |
|---|---|
| Direito A — `FORNECEDOR_MANTER` | Cadastrar ou alterar fornecedores no processo simulado. |
| Direito B — `ORCAMENTO_APROVAR` | Aprovar orçamento de compra no mesmo processo. |
| Conflito | A mesma pessoa acumular A e B no escopo Compras-LAB. Apenas indicar fornecedores ou mudar de departamento não estabelece esse conflito. |
| Tratamento aplicado no modelo | Manter B e retirar A do caso A+B, conforme decisão didática registrada na etapa Depois. Uma exceção futura exigiria justificativa, prazo, revisão e controle compensatório. |

## Ações realizadas

1. **Concluído — coletas iniciadas em 28/09:** conferir o fechamento do Mover, preservar inventários e definir matriz por sistema. Coleta e comparação cadastral concluídas no recorte descrito; nova coleta posterior e tratamento dos dois achados concluídos; comparação departamental e decisões simuladas registradas nas evidências 07–08.
2. **Concluído no escopo exportado:** nove associações departamentais conformes e seis ausências previstas. Recertificação simulada inicial: quinze associações avaliadas, doze manter e três investigar. Em 29/09, as três pendências de serviço foram decididas como remover e a retirada foi comprovada; as demais decisões não representam nova coleta.
3. **Concluído em 29/09:** [SoD e provas 14–16](../evidencias/sanitizadas/IAM-010/14-sod-resultado.md): cinco cenários alternativos, um conflito às 17:06:37, zero às 17:10:04 após preservar aprovação de orçamento e retirar manutenção de fornecedor no caso A+B.
4. **Concluído:** casos A, B, A+B, pessoas distintas e escopos distintos avaliados; decisão didática exibida na etapa Depois. Não houve alteração de direitos reais.
5. **Concluído:** conferir o AD após os tratamentos de serviço e TI, com nova coleta de 29/09 e oito associações conformes no escopo. As fontes cloud anteriores permanecem datadas; esse fechamento não inclui nova coleta Entra.

## Critérios e validação do microcaso SoD

| Caso local simulado | Resultado esperado pela regra |
|---|---|
| A somente ou B somente | Sem conflito SoD-001; isso não prova que a concessão é necessária. |
| A+B, mesma pessoa e mesmo escopo | Conflito SoD-001. |
| Após decisão e retirada de A do modelo | B permanece; nova comparação sem conflito SoD-001. |

São critérios do exercício. A lógica do script foi verificada tecnicamente: um conflito antes e nenhum após o tratamento, com pessoas/escopos diferentes sem falso positivo. O operador concluiu o exercício com capturas antes/depois em 29/09, conforme evidência 14. O PowerShell usa entradas locais, sem conceder direitos no AD/Entra. Na revisão real, zero achados também pode ser um resultado válido.

## Evidências por etapa e tratamento

[Roteiro do IAM-010](../evidencias/sanitizadas/IAM-010/README.md): inventário, decisão e cada tratamento possuem um bloco próprio.

| Etapa / assunto | Provas e propósito |
|---|---|
| Inventário de 28/09 | [01 — população e conferência cadastral](../evidencias/sanitizadas/IAM-010/01-inventario-conferencia-inicial.md): o que existia antes de decidir os acessos. |
| Reconciliação e recertificação | [07 — comparação dos grupos](../evidencias/sanitizadas/IAM-010/07-comparacao-populacao-grupos.md) e [08 — decisões por associação](../evidencias/sanitizadas/IAM-010/08-recertificacao-simulada.md): esperado × observado e manter/remover/investigar. |
| Bruno: acesso ausente | [02–06 — grupo antes/depois, leitura e criação negada](../evidencias/sanitizadas/IAM-010/06-tratamento-validacao-ad.md). A comparação coletiva é indicada separadamente no relatório. |
| Serviço: vínculos residuais | [10–13 — dependências, decisão e retirada](../evidencias/sanitizadas/IAM-010/10-servico-remocao-concessoes.md): conta mantida desabilitada e acesso humano preservado. |
| Isabela: nova regra de TI | [Cadastro, GG/DL, ACL/SMB e testes](../evidencias/sanitizadas/IAM-010/ti-isabela/README.md): execução somente no AD. |
| SoD: conflito simulado | [14–16 — regra, decisão e resultados](../evidencias/sanitizadas/IAM-010/14-sod-resultado.md): cinco cenários locais, sem mudar direitos reais nos diretórios. |
| Conferência final AD | [17–18 — coleta e comparação](../evidencias/sanitizadas/IAM-010/17-conferencia-final-ad.md): captura 18 mostra coleta; relatório 17 demonstra as oito associações conformes. |

Referências necessárias: a [decisão de escopo de 28/09](REV-2026-09-28-escopo-reconciliacao.md) e a [matriz consolidada de 29/09](MAT-2026-09-29-acessos-por-sistema.md) são as regras versionadas. O complemento de OU de Gabriela e o encerramento de Diego mantêm suas provas nos próprios tickets, com a relação com esta revisão explicada no índice do IAM-010.

## Riscos, reversão e limitações

- Aprovação de orçamento e manutenção de fornecedor são direitos fictícios; não há ERP, workflow financeiro ou integração IGA implementados. Pertencer a `GG_FIN_READ` não demonstra esses poderes.
- A regra é **SoD estática**, sobre acumular direitos. Impedir que alguém aprove a própria transação é um controle dinâmico no aplicativo e não será apresentado como executado.
- Para uma correção real, registrar dependências e reversão antes da mudança; preservar concessões de outras pessoas. A reversão da entrada simulada não exige mudar diretórios.
- O microcaso tem limite de cerca de 90 minutos, incluindo preparo, dentro da revisão já prevista. Sem cálculo de SLA ou aprovação corporativa real.

## Fechamento

Conferência final AD concluída em 29/09 às 17:24:48: [provas 17–18](../evidencias/sanitizadas/IAM-010/17-conferencia-final-ad.md), oito associações conformes, zero ausentes/excedentes, TI presente e serviço sem os vínculos retirados. **IAM-010 fechado em 29/09/2026 no escopo documentado**, sem tarefa de alteração de Employee type. As fontes cloud anteriores permanecem datadas; não houve nova exportação Entra nesta conferência. O microcaso SoD está concluído, com regra, decisão e resultado comprovados no modelo local. Resultado incorporado à [entrega v0.5 de 29/09](../CHANGELOG.md#v05--2026-09-29), com limites preservados.
