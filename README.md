# Laboratório de IAM — identidades e controle de acesso

Prática de IAM com Microsoft Entra ID, Active Directory e PowerShell: provisionamento, menor privilégio, autenticação e reconciliação de acessos. Cada entrega apresenta objetivo, resultado e evidências.

## Entregas realizadas

| Entrega | Resultado | Evidência |
|---|---|---|
| Provisionamento e autenticação no Entra ID | Provisionamento, recuperação de autenticação e verificação de MFA documentados. | [IAM-001](00-operacao-itsm/05-fila-tickets.md#iam-001) · [IAM-006](00-operacao-itsm/05-fila-tickets.md#iam-006) · [IAM-007](00-operacao-itsm/05-fila-tickets.md#iam-007) |
| Joiner — pré-admissão e ativação no Entra ID | Conta bloqueada antes da admissão; ativação, grupo, troca de senha e entrada com MFA comprovados. | [IAM-011](00-operacao-itsm/05-fila-tickets.md#iam-011) |
| Reconciliação de acessos com PowerShell | Cinco associações avaliadas; três exceções identificadas, sem remediação automática. | [Script, CSVs e reprodução](05-automacao/) |
| Governança de acesso — avaliação de permissão direta | Acesso por grupo mantido; pedido de permissão individual redundante não aprovado na simulação. | [IAM-008: decisão e evidências](00-operacao-itsm/05-fila-tickets.md#iam-008) |
| Acesso financeiro por grupos do AD | Felipe lê e tem criação de arquivo negada; Bruno autentica e tem leitura negada. | [AGDLP, permissões e seis evidências](evidencias/sanitizadas/agdlp-financeiro/README.md) |
| Delegação no AD | Reset permitido em Suporte e negado em Terceiros; estado antes/depois conferido. | [Três capturas e validação](evidencias/sanitizadas/delegacao-reset-ou/README.md) |
| Conta de serviço no AD | Rotina executada duas vezes; escrita indevida negada e conta/tarefa desabilitadas ao final. | [IAM-005: sete provas e resultados](evidencias/sanitizadas/IAM-005/README.md) |
| Revogação de acesso e sessão SMB | Leitura persistiu após remoção do grupo; reconexão negou acesso e restauração foi validada. | [IAM-009: seis provas](evidencias/sanitizadas/IAM-009/README.md) |
| Troubleshooting do ADUC | Diagnóstico da indisponibilidade e recuperação do console documentados. | [Caso e oito capturas](06-troubleshooting/2026-09-11-aduc-rede-nat/README.md) |

[Fila ITSM: tickets, aprovações e validações](00-operacao-itsm/05-fila-tickets.md) · [Índice de evidências](evidencias/README.md)

**Ambiente:** laboratório com identidades de negócio e cenários fictícios. AD e Entra possuem contas independentes, sem sincronização demonstrada. As aprovações são simuladas; cada caso informa seus limites. Credenciais e identificadores privados são omitidos das evidências públicas.
