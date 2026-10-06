# IAM-002 — Mover de Gabriela: execução e validação

**Fechado em 28/09/2026.** Preparação iniciada em 22/09. Suporte removido, leitura antiga negada, Financeiro concedido com leitura permitida e criação negada. Cadastro/grupos finais conferidos no AD e Entra; seis verificações da comparação final conformes.

**Leitura rápida:** [matriz de acesso no fundamento do ticket](../../../00-operacao-itsm/05-fila-tickets.md#iam-002-regra-acesso) · [execução e fechamento](#execução-e-fechamento--2809) · [comparação final](23-comparacao-final.md) · [mudança de OU e reteste](#complemento--movimentação-de-ou-em-2809). O estado anterior e a preparação estão preservados abaixo.

## Preparação histórica — 22 e 23/09

Modelo inicial observado: `gabriela.santos → GG_SUP_TICKET → DL_SUP_TICKET_READ → SuporteLab`. Recurso fictício, sem integração com sistema de chamados.

| Prova | O que comprova |
|---|---|
| [01 — Cadastro AD](01-gabriela-estado-inicial-ad.png) | EMP0007, Analista de Suporte, OU Suporte, Enabled=True e pwdLastSet=0 no estado anterior ao ajuste. |
| [02 — Grupo global](02-grupo-global-suporte.png) | GG_SUP_TICKET, Global/Security, com Gabriela. |
| [03 — Associação GG/DL](03-associacao-gg-dl.png) | Gabriela no GG e GG na DL, às 11:26:08. |
| [04 — NTFS e SMB](04-acl-ntfs-e-compartilhamento.png) | DL com ReadAndExecute/Synchronize no NTFS e Read no compartilhamento, às 11:35:49. SYSTEM/Administrators com FullControl. |
| [05 — Ajuste no laboratório](05-ajuste-troca-obrigatoria-senha.png) | Tela com troca obrigatória desmarcada; alteração informada pelo operador. |
| [06 — Leitura permitida](06-conexao-gabriela-leitura-permitida.png) | Lista inicial de conexões vazia, conexão como Gabriela e leitura do arquivo às 11:57:15. |
| [07 — Criação negada](07-criacao-arquivo-negada.png) | New-Item retorna PermissionDenied/UnauthorizedAccessException às 11:58:50. |

Horários visíveis de 22/09, UTC−03:00. As capturas 02 e 05 não mostram horário interno. Originais renomeados, sem edição de imagem; hashes e correspondência de nomes preservados na área privada.

### Limites da preparação de Suporte

- Caminho físico informado no atendimento: `C:\IAM-Lab\Chamados-Suporte`; acesso testado: `\\192.168.21.10\SuporteLab\chamado-teste.txt`. A captura de ACL usa uma variável e não mostra seu valor nem o mapeamento Name/Path do compartilhamento.
- A negação foi observada pela rede, com SMB e NTFS combinados. Não isola qual camada recusou a operação. Alteração de arquivo existente e exclusão não foram testadas.
- A tela de ajuste de senha não comprova salvamento nem troca pelo usuário. A autenticação posterior funcionou. A opção Unlock account aparece marcada, sem prova separada do estado de bloqueio anterior.
- Herança configurada para arquivos/subpastas não equivale a uma auditoria individual de todos os filhos. Desconexão final não foi capturada.
- Os grupos do Entra e do AD são independentes neste laboratório. A referência cloud de Gabriela aparece nas [provas 09–11](09-11-referencias-antes-mover.md), sem alegar acesso a aplicação.

## Complemento de 23/09 - estado anterior preservado

[08 - Cadastro e grupos diretos no AD](08-gabriela-ad-grupos-diretos-2026-09-23.png): horário visível 23/09/2026, 11:19:12 UTC-03:00. A consulta mostra EMP0007, Enabled=True, departamento Suporte, cargo Analista de Suporte e ObjectGUID. A consulta MemberOf apresenta GG_SUP_TICKET (Global/Security).

MemberOf não inclui o grupo primário nem expande associações aninhadas. A captura comprova cadastro e grupos diretos retornados, não todos os acessos efetivos; não mostra uma nova consulta GG/DL. A cadeia documentada em 22/09 permanece histórica. Nenhum Mover foi executado nesta coleta.

## Preparação preservada — 23 a 28/09

[09–11 — Referência de Gabriela no Entra e duas comparações anteriores](09-11-referencias-antes-mover.md): associação a Suporte consultada separadamente; habilitação e departamento conformes nas duas comparações. O guia mostra somente o resultado EMP0007 e identifica os CSVs compartilhados na origem, sem misturar as ações do Leaver de Carla.

Na preparação de 28/09, o roteiro definido foi: retirar acesso de Suporte, renovar a conexão e provar leitura negada. Conceder o grupo financeiro, validar leitura e conferir ausência de acesso acumulado. Atualizar e conferir separadamente o Entra, mantendo EMP0007 e as contas existentes.

**Atualização em 28/09:** evento de RH preparado, com vigência em 28/09/2026. O [recorte da nova fonte](12-fonte-rh-mover-2026-09-28.csv) registra Gabriela como Analista Financeiro, Financeiro, gestor Carlos Lima. A versão integral privada em `280926/hr_authoritative_source.csv` preserva os nove registros da fonte de 23/09, alterando somente esses três campos de EMP0007. Matrícula, admissão e status ATIVO permanecem. Estado anterior e decisão simulada documentados; execução comprovada nas evidências 15–23 abaixo. Esta fonte define o esperado, não prova mudança nos diretórios.

## RH e regra de acesso financeiro

O [RH de 28/09 — prova 12](12-fonte-rh-mover-2026-09-28.csv) informa a mudança. A matriz consolidada de 29/09 e a tabela de aplicação ao perfil de Gabriela estão em [Aprovação e fundamento → Matriz de acesso — referência do Mover](../../../00-operacao-itsm/05-fila-tickets.md#iam-002-regra-acesso). Essa referência define o esperado; as provas abaixo mostram o observado.

## Estado anterior coletado em 28/09

- [13 — AD, às 11:01:02 UTC−03:00](13-gabriela-ad-antes-mover-2026-09-28.png): ObjectGUID `cc17f00e-178a-47be-91be-dab949512b83`, EMP0007, Enabled=True, Suporte e Analista de Suporte. MemberOf mostra GG_SUP_TICKET; consulta desse grupo retorna Gabriela. GG_FIN_READ retorna somente Felipe. Não é teste de acesso ao recurso.
- [14 — Entra, relógio da estação às 11:08 de 28/09](14-gabriela-entra-antes-mover-2026-09-28.png): Object ID `2d5bee1a-e26c-47ef-bea2-a55a2fd8614d`, EMP0007, Member, Account enabled=Yes, Analista de Suporte, departamento Suporte e On-premises sync enabled=No. A captura não mostra grupos; os campos com data 22/09 referem-se ao cadastro/sessões/senha, não ao horário desta coleta.

Decisão registrada no ticket com **horário fictício de 10:53 UTC−03:00**, 15 minutos antes do relógio da captura 14. Não representa um evento real de aprovação auditada. Reversão prevista: retirar o novo grupo, restaurar cadastro/grupo anterior e retestar, se autorizada.

Originais movidos de Downloads para a área privada de 28/09; cópias sem edição neste diretório. Nomes de origem e hashes SHA-256 preservados no manifesto privado.

[Ticket e critérios de fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-002).

## Execução e fechamento — 28/09

### AD — retirar Suporte, conceder Financeiro e testar

| Prova | Resultado e horário de Brasília |
|---|---|
| [15 — Remoção no AD](15-ad-remocao-suporte.png) | 11:33:46: GabrielaPresente=False, GG_SUP_TICKET com zero membros no AD. |
| [16 — Suporte negado](16-suporte-leitura-negada.png) | 11:36:50: conexão como Gabriela aceita, leitura do chamado negada. /delete retornou 2250: não comprova desconexão anterior bem-sucedida. |
| [17 — Estado AD final](17-ad-cadastro-grupos-finais.png) | 11:42:55: identidade preservada, Financeiro/Analista Financeiro, Suporte=False e Financeiro=True. |
| [18 — Leitura financeira](18-financeiro-leitura-permitida.png) | 11:52:39: lista net use inicialmente vazia, conexão explícita como Gabriela e conteúdo lido. |
| [19 — Criação negada](19-financeiro-criacao-negada.png) | 11:54:34: criação no compartilhamento financeiro retorna acesso negado. |

### Entra — atualizar a conta independente e comparar novamente

| Prova | Resultado e horário de Brasília |
|---|---|
| [20 — Perfil Entra](20-entra-cadastro-final.png) | Relógio 12:00: mesma conta, EMP0007, Financeiro/Analista Financeiro e Enabled=Yes. |
| [21 — Grupos Entra](21-entra-grupos-finais.png) | Relógio 12:01: GG_FIN_READ na lista sem filtro de busca. |
| [22 — Auditoria](22-auditoria-entra-mover.md) | 11:56:12 remoção Suporte; 11:58:04 cadastro; 11:58:42 inclusão Financeiro. Todos success. |
| [23 — Comparação final](23-comparacao-final.md) | RH e exportações atuais: seis regras conformes, zero exceções no escopo. |

Os horários do AD são de Get-Date junto às consultas/testes, não auditoria da alteração. No Entra, 20–21 mostram o relógio da estação; 22 contém timestamps dos eventos. Originais dos sete prints e quatro exportações preservados na área privada de 28/09 com manifesto SHA-256; CSVs integrais e JSON não foram publicados.

Conclusão: Mover validado no escopo definido. Não houve teste de acesso a aplicação no Entra, nem verificação de todas as sessões/atribuições. A prova negativa de escrita testa criação, não alteração/exclusão. Reversão documentada, não executada.

## Complemento — movimentação de OU em 28/09

Após o inventário preparatório do IAM-010, foi decidido alinhar a localização do objeto à área Financeiro.

| Prova | Horário UTC−03:00 e resultado |
|---|---|
| [24 — Antes](24-ad-ou-suporte-antes.png) | 16:20:03: departamento Financeiro, objeto em OU Suporte, GG_FIN_READ. |
| [25 — Depois](25-ad-ou-financeiro-depois.png) | 16:23:08: objeto em OU Financeiro; mesmo ObjectGUID, EMP0007, cargo e grupo. |
| [26 — Leitura financeira](26-ou-financeiro-leitura-permitida.png) | 16:29:16: conexão explícita como Gabriela aceita e arquivo financeiro lido. |
| [27 — Criação negada](27-ou-financeiro-criacao-negada.png) | 16:31:32: criação no recurso financeiro negada. |
| [28 — Suporte negado](28-ou-financeiro-suporte-negado.png) | 16:35:30: leitura de chamado no recurso Suporte negada. |

Identidade e associação exibida preservadas, com os resultados esperados nos testes apresentados. Os prints não mostram GPOs, ACLs de delegação nem a sequência completa de encerramento das conexões; a prova 28 não repete a identidade da conexão. Não afirmar equivalência de todas as políticas/permissões ou nova autenticação em cada teste. O comando de movimentação não aparece, mas as consultas comprovam a mudança de localização. Nova exportação AD de 16:59:31 confirma a localização, o mesmo GUID e as associações, conforme [comparação posterior do IAM-010](../IAM-010/06-tratamento-validacao-ad.md).

Originais preservados com manifesto SHA-256; cópias sem edição. [Decisão e escopo](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md).
