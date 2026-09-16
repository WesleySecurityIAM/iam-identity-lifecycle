# Laboratório de IAM — identidades e controle de acesso

Prática de IAM com Active Directory, Microsoft Entra ID e PowerShell: provisionamento, menor privilégio, autenticação e reconciliação de acessos. Cada entrega apresenta objetivo, resultado e evidências.

## Entregas realizadas

| Entrega | Resultado | Evidência |
|---|---|---|
| Reconciliação de acessos | Cinco associações avaliadas; três exceções identificadas, sem remediação automática. | [Script, CSVs e reprodução](05-automacao/) |
| Delegação no AD | Reset permitido em Suporte e negado em Terceiros; estado antes/depois conferido. | [Três capturas e validação](evidencias/sanitizadas/delegacao-reset-ou/README.md) |
| Acesso financeiro por grupos do AD | Felipe lê e tem criação de arquivo negada; Bruno autentica e tem leitura negada. | [AGDLP, permissões e seis evidências](evidencias/sanitizadas/agdlp-financeiro/README.md) |
| Conta de serviço no AD | Rotina executada duas vezes; escrita indevida negada e conta/tarefa desabilitadas ao final. | [IAM-005: sete provas e resultados](evidencias/sanitizadas/IAM-005/README.md) |
| Operação no Entra ID | Provisionamento, recuperação de autenticação e verificação de MFA documentados. | [Fila e evidências](00-operacao-itsm/05-fila-tickets.md) |
| Pré-admissão e ativação da Ana | Conta bloqueada antes da admissão; ativação, grupo, troca de senha e entrada com MFA comprovados. | [IAM-011](00-operacao-itsm/05-fila-tickets.md#iam-011) |
| Troubleshooting do ADUC | Diagnóstico da indisponibilidade e recuperação do console documentados. | [Caso e oito capturas](06-troubleshooting/2026-09-11-aduc-rede-nat/README.md) |

[Fila de tickets: aprovações, ações e validações](00-operacao-itsm/05-fila-tickets.md) · [Índice de evidências](evidencias/README.md)

**Ambiente:** laboratório com identidades de negócio e cenários fictícios. AD e Entra possuem contas independentes, sem sincronização demonstrada. As aprovações são simuladas; cada caso informa seus limites. Credenciais e identificadores privados são omitidos das evidências públicas.
