# IAM-002 — Preparação do Mover de Gabriela

**Em andamento — 22/09/2026.** Estado inicial de Suporte comprovado: leitura permitida e criação de arquivo negada. A mudança para Financeiro ainda não foi executada.

Modelo observado: `gabriela.santos → GG_SUP_TICKET → DL_SUP_TICKET_READ → SuporteLab`. Recurso fictício, sem integração com sistema de chamados.

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

## Escopo da prova

- Caminho físico informado no atendimento: `C:\IAM-Lab\Chamados-Suporte`; acesso testado: `\\192.168.21.10\SuporteLab\chamado-teste.txt`. A captura de ACL usa uma variável e não mostra seu valor nem o mapeamento Name/Path do compartilhamento.
- A negação foi observada pela rede, com SMB e NTFS combinados. Não isola qual camada recusou a operação. Alteração de arquivo existente e exclusão não foram testadas.
- A tela de ajuste de senha não comprova salvamento nem troca pelo usuário. A autenticação posterior funcionou. A opção Unlock account aparece marcada, sem prova separada do estado de bloqueio anterior.
- Herança configurada para arquivos/subpastas não equivale a uma auditoria individual de todos os filhos. Desconexão final não foi capturada.
- Os grupos do Entra e do AD são independentes neste laboratório. [Conferências do Entra em 22/09](../inventario-entra-2026-09-22/README.md) complementam o cadastro, sem provar acesso a aplicação.

## Próxima execução

Registrar evento de RH e aprovação simulada da mudança, retirar acesso de Suporte, renovar a conexão e provar leitura negada. Conceder o grupo financeiro, validar leitura e conferir ausência de acesso acumulado. Atualizar e conferir separadamente o Entra, mantendo EMP0007 e as contas existentes.

[Ticket e critérios de fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-002).
