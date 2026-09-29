# Laboratório de IAM — identidades e controle de acesso

Prática de IAM com Microsoft Entra ID, Active Directory e PowerShell: provisionamento, menor privilégio, autenticação e reconciliação de acessos. Cada entrega apresenta objetivo, resultado e evidências.

**Entrega v0.5 — 29/09/2026:** JML, encerramento de terceiro, recertificação e microcaso SoD concluídos no escopo do laboratório. [Resultados e limites da versão](CHANGELOG.md#v05--2026-09-29).

## Lifecycle/JML — Joiner | Mover | Leaver

| Etapa | Estado | Resultado e evidência |
|---|---|---|
| **Joiner — entrada** | **Concluído** | Pré-admissão bloqueada; ativação, grupo, troca de senha e MFA comprovados no Entra. [IAM-011](00-operacao-itsm/05-fila-tickets.md#iam-011) |
| **Mover — mudança de área** | **Concluído** | Suporte retirado; Financeiro com leitura permitida/criação negada, identidade preservada na mudança de OU e comparação final conforme. [IAM-002](00-operacao-itsm/05-fila-tickets.md#iam-002) |
| **Leaver — desligamento** | **Concluído** | Conta bloqueada, revogação de sessões auditada, grupo removido, nova entrada negada e comparação final conforme no Entra. [IAM-003](00-operacao-itsm/05-fila-tickets.md#iam-003) |

## Outras entregas realizadas

| Entrega | Resultado | Evidência |
|---|---|---|
| Provisionamento e autenticação no Entra ID | Provisionamento, recuperação de autenticação e verificação de MFA documentados. | [IAM-001](00-operacao-itsm/05-fila-tickets.md#iam-001) · [IAM-006](00-operacao-itsm/05-fila-tickets.md#iam-006) · [IAM-007](00-operacao-itsm/05-fila-tickets.md#iam-007) |
| Reconciliação, recertificação e SoD | Decisões por acesso, vínculos de serviço retirados e TI validada; comparação final AD com oito associações conformes. SoD simulado: um conflito tratado, preservando o direito necessário. | [IAM-010: decisões e provas](evidencias/sanitizadas/IAM-010/README.md) · [Scripts](05-automacao/) |
| Encerramento de terceiro | Expiração AD recusou nova autenticação; Entra bloqueado, revogação auditada e estado final conferido. | [IAM-004: prazo e validação](evidencias/sanitizadas/IAM-004/README.md) |
| Governança de acesso — avaliação de permissão direta | Acesso por grupo mantido; pedido de permissão individual redundante não aprovado na simulação. | [IAM-008: decisão e evidências](00-operacao-itsm/05-fila-tickets.md#iam-008) |
| Acesso financeiro por grupos do AD | Felipe lê e tem criação de arquivo negada; Bruno autentica e tem leitura negada. | [AGDLP, permissões e seis evidências](evidencias/sanitizadas/agdlp-financeiro/README.md) |
| Delegação no AD | Reset permitido em Suporte e negado em Terceiros; estado antes/depois conferido. | [Três capturas e validação](evidencias/sanitizadas/delegacao-reset-ou/README.md) |
| Conta de serviço no AD | Rotina executada duas vezes; escrita indevida negada e conta/tarefa desabilitadas ao final. | [IAM-005: sete provas e resultados](evidencias/sanitizadas/IAM-005/README.md) |
| Revogação de acesso e sessão SMB | Leitura persistiu após remoção do grupo; reconexão negou acesso e restauração foi validada. | [IAM-009: seis provas](evidencias/sanitizadas/IAM-009/README.md) |
| Acesso administrativo de emergência | Duas contas com MFA por notificação e código OATH; teste administrativo comprovado, independência ainda a validar. | [Procedimento e provas](00-operacao-itsm/PROC-BG-001-acesso-emergencia.md) |
| Troubleshooting do ADUC | Diagnóstico da indisponibilidade e recuperação do console documentados. | [Caso e oito capturas](06-troubleshooting/2026-09-11-aduc-rede-nat/README.md) |

[Fila ITSM: tickets, aprovações e validações](00-operacao-itsm/05-fila-tickets.md) · [Incidente documentado no ServiceNow](evidencias/sanitizadas/IAM-006/servicenow/README.md) · [Índice de evidências](evidencias/README.md)

**Ambiente:** laboratório com identidades de negócio e cenários fictícios. AD e Entra possuem contas independentes, sem sincronização demonstrada. As aprovações são simuladas; cada caso informa seus limites. Credenciais e tokens permanecem privados; algumas capturas (Guest e acesso de emergência) contêm dados pessoais do operador publicados com sua autorização.
