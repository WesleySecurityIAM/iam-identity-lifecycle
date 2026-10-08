# Bruno — concessão e testes de leitura de Suporte em 28/09/2026

Bruno (EMP0002) passou a integrar GG_SUP_TICKET, com leitura permitida e criação negada em SuporteLab, conforme a [regra definida nesta revisão](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md).

## Evidências

| Prova | Horário UTC−03:00 e resultado |
|---|---|
| [02 — Antes](02-bruno-grupo-ausente.png) | 16:41:36: EMP0002 habilitado em Suporte; BrunoPresente=False e zero membros no grupo. |
| [03 — Depois](03-bruno-grupo-presente.png) | 16:42:48: Bruno listado em GG_SUP_TICKET. A captura não mostra o comando de inclusão. |
| [04 — Leitura](04-bruno-leitura-permitida.png) | 16:55:18: net use inicialmente sem entradas, conexão explícita como EMPRESA\bruno.costa concluída e conteúdo de chamado-teste.txt exibido. |
| [05 — Criação negada](05-bruno-criacao-negada.png) | 16:57:45: New-Item no compartilhamento SuporteLab retorna Access is denied. |

Os horários são os exibidos junto aos comandos. A negativa de criação não isola SMB de NTFS nem testa edição/exclusão. As capturas não demonstram reset de senha.

A coleta posterior, às 16:59:31, está na [comparação coletiva 06b](06b-comparacao-coletiva-ad.md).

[Voltar ao índice por assunto](README.md).
