# Escopo da reconciliação — revisão de 28/09/2026

- Registro: 28/09/2026, 16:14 UTC−03:00.
- Ambiente: laboratório simulado; AD e Entra independentes, sem sincronização.
- Decisão: escopo adotado por Wesley nesta revisão, mediante solicitação explícita. Não representa aprovação corporativa real nem regra comprovadamente vigente antes deste registro.
- Estado: regra definida; inclusão de Bruno e mudança de OU de Gabriela comprovadas, com comparação posterior. Comparação departamental e recertificação simulada registradas; retenção da conta de serviço, encerramento de Diego e SoD pendentes.
- Ticket responsável: [IAM-010 — Recertificação de acessos e SoD](05-fila-tickets.md#iam-010). Este registro documenta sua etapa preparatória de inventário e reconciliação; o complemento de OU da Gabriela também referencia o IAM-002.

## Objetivo

Definir quem precisa de conta em cada sistema e quais grupos departamentais são esperados. Distinguir acesso ausente/excedente de ausência intencional de provisionamento. A fonte de RH de 28/09 permanece preservada, com nove pessoas; matrícula não implica necessidade automática de conta em todos os sistemas.

## Origem da decisão: inventário levantado

A análise do inventário AD coletado em 28/09/2026 às 15:52:51 UTC−03:00 identificou Bruno em Suporte sem associação a GG_SUP_TICKET e Gabriela com departamento Financeiro, mas objeto ainda na OU Suporte. Com base nesses achados e na finalidade dos recursos do laboratório, Wesley decidiu nesta revisão definir leitura de SuporteLab para Bruno e complementar o Mover de Gabriela com a mudança de OU, após conferir suas dependências. A ausência de EMP0009 nos diretórios motivou explicitar que seu provisionamento não está previsto neste recorte.

Sequência documental: inventário observado → análise da necessidade → decisão simulada e regra registrada → execução → nova coleta e validação. No registro inicial, as três primeiras etapas estavam concluídas. Atualização: os dois encaminhamentos foram executados e a nova coleta de 16:59:31 confirma as mudanças no escopo observado. A coleta comprova o estado observado, não uma aprovação anterior.

## Matriz vigente para esta revisão

| Pessoa | AD | Entra |
|---|---|---|
| Ana — EMP0001 | Fora do escopo de provisionamento AD nesta etapa | Habilitada; GG_FIN_READ |
| Bruno — EMP0002 | Habilitada; GG_SUP_TICKET, para leitura de SuporteLab | Habilitada; GG_SUP_TICKET |
| Carla — EMP0003 | Sem necessidade de provisionamento; investigar se surgir conta residual | Desabilitada; sem GG_FIN_READ, GG_SUP_TICKET ou GG_RH_READ |
| Diego — EMP0004 | Expiração em 29/09/2026 às 08:00 UTC−03:00; sem os grupos departamentais deste escopo | Bloquear/revogar sessões a partir do encerramento em 29/09 às 08:00; sem os três grupos departamentais |
| Elisa — EMP0005 | Fora do escopo de provisionamento AD nesta etapa | Habilitada; GG_RH_READ |
| Felipe — EMP0006 | Habilitada; GG_FIN_READ | Habilitada; GG_FIN_READ |
| Gabriela — EMP0007 | Habilitada; GG_FIN_READ; OU Financeiro | Habilitada; GG_FIN_READ |
| Henrique — EMP0008 | Fora do escopo de provisionamento AD nesta etapa | Habilitada; GG_RH_READ |
| Isabela — EMP0009 | Sem provisionamento previsto nesta etapa | Sem provisionamento previsto nesta etapa |

Nos grupos departamentais avaliados, o esperado é somente o grupo indicado por pessoa; combinações adicionais exigem análise. No AD, avaliar as associações diretas aos GG e o encadeamento conhecido para as DL. No Entra, avaliar as associações aos três grupos, sem alegar acesso a uma aplicação ou pasta.

“Fora do escopo” não autoriza excluir contas existentes nem ignorar contas inesperadas. Uma conta encontrada nessas condições exige classificação e justificativa. Para EMP0009, a ausência passa a ser intencional no recorte adotado; sua linha no RH permanece inalterada.

## Encaminhamentos autorizados no cenário

### Bruno — acesso ausente frente à regra agora definida

A coleta AD de 28/09 às 15:52 mostra Bruno habilitado em Suporte e GG_SUP_TICKET sem membros. Com esta regra, registrar acesso ausente para tratamento: incluir Bruno em GG_SUP_TICKET, preservando a concessão por grupo e sem entrada individual na ACL. Validar leitura permitida e criação negada em SuporteLab usando a identidade de Bruno; coletar novamente as associações.

Inclusão comprovada às 16:42:48, leitura permitida às 16:55:18 e criação negada às 16:57:45. [Provas e comparação posterior](../evidencias/sanitizadas/IAM-010/06-tratamento-validacao-ad.md). A divergência é avaliada frente à regra desta revisão, não como descumprimento de uma aprovação antiga. Reversão da concessão: retirar somente a associação acrescentada e retestar com conexão renovada.

### Gabriela — complemento do IAM-002

Mover o objeto existente de OU Suporte para OU Financeiro após conferir GPOs e delegação administrativa das duas OUs. Preservar GUID, matrícula e grupos atuais. A movimentação não concede acesso financeiro por si só.

Critérios de conclusão: antes/depois do DistinguishedName, mesmo GUID e matrícula, grupos preservados, leitura financeira permitida, criação negada e leitura de Suporte negada em conexão renovada. Registrar eventuais diferenças de políticas/delegação separadamente. Reversão: retornar o objeto à OU Suporte se necessário e reavaliar os efeitos; isso não desfaz automaticamente todos os efeitos de políticas já aplicadas.

Movimentação comprovada às 16:23:08 e testes apresentados nas provas 24–28 do IAM-002. Não há evidência da conferência de GPO/delegação nem de toda a renovação das conexões; limites registrados no índice das provas. O fechamento anterior do [IAM-002](05-fila-tickets.md#iam-002) continua válido para o escopo executado; as novas provas e o CSV de 16:59:31 complementam o caso sem reescrever o resultado anterior.

### Diego e contas especiais

O encerramento vigente de Diego é **29/09/2026 às 08:00 UTC−03:00**, conforme [IAM-004](05-fila-tickets.md#iam-004). RH atualizado com a data de desligamento; configuração AD comprovada em captura de 28/09 às 17:11; validação após vigência pendente. Até a vigência, o status RH permanece ATIVO. Não alterar admissão nem inferir encerramento automático no Entra; cada sistema exige tratamento e validação próprios. Usar a nova fonte vigente nas próximas comparações, com o horário de corte definido no ticket.

Classificar administradores, contas de emergência, conta de serviço, convidado e contas internas separadamente da população de RH, verificando finalidade, responsável e estado esperado. Ausência de matrícula não basta para declarar conta órfã. Não incluir essas identidades nos grupos departamentais por conveniência.

## Conclusão da reconciliação

Nova coleta de 16:59:31 preservada e comparada com a de 15:52:51: nove contas preservadas, sete grupos inalterados, única associação acrescentada de Bruno e única alteração cadastral de localização da Gabriela. A comparação departamental com a matriz foi concluída: nove associações conformes. As decisões simuladas estão na evidência 08 do IAM-010: doze manter e três investigar a retenção de acessos da conta de serviço. Fontes ausentes, chaves duplicadas e objetos sem correspondência devem gerar pendência explícita, nunca resultado “zero exceções”. A conferência inicial de cadastro teve 34 regras conformes; isso não encerra a análise de concessões, OU ou população.

A recertificação simulada está registrada no IAM-010. Não há identidade híbrida configurada; SoD e tratamento das pendências permanecem etapas separadas.
