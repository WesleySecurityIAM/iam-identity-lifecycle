# IAM-009 — Acesso após remoção de grupo

**Objetivo:** comparar leitura na conexão existente e após reconexão. **Resultado:** Felipe ainda leu após sair do grupo; após reconexão, a leitura foi negada. Associação restaurada e leitura final permitida.

| Prova | Horário exibido em 17/09/2026 (UTC−03:00) | Resultado |
|---|---|---|
| [01 — Estado inicial](01-grupo-e-compartilhamento-iniciais.png) | 11:51:53 | Felipe no GG_FIN_READ; compartilhamento RelatoriosFin e caminho conferidos. |
| [02 — Leitura inicial](02-conexao-felipe-leitura-permitida.png) | 11:55:20 | net use com EMPRESA\felipe.gomes aceito; conteúdo lido. |
| [03 — Ausência no grupo](03-felipe-ausente-do-grupo.png) | 12:06:10 | FelipePresente=False e TotalMembros=0. |
| [04 — Conexão mantida](04-leitura-permitida-apos-remocao.png) | 12:07:07 | Conteúdo lido após remoção; operador informa que manteve a conexão. |
| [05 — Reconexão e negação](05-reconexao-leitura-negada.png) | 12:10:22 | Lista net use vazia, conexão aceita como Felipe e leitura negada. |
| [06 — Restauração](06-grupo-restaurado-leitura-permitida.png) | 12:12:19 / 12:16:59 | Felipe readicionado e listado no grupo; desconexão/reconexão e leitura permitida. |

## Interpretação

O resultado distingue alteração de associação no diretório de acesso pela conexão existente. A manutenção do contexto de autorização anterior é uma explicação compatível com a sequência, sem inspeção direta de tokens. A conexão SMB aceita na prova 05 não significa autorização para ler o arquivo.

## Origem e limites

- Capturas sem edição. Ordenação pelos horários dos comandos: o arquivo original de 12:25:23 mostra o teste das 12:10:22 e foi capturado novamente pelo operador para incluir mais contexto; vem antes do arquivo de 12:17:44, que mostra a restauração.
- Na prova 05, /delete informa que a conexão não foi encontrada (2250), não que acabou de ser excluída. A lista vazia e a reconexão estão visíveis; a desconexão anterior não está.
- Get-Date registra o relógio próximo ao teste, não o instante auditado de cada operação. A remoção é sustentada pelo estado posterior e relato; não há evento de auditoria anexado.
- A identificação do token/protocolo e um inventário completo das sessões não foram coletados. Não generalizar o comportamento para toda aplicação ou sessão.
- Senhas foram solicitadas por entrada oculta; nenhum valor aparece. IP privado do laboratório mantido como contexto. Origens e SHA-256 preservados no manifesto privado.

[Ticket e aprovação simulada](../../../00-operacao-itsm/05-fila-tickets.md#iam-009).
