# IAM-004 — Prazo de acesso de Diego

[01 — Expiração configurada](01-expiracao-configurada.png): captura de 28/09/2026, com Get-Date às 17:11:26 UTC−03:00 e fuso da VM E. South America Standard Time. Consulta de diego.rocha, EMP0004, mostra Enabled=True e AccountExpirationDate=29/09/2026 08:00:00.

Resultado: configuração do prazo comprovada. A captura não comprova o efeito da expiração, uma tentativa de autenticação após a vigência ou o encerramento no Entra.

[Ticket IAM-004 e pendências](../../../00-operacao-itsm/05-fila-tickets.md#iam-004). Original preservado em área privada; cópia sem edição e hash verificado.
