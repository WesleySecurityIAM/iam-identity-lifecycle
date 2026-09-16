# IAM-011 — Estado da conta na pré-admissão

Extração mínima do CSV de usuários coletado em 14/09/2026. Uma linha, referente a Ana. O original permanece privado.

| Propriedade | Valor observado |
|---|---|
| displayName | Ana Ribeiro |
| employeeId | EMP0001 |
| jobTitle | Analista Financeiro |
| department | Financeiro |
| accountEnabled | False |
| employeeHireDate | 2026-09-15T03:00:00Z (15/09/2026 00:00 em Brasília) |
| forceChangePasswordNextSignIn | True |
| forceChangePasswordNextSignInWithMfa | False |

O perfil exige troca de senha; ainda não comprova a troca pelo usuário. False no campo WithMfa não descreve todas as políticas de MFA do tenant. O CSV mostra o estado na coleta, sem fornecer seu horário exato.

Origem: `exportUsers_2026-9-14.csv`. SHA-256: `df17cc0f643edc84310ba52f366b7eaf9048ce8ca5556893f15e6cd5d78be843`.
UPN, IDs e outros campos sem necessidade para esta evidência foram omitidos.
