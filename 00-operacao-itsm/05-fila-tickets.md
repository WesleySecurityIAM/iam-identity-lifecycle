# Fila de tickets do laboratório

| Ticket | Objetivo | Resultado documentado |
|---|---|---|
| [IAM-001](#iam-001) | Provisionar Felipe no Entra | Identidade/grupo comprovados; cadastro complementado em 10/09. |
| [IAM-005](#iam-005) | Executar rotina com conta de serviço | Duas execuções, escritas indevidas negadas e desativação final. |
| [IAM-006](#iam-006) | Restabelecer autenticação | Alteração/redefinição de senha e entradas posteriores confirmadas. |
| [IAM-007](#iam-007) | Verificar cadastro e uso de MFA | Método cadastrado e uso comprovados separadamente. |
| [IAM-008](#iam-008) | Avaliar acesso direto | Fechado: acesso por grupo mantido; permissão individual não concedida. |
| [IAM-009](#iam-009) | Investigar acesso após remoção de grupo | Fechado: acesso persistiu; reconexão negou leitura; restauração comprovada. |
| [IAM-011](#iam-011) | Preparar e ativar Ana | Pré-admissão bloqueada; ativação, grupo, troca de senha e entrada com MFA. |

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

- [01 — Funcionário ativo no RH](../evidencias/sanitizadas/IAM-001/EV-IAM-001-01-fonte-rh.csv)
- [02 — Regra de acesso do cargo](../evidencias/sanitizadas/IAM-001/EV-IAM-001-02-regra-matriz.csv)
- [03 — Criação da identidade](../evidencias/sanitizadas/IAM-001/EV-IAM-001-03-add-user.md)
- [04 — Associação ao grupo](../evidencias/sanitizadas/IAM-001/EV-IAM-001-04-add-member-group.md)
- [05 — Employee ID no inventário](../evidencias/sanitizadas/IAM-001/EV-IAM-001-05-inventario-employee-id.md)
- [06 — Cargo atual e matrícula, conferência visual em 10/09/2026](../evidencias/sanitizadas/IAM-001/EV-IAM-001-06-cargo-atual.png)
- [07 — Cargo e matrícula no CSV exportado em 10/09/2026](../evidencias/sanitizadas/IAM-001/EV-IAM-001-07-cargo-inventario-2026-09-10.md)

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

- [Script original e instruções de reprodução](../05-automacao/IAM-005/README.md).
- [Índice: sete capturas, resultados e limitações](../evidencias/sanitizadas/IAM-005/README.md).
- [02 — Grupos e ACL da saída](../evidencias/sanitizadas/IAM-005/02-grupos-e-permissoes-saida.png).
- [06 — Reexecução e testes](../evidencias/sanitizadas/IAM-005/06-reexecucao-testes-e-resultado-zero.png).
- [07 — Tarefa e conta desabilitadas](../evidencias/sanitizadas/IAM-005/07-estado-final-desabilitado.png).

## Riscos e reversão

Riscos: exposição da credencial, alteração do código e acesso excessivo. Conta/tarefa desabilitadas; grupos e ACLs permanecem configurados. Reversão: retirar concessões específicas e revisar a GPO antes de desvinculá-la. Manutenção: guardar a senha fora de script/Git; conferir validade e atualizar a credencial da tarefa quando alterada, com reteste. Rotação não testada.

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

- [01 — Entradas interrompidas](../evidencias/sanitizadas/IAM-006/EV-IAM-006-01-eventos-50055.md)
- [02 — Detalhes da autenticação](../evidencias/sanitizadas/IAM-006/EV-IAM-006-02-detalhes-autenticacao.md)
- [03 — Alterações e redefinição de senha](../evidencias/sanitizadas/IAM-006/EV-IAM-006-03-eventos-senha.md)
- [04 — Autenticação restabelecida](../evidencias/sanitizadas/IAM-006/EV-IAM-006-04-login-posterior.md)
- [05 — Representação do incidente no ServiceNow](../evidencias/sanitizadas/IAM-006/servicenow/README.md): transcrição didática em 18/09, classificação, atribuição, Work notes, resolução e SLAs da PDI.

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

- [01 — Método atual](../evidencias/sanitizadas/IAM-007/EV-IAM-007-01-metodo-atual.md)
- [02 — Registro do Authenticator](../evidencias/sanitizadas/IAM-007/EV-IAM-007-02-cadastro-authenticator.md)
- [Referência IAM-006 — Uso de MFA](../evidencias/sanitizadas/IAM-006/EV-IAM-006-04-login-posterior.md)

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

- [01 — Estado da pré-admissão](../evidencias/sanitizadas/IAM-011/EV-IAM-011-01-estado-pre-admissao.md).
- [02 — Criação da conta](../evidencias/sanitizadas/IAM-011/EV-IAM-011-02-auditoria-criacao.md).
- [03 — Grupo sem Ana na preparação](../evidencias/sanitizadas/IAM-011/EV-IAM-011-03-grupo-sem-ana.md).
- [04 — Entrada bloqueada](../evidencias/sanitizadas/IAM-011/EV-IAM-011-04-entrada-bloqueada.md).
- [05 — Ativação, grupo, senha e cadastro](../evidencias/sanitizadas/IAM-011/EV-IAM-011-05-ativacao-grupo-autenticacao.md).
- [06 — Entrada positiva e MFA](../evidencias/sanitizadas/IAM-011/EV-IAM-011-06-entrada-positiva.md).
- [07 — RH histórico de 29/08](../evidencias/sanitizadas/IAM-011/EV-IAM-011-07-rh-2026-08-29.csv).
- [08 — RH atualizado em 18/09](../evidencias/sanitizadas/IAM-011/EV-IAM-011-08-rh-2026-09-18.csv).
- [09 — Origem, alteração e limites do complemento](../evidencias/sanitizadas/IAM-011/EV-IAM-011-09-atualizacao-rh.md).

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

- [01 — Felipe no grupo global](../evidencias/sanitizadas/IAM-008/01-felipe-no-gg-fin-read.png).
- [02 — Grupos globais na DL](../evidencias/sanitizadas/IAM-008/02-membros-dl-fin-relatorios-read.png).
- [03 — ACL da pasta financeira](../evidencias/sanitizadas/IAM-008/03-acl-pasta-financeira.png).
- [Histórico de 14/09 — Teste de Felipe](../evidencias/sanitizadas/agdlp-financeiro/05-felipe-leitura-permitida-escrita-negada.png).

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

[Seis capturas, linha do tempo e limites da coleta](../evidencias/sanitizadas/IAM-009/README.md). A captura nominal de 12:25 contém o teste das 12:10 e precede a de restauração na ordem dos eventos.

## Riscos e reversão

Risco: remover a associação sem verificar acesso pela conexão existente. Reversão executada: Felipe readicionado ao GG_FIN_READ, conexão renovada e leitura comprovada. Nenhuma alteração de ACL foi relatada.

## Limitações e pendências

- Horários vêm de Get-Date próximo aos comandos, não de eventos de auditoria das operações.
- Na prova 05, /delete retorna 2250 (conexão não encontrada); net use mostra lista vazia antes da reconexão. A desconexão anterior bem-sucedida não foi capturada.
- Sem exportação de sessões/tokens, identificação Kerberos/NTLM ou auditoria da remoção. Aprovação e horário simulados. Sem cálculo de SLA.

## Fechamento

Reprodução concluída: acesso persistiu na conexão mantida após remoção, foi negado após reconexão e voltou após restauração do grupo e nova conexão. Estado final de Felipe restaurado e comprovado.
