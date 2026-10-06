# IAM-004 — Prazo e encerramento de Diego

**Objetivo:** encerrar o acesso de Diego (EMP0004) pelo término do vínculo fictício em **29/09/2026 às 08:00 UTC−03:00**. **Fechado em 29/09:** expiração e nova autenticação recusada no AD, bloqueio/revogação no Entra, contadores de concessões zero e comparação cadastral conforme.

[Ticket: prazo, decisão simulada e fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-004).

Leia na ordem: **prazo decidido e configurado → efeito no AD → tratamento no Entra → estado final e comparação**. AD e Entra eram independentes; a expiração local não executou o bloqueio cloud.

<a id="prazo-e-regra"></a>

## 1. Prazo e regra — por que encerrar

O ticket registra a decisão didática do prazo por Wesley, Fernanda Souza como responsável de negócio fictícia e a atualização do RH. Em 28/09, Diego ainda estava ATIVO; após a vigência de 29/09, o RH passa a DESLIGADO. A admissão de 01/06/2026 é preservada. O horário exato do término vem do ticket, não do campo de data do RH.

[01 — Expiração configurada](01-expiracao-configurada.png): consulta de 28/09 às 17:11:26 UTC−03:00 mostra EMP0004, Enabled=True e AccountExpirationDate=29/09/2026 08:00:00. É prova da configuração antes do vencimento, não da recusa de uma autenticação.

<a id="validacao-ad"></a>

## 2. Validação AD — o prazo produziu o efeito esperado

| Prova | Resultado em 29/09, UTC−03:00 | O que permite concluir |
|---|---|---|
| [02 — Prazo vencido](02-ad-prazo-vencido.png) | Às 11:08:10, mesmo prazo e Enabled=True; fuso da VM conferido | O atributo de habilitação continua True; a expiração é um controle distinto. |
| [03 — Nova autenticação](03-ad-autenticacao-conta-expirada.png) | Às 11:16:33, `runas` como EMPRESA\diego.rocha retorna 1793: The user's account has expired | A nova tentativa foi recusada por conta expirada. Não é uma simples negação de permissão em arquivo. |

A captura de `runas` não documenta eventual redefinição prévia de senha. Sessões já existentes não foram encerradas ou verificadas por esse teste.

<a id="execucao-entra"></a>

## 3. Execução Entra — bloquear e revogar separadamente

[06 — Extrato de auditoria somente de Diego](06-audit-encerramento-extrato.json) registra duas ações bem-sucedidas: **bloqueio às 11:19:45** e **revogação às 11:19:56**, em 29/09, UTC−03:00. O JSON preserva UTC. Os pares Disable account/Update user e Update StsRefreshTokenValidFrom Timestamp/Update user descrevem duas ações, não quatro intervenções independentes.

| Prova de estado | O que mostra | Limite |
|---|---|---|
| [04 — Perfil e validade das sessões](04-entra-bloqueio-vigencia-sessoes.png) | EMP0004, Account enabled=No, On-premises sync enabled=No e sessões válidas a partir de 11:19 | A alteração do marco de validade é complementada pelos eventos da prova 06; não demonstra corte instantâneo de todo acesso em aplicativos. |
| [05 — Identidade bloqueada](05-entra-identidade-bloqueada.png) | Mesmo Object ID e Account status Disabled | Os links View não demonstram listas vazias. Essa dúvida é resolvida pela captura 08. |

<a id="validacao-final"></a>

## 4. Conferência final — cadastro e concessões

| Prova | Verificação | Resultado |
|---|---|---|
| [07 — Comparação posterior](07-comparacao-final.md) | RH DESLIGADO × CSV de usuários do Entra de 29/09 | Matrícula única EMP0004, mesmo Object ID, accountEnabled=False; conforme. |
| [08 — Contadores finais no portal](08-entra-zero-concessoes.png) | Captura de 29/09 às 11:58: estado e resumo de associações da mesma conta | Disabled e zero em Group memberships, Applications, Assigned roles e Assigned licenses. |

Não houve remoção de vínculos inexistentes. O CSV de usuários comprova cadastro; os contadores são uma verificação separada. Nenhum dos dois representa auditoria de permissões internas de todo aplicativo ou de todos os tokens.

## Limites, assunto relacionado e preservação

- O motivo do encerramento é o término do vínculo. A cobertura do departamento TI na matriz foi revisada no IAM-010 e não é condição nem justificativa para expirar Diego.
- Employee type não integrou os controles deste encerramento e não foi alterado. User type=Member não define tipo de contrato.
- O AD permaneceu com Enabled=True e conta expirada; o Entra foi desabilitado. São estados documentados de dois sistemas independentes.
- Capturas, JSON e CSV de origem foram preservados em área privada; as provas públicas não contêm senha ou token. Esta reorganização preserva arquivos de prova e datas históricas.
