# IAM-009 — Acesso após remoção de grupo

**Objetivo:** comparar a leitura de Felipe (EMP0006) na conexão existente e após reconexão, depois de retirar temporariamente sua associação ao `GG_FIN_READ`. **Resultado:** Felipe ainda leu após sair do grupo; após reconexão, a leitura foi negada. Associação restaurada e leitura final permitida em **17/09/2026**.

O [ticket](../../../00-operacao-itsm/05-fila-tickets.md#iam-009) registra a aprovação simulada do exercício e a restauração prevista. A aprovação de 11:50 é um horário fictício do cenário; os horários abaixo são exibidos junto dos comandos, em UTC−03:00.

<a id="antes"></a>

## 1. Estado e teste antes da retirada

| Prova desta etapa | Horário | Resultado e propósito |
|---|---|---|
| [01 — Grupo e compartilhamento iniciais](01-grupo-e-compartilhamento-iniciais.png) | 11:51:53 | Felipe no GG_FIN_READ; RelatoriosFin e caminho conferidos. Identifica a associação e o recurso usados no teste. |
| [02 — Conexão e leitura como Felipe](02-conexao-felipe-leitura-permitida.png) | 11:55:20 | `net use` com EMPRESA\felipe.gomes aceito; conteúdo lido. Estabelece que a leitura funcionava antes da alteração. |

<a id="retirada"></a>

## 2. Retirada do grupo e comparação das conexões

| Prova desta etapa | Horário | Resultado e propósito |
|---|---|---|
| [03 — Felipe ausente do grupo](03-felipe-ausente-do-grupo.png) | 12:06:10 | FelipePresente=False e TotalMembros=0. Comprova o estado consultado após a retirada relatada. |
| [04 — Leitura com a conexão mantida](04-leitura-permitida-apos-remocao.png) | 12:07:07 | Conteúdo ainda lido após remoção; operador informa que manteve a conexão. Testa o efeito sobre o acesso existente. |
| [05 — Nova conexão e leitura negada](05-reconexao-leitura-negada.png) | 12:10:22 | Lista `net use` vazia, conexão aceita como Felipe e leitura negada. Distingue autenticar a conexão de autorizar a leitura. |

<a id="restauracao"></a>

## 3. Restauração e validação final

[06 — Grupo restaurado e leitura permitida](06-grupo-restaurado-leitura-permitida.png) mostra Felipe novamente no grupo às **12:12:19** e, após desconexão/reconexão, leitura permitida às **12:16:59**. Essa é a reversão executada para encerrar o exercício com a associação original restabelecida.

Todas as seis capturas pertencem a esta reprodução. Não é necessário abrir outro ticket para acompanhar os testes antes, durante e depois.

## O que a sequência permite concluir

O resultado distingue alteração de associação no diretório de acesso pela conexão existente. A manutenção do contexto de autorização anterior é uma explicação compatível com a sequência, sem inspeção direta de tokens. A conexão SMB aceita na prova 05 não significa autorização para ler o arquivo.

## Origem e limites

- Capturas sem edição. Ordenação pelos horários dos comandos: o arquivo original de 12:25:23 mostra o teste das 12:10:22 e foi capturado novamente pelo operador para incluir mais contexto; vem antes do arquivo de 12:17:44, que mostra a restauração.
- Na prova 05, /delete informa que a conexão não foi encontrada (2250), não que acabou de ser excluída. A lista vazia e a reconexão estão visíveis; a desconexão anterior não está.
- Get-Date registra o relógio próximo ao teste, não o instante auditado de cada operação. A remoção é sustentada pelo estado posterior e relato; não há evento de auditoria anexado.
- A identificação do token/protocolo e um inventário completo das sessões não foram coletados. Não generalizar o comportamento para toda aplicação ou sessão.
- Senhas foram solicitadas por entrada oculta; nenhum valor aparece. IP privado do laboratório mantido como contexto. Origens e SHA-256 preservados no manifesto privado.

[Ticket e aprovação simulada](../../../00-operacao-itsm/05-fila-tickets.md#iam-009).
