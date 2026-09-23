# Fontes do Entra de 22/09 - conferência em 23/09

Revisão documental para preparar a reconciliação. Não houve nova consulta ao tenant nesta revisão. As datas das fontes foram preservadas.

## Cadastro confirmado no CSV

Fonte privada: `exportUsers_2026-9-22.csv`. Matrículas e estados lidos diretamente do arquivo; sem horário de exportação por linha. O arquivo também contém os identificadores de objeto para a correlação privada, omitidos deste resumo.

| Identidade | Matrícula | Habilitada | Departamento | Cargo |
|---|---|---|---|---|
| Carla Mendes | EMP0003 | True | Financeiro | Assistente Financeiro |
| Gabriela Santos | EMP0007 | True | Suporte | Analista de Suporte |

## Evidências reaproveitadas

| Verificação | Fonte existente | Alcance |
|---|---|---|
| Carla em GG_FIN_READ | [Captura com Ana, Carla e Felipe](03-membros-financeiro-com-carla.png) | Membros diretos apresentados na captura de 22/09; não lista todos os grupos da Carla |
| Inclusão de Carla | [Auditoria complementar](04-auditoria-inclusao-carla.md) | Add member to group, success, 22/09 às 13:53:22 UTC-03:00 |
| Inclusão de Gabriela em GG_SUP_TICKET | [Extrato de auditoria](README.md) | Add member to group, success, 22/09 às 10:51:29 UTC-03:00; evento, não inventário atual completo |
| Membros de RH | [Captura de GG_RH_READ](02-membros-rh.png) | Elisa e Henrique na captura de 22/09 |

## O que ainda falta

**Atualização posterior em 23/09:** [quatro novas capturas](../inventario-entra-2026-09-23/README.md) complementaram as consultas de grupos de ambas e papéis/aplicações de Carla. As pendências abaixo descrevem o momento anterior à chegada dessas provas. A nova conferência especifica alcance e limites. Mais tarde, o [IAM-003](../IAM-003/README.md) documentou o tratamento e a validação final; a lista abaixo é histórica, não uma pendência atual do Leaver.

- Listagem completa dos grupos diretos de Carla e Gabriela no Entra, ou exportações suficientes para o escopo explicitamente escolhido.
- Estado de papéis e atribuições de aplicações de Carla; não consta como verificado nestas fontes. Ausência de evidência não equivale a lista vazia.
- Atualizar a consulta de Carla imediatamente antes do Leaver e coletar novamente depois da correção. Conferir sessões separadamente.
- Relatório do comparador e sua validação: ainda não executados nesta revisão.

O CSV e a prova de GG_FIN_READ sustentam o estado residual histórico de Carla frente ao RH desligado. Não são prova de acesso a uma aplicação nem de estado atual em 23/09. Gabriela continua em Suporte na fonte vigente; sua associação histórica é compatível com essa área, sem demonstrar ausência de todos os acessos excedentes.

AD e Entra são independentes. A nova captura recebida de Downloads em 23/09 é de **Gabriela no AD**, não de Carla. Nenhuma prova AD de Carla foi identificada nessa captura.
