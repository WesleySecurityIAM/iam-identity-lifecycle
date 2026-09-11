# EV-IAM-001-04 — Associação ao grupo de acesso

- Ticket: IAM-001
- Fonte: log de auditoria do Microsoft Entra ID
- Arquivo bruto: entra-audit-raw-2026-09-03.csv
- Armazenamento bruto: cofre local privado
- Data/hora UTC: 2026-09-03T19:47:28.6788099Z
- Serviço: Core Directory
- Categoria: GroupManagement
- Atividade: Add member to group
- Status: Bem-sucedido
- Identidade de destino: EMP0006 — Felipe Gomes
- Grupo de destino: GG_FIN_READ
- Executor sanitizado: ADMIN-LAB-001
- IDs técnicos: removidos da versão pública

## Motivo

A matriz de acesso estabelece que funcionários no cargo de Analista
Financeiro devem receber acesso de leitura por meio do grupo GG_FIN_READ.

## Resultado

Felipe Gomes foi associado com sucesso ao grupo GG_FIN_READ.

## Validação

A associação foi registrada no log de auditoria do Microsoft Entra ID.
A participação do usuário no grupo também foi conferida na tela de membros.

## Limitação

O grupo GG_FIN_READ ainda não está vinculado a um sistema financeiro real.
A evidência atual comprova o provisionamento da identidade e a associação
ao grupo, mas não comprova acesso efetivo ao recurso Relatórios Financeiros.
