# Entra ID — conferências de 22/09/2026

Inventário e auditoria complementares à preparação dos casos JML. Contas cloud-only, independentes do AD. Nenhuma nova operação foi executada para produzir estes extratos.

## Inventário cadastral

Exportação fornecida: 9 contas, sendo 8 identidades fictícias EMP0001–EMP0008 e uma conta administrativa, identificada aqui como ADMIN-LAB-001. Todas aparecem como Member e habilitadas. Member não significa administrador. EMP0009 não consta deste inventário.

| Matrícula | Nome | Cargo | Departamento | Habilitada |
|---|---|---|---|---|
| EMP0001 | Ana Ribeiro | Analista Financeiro | Financeiro | True |
| EMP0002 | Bruno Costa | Analista de Suporte | Suporte | True |
| EMP0003 | Carla Mendes | Assistente Financeiro | Financeiro | True |
| EMP0004 | Diego Rocha | Terceiro de Sistemas | TI | True |
| EMP0005 | Elisa Martins | Analista de RH | RH | True |
| EMP0006 | Felipe Gomes | Analista Financeiro | Financeiro | True |
| EMP0007 | Gabriela Santos | Analista de Suporte | Suporte | True |
| EMP0008 | Henrique Oliveira | Analista de RH | RH | True |

Carla permanece habilitada apesar do desligamento na fonte de RH: a divergência do cenário simulado ainda não foi corrigida e será tratada no futuro Leaver. A expiração de Diego no AD não comprova corte automático no Entra.

## Grupos e autoria

- [01 — GG_FIN_READ](01-membros-financeiro.png): Ana e Felipe na captura de membros.
- [02 — GG_RH_READ](02-membros-rh.png): Elisa e Henrique na captura de membros.
- A auditoria abaixo comprova inclusões de Bruno/Gabriela no GG_SUP_TICKET e owners nos três grupos. Os eventos demonstram alterações naquele momento; não substituem uma exportação completa do estado atual dos grupos.
- A captura administrativa original mostra atribuição direta de Global Administrator. Original preservado em área privada por conter o nome pessoal do operador. Papel administrativo e owner do grupo são relações distintas. Seu uso aqui é uma condição do laboratório, não requisito para cada operação.

## Extrato de auditoria

Eventos selecionados: criação de usuários/grupos, inclusão de membros e owners. Horário convertido de UTC para UTC−03:00. Nomes de usuários correlacionados por ID com o CSV; IDs, UPNs e dados de infraestrutura omitidos.

| Data/hora UTC−03:00 | Ação | Alvo | Grupo | Resultado |
|---|---|---|---|---|
| 2026-09-21 11:59:32 | Add user | Carla Mendes | — | success |
| 2026-09-21 12:06:45 | Add user | Diego Rocha | — | success |
| 2026-09-22 10:23:10 | Add user | Elisa Martins | — | success |
| 2026-09-22 10:26:53 | Add user | Gabriela Santos | — | success |
| 2026-09-22 10:29:43 | Add user | Henrique Oliveira | — | success |
| 2026-09-22 10:48:37 | Add group | Grupo | GG_SUP_TICKET | success |
| 2026-09-22 10:48:39 | Add owner to group | ADMIN-LAB-001 | GG_SUP_TICKET | success |
| 2026-09-22 10:50:12 | Add group | Grupo | GG_RH_READ | success |
| 2026-09-22 10:50:14 | Add owner to group | ADMIN-LAB-001 | GG_RH_READ | success |
| 2026-09-22 10:51:29 | Add member to group | Gabriela Santos | GG_SUP_TICKET | success |
| 2026-09-22 10:59:42 | Add member to group | Elisa Martins | GG_RH_READ | success |
| 2026-09-22 10:59:42 | Add member to group | Henrique Oliveira | GG_RH_READ | success |
| 2026-09-22 11:00:33 | Add member to group | Bruno Costa | GG_SUP_TICKET | success |
| 2026-09-22 11:04:26 | Add owner to group | ADMIN-LAB-001 | GG_FIN_READ | success |

## Origem e limites

CSV completo, JSON completo e captura administrativa preservados sem alteração em área privada. A data do CSV vem da coleta informada/nome do arquivo, sem horário de exportação por linha. Grupos Entra não estão integrados ao recurso SMB; as associações não comprovam acesso a aplicação. Senhas não foram lidas nem incluídas.

- SHA-256 de `exportUsers_2026-9-22.csv`: `47fb8a68e4ccd4717d5d81025ccccd607c7c52fdab1ad9998571eaacab35a1a0`.
- SHA-256 de `AuditLogs_2026-09-22.json`: `b4134e720a9f793955caa2e1c76fe48cae19c69d341499e2a85a1a89ecff7a7b`.

[Preparação e provas do IAM-002](../IAM-002/README.md).
