# EV-IAM-001-03 — Criação da identidade

- Ticket: IAM-001
- Fonte: log de auditoria do Microsoft Entra ID
- Arquivo bruto: entra-audit-raw-2026-09-03.csv
- Armazenamento bruto: cofre local privado
- Data/hora UTC: 2026-09-03T19:47:28.0287472Z
- Serviço: Core Directory
- Categoria: UserManagement
- Atividade: Add user
- Status: Bem-sucedido
- Identidade de destino: EMP0006 — Felipe Gomes
- Executor sanitizado: ADMIN-LAB-001
- UPN sanitizado: felipe.gomes@empresa.example
- IDs técnicos: removidos da versão pública

## Resultado

A identidade cloud-only correspondente ao funcionário EMP0006 foi criada
com sucesso no tenant do laboratório.

## Validação

O usuário foi localizado posteriormente no inventário exportado do Microsoft
Entra ID com o Employee ID EMP0006.