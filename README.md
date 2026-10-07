# Portfólio IAM — ciclo de vida e governança de acessos

Portfólio prático de **Wesley**, com foco em **estágio e posições de entrada em IAM**. Laboratório com **Microsoft Entra ID, Active Directory e PowerShell**, cobrindo entrada, mudança de área e desligamento, menor privilégio, MFA, reconciliação e revisão de acessos.

**v0.5 entregue em 29/09/2026:** 11 cenários IAM documentados, com resultados, evidências e limites. O trabalho conecta **regra de acesso → decisão → execução → teste → conferência final**. [Resumo da entrega](CHANGELOG.md#v05--2026-09-29).

## Lifecycle/JML — Joiner | Mover | Leaver

| Etapa | Estado | Resultado e evidência |
|---|---|---|
| **Joiner — entrada** | **Concluído** | Pré-admissão bloqueada; ativação, grupo, troca de senha e MFA comprovados no Entra. [IAM-011](00-operacao-itsm/05-fila-tickets.md#iam-011) |
| **Mover — mudança de área** | **Concluído** | Suporte retirado e leitura negada; Financeiro legível, criação negada e identidade preservada. Cadastro/grupos conferidos separadamente no AD e Entra. [IAM-002: execução e resultado](evidencias/sanitizadas/IAM-002/README.md#execução-e-fechamento--2809) |
| **Leaver — desligamento** | **Concluído** | Conta bloqueada, revogação auditada, grupo removido, nova entrada negada e comparação posterior conforme no Entra. [IAM-003: antes/depois](evidencias/sanitizadas/IAM-003/README.md) |

## Três casos para começar

- **Provisionamento e autenticação no Entra ID:** [criação da conta e associação ao grupo](evidencias/sanitizadas/IAM-001/README.md) → [recuperação da autenticação](evidencias/sanitizadas/IAM-006/README.md) → [verificação do cadastro e uso de MFA](evidencias/sanitizadas/IAM-007/README.md), acompanhando Felipe em três tickets relacionados.
- **Governança:** [Reconciliação, recertificação e SoD](evidencias/sanitizadas/IAM-010/README.md) — comparação com a matriz, decisão por acesso, retirada de concessões residuais e conflito detectado/tratado em dados fictícios.
- **Diagnóstico:** [Acesso após remoção de grupo](evidencias/sanitizadas/IAM-009/README.md) — leitura persistiu na conexão SMB; reconexão negou acesso e restauração foi validada.

Os casos ligam o resultado a capturas, extratos de logs ou CSVs. [Automação PowerShell e reprodução](05-automacao/readme.md): exercício sintético de reconciliação, comparador de grupos, coletor AD e demonstração SoD, cada um com seu escopo.

## Reconciliações — esperado × observado

A [matriz geral fictícia](00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md#catalogo-acessos) relaciona departamento/cargo, recurso e acesso esperado por sistema. RH e matriz são comparados com exportações dos diretórios, correlacionando pessoas por matrícula e contas/grupos por seus identificadores. As comparações detectam divergências e conferem o estado após as mudanças; a recertificação registra a decisão sobre a necessidade de manter o acesso.

| Comparação | Resultado demonstrado | Evidência |
|---|---|---|
| Cadastro — RH × Entra | Carla desligada no RH e habilitada no Entra gerou exceção. Após o bloqueio, nova comparação confirmou False esperado / False observado. | [IAM-003: antes e depois](evidencias/sanitizadas/IAM-003/08-validacao-final.md) |
| Mover — RH e regra × Entra | Gabriela: identidade preservada, conta habilitada, área/cargo corretos, Suporte ausente e Financeiro presente. Seis verificações conformes após a mudança. | [IAM-002: comparação final](evidencias/sanitizadas/IAM-002/23-comparacao-final.md) |
| População e grupos — matriz × AD/Entra | Comparação por sistema distingue ausência intencional, acesso ausente e excedente. Após os tratamentos, conferência final AD de 29/09: oito associações conformes, zero ausentes/excedentes no recorte avaliado. | [IAM-010: comparação de 28/09](evidencias/sanitizadas/IAM-010/07-comparacao-populacao-grupos.md) · [Conferência final AD](evidencias/sanitizadas/IAM-010/17-conferencia-final-ad.md) |

## Outras entregas realizadas

| Entrega | Resultado | Evidência |
|---|---|---|
| Encerramento de terceiro | Expiração AD recusou nova autenticação; Entra bloqueado, revogação auditada e estado final conferido. | [IAM-004: prazo e validação](evidencias/sanitizadas/IAM-004/README.md) |
| Governança de acesso — avaliação de permissão direta | Acesso por grupo mantido; pedido de permissão individual redundante não aprovado na simulação. | [IAM-008: decisão e evidências](00-operacao-itsm/05-fila-tickets.md#iam-008) |
| Acesso financeiro por grupos do AD | Felipe lê e tem criação de arquivo negada; Bruno autentica e tem leitura negada. | [AGDLP, permissões e seis evidências](evidencias/sanitizadas/agdlp-financeiro/README.md) |
| Delegação no AD | Reset permitido em Suporte e negado em Terceiros; estado antes/depois conferido. | [Três capturas e validação](evidencias/sanitizadas/delegacao-reset-ou/README.md) |
| Conta de serviço no AD | Rotina executada duas vezes; escrita indevida negada e conta/tarefa desabilitadas ao final. | [IAM-005: sete provas e resultados](evidencias/sanitizadas/IAM-005/README.md) |
| Acesso administrativo de emergência | Duas contas com MFA por notificação e código OATH; teste administrativo comprovado, independência ainda a validar. | [Procedimento e provas](00-operacao-itsm/PROC-BG-001-acesso-emergencia.md) |
| Troubleshooting do ADUC | Diagnóstico da indisponibilidade e recuperação do console documentados. | [Caso e oito capturas](06-troubleshooting/2026-09-11-aduc-rede-nat/README.md) |

[Fila ITSM: tickets, aprovações e validações](00-operacao-itsm/05-fila-tickets.md) · [Incidente documentado no ServiceNow](evidencias/sanitizadas/IAM-006/servicenow/README.md) · [Evidências por ticket](evidencias/README.md)

Para acompanhar uma entrega, comece pelo resultado do ticket e siga seu índice de provas: **estado anterior → decisão/diagnóstico → ação → validação**. Cada link identifica o assunto, a data e o alcance da prova; preparações e complementos posteriores ficam sinalizados.

## Organização e limites

| Onde consultar | Conteúdo |
|---|---|
| [Operação ITSM](00-operacao-itsm/) | Tickets, decisões simuladas, matriz e procedimentos. |
| [Automação](05-automacao/readme.md) | Scripts, entradas, resultados esperados e instruções de reprodução. |
| [Evidências](evidencias/README.md) | Casos, capturas, extratos e limites de cada prova. |
| [Troubleshooting](06-troubleshooting/2026-09-11-aduc-rede-nat/) | Diagnóstico e recuperação do ADUC. |

**Escopo:** ambiente de estudo, identidades de negócio fictícias e aprovações simuladas. AD e Entra possuem contas independentes; sincronização híbrida ainda não demonstrada. Associação a grupo no Entra não comprova acesso a aplicação. SoD é uma simulação local; as comparações finais cobrem as regras e fontes declaradas em cada caso.

Credenciais, tokens e exportações integrais permanecem privados. Algumas capturas de Guest e emergência contêm dados pessoais do operador publicados com sua autorização. O procedimento de emergência registra a independência de recuperação ainda pendente.

**Continuidade:** consolidar esta base e avançar em Cloud Identity e NHI. Híbrido, integrações de aplicações e APIs são próximas etapas, não resultados alegados pela v0.5.
