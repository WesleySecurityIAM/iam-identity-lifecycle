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
- Conta cloud-only criada e associada ao GG_FIN_READ.
- Employee ID EMP0006 e departamento Financeiro preenchidos.
- Preenchimento do cargo informado no atendimento.
- Inventário de usuários exportado em 2026-09-04.

## Validação
A auditoria confirmou a criação e a associação ao grupo. O evento de
criação registrou departamento Financeiro e conta habilitada.

O inventário confirmou EMP0006 e Felipe Gomes. A exportação não contém
a coluna de cargo. Em 10/09/2026, a captura EV-IAM-001-06 mostra Felipe Gomes, Employee ID EMP0006, cargo Analista Financeiro e departamento Financeiro, compatíveis com o RH e a matriz. Posteriormente, na mesma data, o CSV exportado do Entra confirmou esses valores e accountEnabled=True. A evidência 07 fundamenta a conclusão da conferência cadastral; a captura 06 é complementar.

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
- O grupo não está vinculado ao sistema financeiro; não houve teste
  de acesso ao recurso.
- A correlação entre RH e Entra foi manual.
- A captura de 10/09 mostra valores em uma tela de edição; não contém confirmação de salvamento ou reabertura. Essa limitação da captura foi suprida, para o estado cadastral atual, pela exportação da evidência 07. Nenhuma das duas evidências comprova retroativamente o cargo em 03/09.

## Fechamento
O atendimento foi registrado como resolvido em 2026-09-04.
Criação, Employee ID e associação ao grupo estão comprovados.
O fechamento histórico de 04/09 permanece registrado. Em 10/09/2026, foi acrescentada evidência posterior, sem atribuí-la à data original do atendimento.

### Complementação documental - 10/09/2026

A captura 06 foi inicialmente usada para encerrar a revisão visual; sua limitação como tela editável foi posteriormente reconhecida. Na mesma data, o operador forneceu nova exportação do Entra. A conferência do CSV confirmou EMP0006, Analista Financeiro, Financeiro e conta habilitada (evidência 07), concluindo REV-IAM-001-01 com evidência cadastral atual. Não houve alteração de conta por esta revisão. A data original de preenchimento do cargo permanece não demonstrada, e não se declara teste de acesso ao recurso.



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
- ADMIN-LAB-001 redefiniu a senha às 20:29:54Z.
- Após nova interrupção às 20:32:12Z, Felipe concluiu uma alteração
  de senha às 20:33:21Z.
- Logs foram preservados e correlacionados por identificadores
  mantidos somente no cofre privado.

## Validação
Foram confirmadas três entradas posteriores com status Êxito:
- 20:33:27Z — My Profile.
- 20:33:43Z — My Signins, com primeiro fator satisfeito pelo token.
- 20:34:08Z — My Signins, com notificação de aplicativo móvel
 resultado “MFA completed in Azure AD”.
 As três entradas apresentaram status Êxito.
 O campo de código de erro não foi preenchido no CSV exportado.

## Evidências
- [01 — Entradas interrompidas](../evidencias/sanitizadas/IAM-006/EV-IAM-006-01-eventos-50055.md)
- [02 — Detalhes da autenticação](../evidencias/sanitizadas/IAM-006/EV-IAM-006-02-detalhes-autenticacao.md)
- [03 — Alterações e redefinição de senha](../evidencias/sanitizadas/IAM-006/EV-IAM-006-03-eventos-senha.md)
- [04 — Autenticação restabelecida](../evidencias/sanitizadas/IAM-006/EV-IAM-006-04-login-posterior.md)

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



# IAM-007 — Verificação de cadastro e uso de MFA — EMP0006
- Ambiente: laboratório fictício — Microsoft Entra ID Free
- Tipo: requisição de verificação de MFA
- Identidade: EMP0006
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

## Análise
Foram examinadas três fontes: métodos atuais no Entra,
auditoria das alterações de cadastro e detalhes de autenticação
da entrada identificada no IAM-006.

## Ações realizadas
- Consultados os métodos de autenticação em 2026-09-08.
- Conferidos dois eventos de cadastro no CSV de auditoria.
- Correlacionada a entrada com seus detalhes de autenticação.
- Reunidas as evidências sanitizadas e a referência ao IAM-006.

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


