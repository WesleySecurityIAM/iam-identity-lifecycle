# Bruno — concessão e testes de leitura de Suporte em 28/09/2026

## Resultado

Bruno passou a integrar GG_SUP_TICKET, com leitura permitida e criação negada em SuporteLab.

**Leitura desta página:** conferir ausência do grupo → conferir inclusão → conectar como Bruno e ler → tentar criar e observar negação. As quatro capturas abaixo pertencem somente a Bruno/EMP0002.

A concessão atende à [regra definida nesta revisão](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md). A análise do inventário motivou a definição da necessidade; não se alega descumprimento de aprovação histórica.

## Evidências

| Prova | Horário UTC−03:00 e resultado |
|---|---|
| [02 — Antes](02-bruno-grupo-ausente.png) | 16:41:36: EMP0002 habilitado em Suporte; BrunoPresente=False e zero membros no grupo. |
| [03 — Depois](03-bruno-grupo-presente.png) | 16:42:48: Bruno listado em GG_SUP_TICKET. A captura não mostra o comando de inclusão. |
| [04 — Leitura](04-bruno-leitura-permitida.png) | 16:55:18: net use inicialmente sem entradas, conexão explícita como EMPRESA\bruno.costa concluída e conteúdo de chamado-teste.txt exibido. |
| [05 — Criação negada](05-bruno-criacao-negada.png) | 16:57:45: New-Item no compartilhamento SuporteLab retorna Access is denied. |

Os horários são leituras exibidas junto aos comandos, não timestamps de auditoria da inclusão no grupo. A criação negada não testa todas as operações de escrita. Foi orientado reset administrativo de senha por indisponibilidade da credencial anterior; as provas recebidas não demonstram o reset, portanto ele não é apresentado como ação comprovada. Nenhuma credencial integra as evidências.

## Limites e continuação

O teste negativo comprova criação negada pela rede, sem isolar SMB de NTFS nem testar edição/exclusão. A inclusão é sustentada pela consulta posterior; o comando de alteração não está na captura.

Depois dos testes foi coletado um novo inventário às 16:59:31. A [comparação coletiva 06b](06b-comparacao-coletiva-ad.md) documenta separadamente as mudanças de Bruno e da localização de Gabriela; não é outro teste de Bruno. IAM-010 ainda estava em andamento nessa data e foi fechado em 29/09 após os tratamentos e a conferência final.

[Voltar ao índice por assunto](README.md).
