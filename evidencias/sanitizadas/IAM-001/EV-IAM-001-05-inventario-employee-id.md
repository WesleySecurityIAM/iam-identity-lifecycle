# EV-IAM-001-05 — Correlação do Employee ID no inventário

- Ticket: IAM-001
- Fonte: exportação de usuários do Microsoft Entra ID
- Data da exportação: 2026-09-04
- Arquivo bruto: exportUsers_2026-9-4.csv
- Armazenamento bruto: cofre local privado
- IDs técnicos: removidos da versão pública

## Registro sanitizado

| Employee ID | Nome | Tipo | UPN sanitizado |
|---|---|---|---|
| EMP0006 | Felipe Gomes | Membro | felipe.gomes@empresa.example |

## Resultado

O Employee ID EMP0006, proveniente da fonte autoritativa de RH, foi
localizado na exportação de usuários do Microsoft Entra ID. Isso permite
correlacionar a identidade do diretório com o respectivo registro de RH.

## Limitações

- A evidência comprova que o Employee ID foi armazenado e exportado pelo Entra.
- Não comprova integração ou sincronização automática entre o RH e o Entra.
- O preenchimento do atributo foi realizado manualmente no laboratório.
- A criação da identidade é comprovada separadamente na evidência 03.
- Não comprova associação ao grupo nem acesso ao sistema financeiro.

