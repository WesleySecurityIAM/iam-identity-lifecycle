# IAM-002 — Mover de Gabriela

**Fechado em 28/09/2026.** Gabriela (EMP0007) passou de Suporte para Financeiro: leitura antiga negada, leitura financeira permitida e criação negada no AD. Cadastro e grupos conferidos no AD e Entra; seis regras finais conformes. [Ticket](../../../00-operacao-itsm/05-fila-tickets.md#iam-002).

<a id="preparacao-suporte"></a>
<a id="preparação-histórica--22-e-2309"></a>

## 1. Preparação do acesso de Suporte — 22/09/2026

Cadeia observada: `gabriela.santos → GG_SUP_TICKET → DL_SUP_TICKET_READ → SuporteLab`, recurso fictício. Horários abaixo em UTC−03:00.

| Prova | O que demonstra |
|---|---|
| [01 — Cadastro AD](01-gabriela-estado-inicial-ad.png) | EMP0007, Analista de Suporte, OU Suporte, Enabled=True e pwdLastSet=0. |
| [02 — Grupo global](02-grupo-global-suporte.png) | GG_SUP_TICKET, Global/Security, com Gabriela. |
| [03 — Associação GG/DL](03-associacao-gg-dl.png) | 11:26:08: Gabriela no GG e GG na DL. |
| [04 — NTFS e SMB](04-acl-ntfs-e-compartilhamento.png) | 11:35:49: DL com ReadAndExecute/Synchronize no NTFS e Read no compartilhamento; SYSTEM/Administrators com FullControl. |
| [05 — Ajuste de senha](05-ajuste-troca-obrigatoria-senha.png) | Troca obrigatória desmarcada na tela; alteração informada pelo operador. |
| [06 — Leitura permitida](06-conexao-gabriela-leitura-permitida.png) | 11:57:15: conexões inicialmente vazias, conexão como Gabriela e arquivo lido. |
| [07 — Criação negada](07-criacao-arquivo-negada.png) | 11:58:50: New-Item retorna PermissionDenied/UnauthorizedAccessException. |

<a id="conferencias-anteriores"></a>

## 2. Conferências ainda em Suporte — 23/09/2026

| Prova | O que demonstra |
|---|---|
| [08 — Cadastro e grupos diretos AD](08-gabriela-ad-grupos-diretos-2026-09-23.png) | 11:19:12: EMP0007, Enabled=True, Suporte/Analista de Suporte, ObjectGUID e GG_SUP_TICKET em MemberOf. |
| [09–11 — Entra e comparações anteriores](09-11-referencias-antes-mover.md) | GG_SUP_TICKET na captura; habilitação e departamento conformes nos CSVs de 22 e 23/09. |

<a id="mudanca-e-estado-anterior"></a>

## 3. Mudança de RH e estado anterior — 28/09/2026

| Prova | O que demonstra |
|---|---|
| [12 — RH vigente em 28/09](12-fonte-rh-mover-2026-09-28.csv) | Gabriela: Analista Financeiro, Financeiro, gestor Carlos Lima; EMP0007, admissão e status ATIVO preservados. |
| [13 — Antes no AD](13-gabriela-ad-antes-mover-2026-09-28.png) | 11:01:02: GUID cc17f00e-178a-47be-91be-dab949512b83, EMP0007, Enabled=True, Suporte/Analista de Suporte. Gabriela em GG_SUP_TICKET; GG_FIN_READ retorna somente Felipe. |
| [14 — Antes no Entra](14-gabriela-entra-antes-mover-2026-09-28.png) | Relógio 11:08: Object ID 2d5bee1a-e26c-47ef-bea2-a55a2fd8614d, EMP0007, Member, Enabled=Yes, Suporte/Analista de Suporte, sincronização local=No. Não mostra grupos. |

Regra: retirar GG_SUP_TICKET e conceder GG_FIN_READ; [fundamento e matriz consolidada de 29/09](../../../00-operacao-itsm/05-fila-tickets.md#iam-002-regra-acesso). Decisão simulada registrada com **horário fictício de 10:53**, sem evento real de aprovação auditada. Reversão prevista no ticket, não executada.

<a id="execução-e-fechamento--2809"></a>
<a id="execucao-ad"></a>

## 4. Alteração e testes no AD — 28/09/2026

| Prova | O que demonstra — UTC−03:00 |
|---|---|
| [15 — Remoção de Suporte](15-ad-remocao-suporte.png) | 11:33:46: GabrielaPresente=False, GG_SUP_TICKET sem membros no AD. |
| [16 — Suporte negado](16-suporte-leitura-negada.png) | 11:36:50: conexão como Gabriela aceita, leitura negada. `/delete` retornou 2250, sem confirmar desconexão anterior. |
| [17 — Cadastro e grupos finais](17-ad-cadastro-grupos-finais.png) | 11:42:55: mesma identidade, Financeiro/Analista Financeiro, Suporte=False e Financeiro=True. |
| [18 — Leitura financeira](18-financeiro-leitura-permitida.png) | 11:52:39: net use inicialmente vazio, conexão como Gabriela e conteúdo lido. |
| [19 — Criação negada](19-financeiro-criacao-negada.png) | 11:54:34: criação no compartilhamento financeiro negada. |

<a id="execucao-entra"></a>

## 5. Alteração e conferência no Entra — 28/09/2026

| Prova | O que demonstra — UTC−03:00 |
|---|---|
| [22 — Auditoria](22-auditoria-entra-mover.md) | 11:56:12: remoção de Suporte; 11:58:04: cadastro; 11:58:42: inclusão em Financeiro. Todos success. |
| [20 — Perfil final](20-entra-cadastro-final.png) | Relógio 12:00: mesma conta, EMP0007, Financeiro/Analista Financeiro e Enabled=Yes. |
| [21 — Grupos finais](21-entra-grupos-finais.png) | Relógio 12:01: GG_FIN_READ na lista sem filtro. |
| [23 — Comparação final](23-comparacao-final.md) | RH e exportações de 28/09: seis regras conformes, zero exceções no escopo. |

<a id="complemento-ou"></a>
<a id="complemento--movimentação-de-ou-em-2809"></a>

## 6. Complemento de OU e retestes — 28/09/2026, à tarde

| Prova | O que demonstra — UTC−03:00 |
|---|---|
| [24 — Antes](24-ad-ou-suporte-antes.png) | 16:20:03: departamento Financeiro, objeto em OU Suporte, GG_FIN_READ. |
| [25 — Depois](25-ad-ou-financeiro-depois.png) | 16:23:08: OU Financeiro; mesmo GUID, EMP0007, cargo e grupo. |
| [26 — Leitura financeira](26-ou-financeiro-leitura-permitida.png) | 16:29:16: conexão como Gabriela aceita e arquivo lido. |
| [27 — Criação negada](27-ou-financeiro-criacao-negada.png) | 16:31:32: criação no recurso financeiro negada. |
| [28 — Suporte negado](28-ou-financeiro-suporte-negado.png) | 16:35:30: leitura do chamado negada. |

## Limites e origem

- AD e Entra independentes. No Entra foram verificados cadastro e grupos, sem teste de aplicação ou de todas as sessões/atribuições. MemberOf não expande grupos aninhados nem inclui o grupo primário.
- Testes de escrita verificam criação, sem alteração/exclusão. Pela rede, SMB e NTFS atuam juntos; as capturas não isolam a camada da recusa nem auditam todos os arquivos filhos.
- Em 22/09, caminho físico informado: `C:\IAM-Lab\Chamados-Suporte`; teste: `\\192.168.21.10\SuporteLab\chamado-teste.txt`. A prova 04 não mostra o valor da variável de caminho nem o mapeamento SMB. A prova 05 não confirma salvamento, troca de senha ou bloqueio anterior; a autenticação posterior funcionou.
- Provas 02 e 05 sem horário interno. No AD, horários vêm de Get-Date junto às consultas/testes; no Entra, 14 e 20–21 usam o relógio da estação, e 22 usa timestamps dos eventos. As datas 22/09 exibidas em campos da prova 14 não datam a coleta.
- A movimentação de OU é demonstrada pelas consultas antes/depois, sem captura do comando. Não foram verificadas GPOs ou ACLs de delegação. A sequência completa de encerramento de conexões não foi capturada; 28 não repete a identidade da conexão.
- Originais, nomes de origem e hashes preservados na área privada; imagens sem edição. RH integral: `280926/hr_authoritative_source.csv`.

<details>
<summary>Origem complementar da conferência de OU</summary>

A exportação AD de 16:59:31 confirma OU, GUID e associações de EMP0007: [comparação coletiva — consultar somente a linha de localização de Gabriela](../IAM-010/06b-comparacao-coletiva-ad.md). [Decisão e escopo](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md).

</details>
