# TI — Isabela e acesso a procedimentos

Em 29/09/2026, Isabela (EMP0009) foi provisionada no AD com leitura de procedimentos por GG → DL → ACL, conforme a [matriz de 29/09](../../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md), sem privilégio administrativo pelo cargo. Sem provisionamento no Entra ou sincronização híbrida nesta etapa.

| Evidência | Resultado observado |
|---|---|
| [01 — Cadastro](01-cadastro.png) | 16:28:36 -03:00: EMP0009 habilitada, TI, Analista de Sistemas, OU TI. ObjectGUID f0136911-ed5a-42e5-842b-c50ad7870161. |
| [02 — Associações](02-associacoes.png) | Isabela no GG_TI_READ; GG membro de DL_TI_PROCEDIMENTOS_READ. |
| [03 — Configuração](03-acl-ntfs-smb.png) | 16:38:51: ProcedimentosTI aponta para C:\IAM-Lab\Procedimentos-TI; DL com NTFS ReadAndExecute e SMB Read. |
| [04 — Conexão e leitura](04-conexao-leitura.png) | net use sem conexões listadas, conexão bem-sucedida como EMPRESA\isabela.ferreira e leitura permitida às 16:42:15. |
| [05 — Criação negada](05-criacao-negada.png) | 16:44:11: tentativa de criar teste-escrita-isabela.txt negada. |
| [06 — Identificação SMB](06-identificacao-smb.png) | 16:54:53: compartilhamento ProcedimentosTI, Credential EMPRESA\isabela.ferreira; UserName EMPRESA\Administrator. |

Horários exibidos nos comandos, fuso UTC−03:00.

Na prova 06, UserName mostra o logon do cliente; Credential e net use identificam Isabela como credencial da conexão ao servidor. Administrator em UserName não comprova uso de privilégio administrativo remoto. [Referência: Get-SmbConnection](https://learn.microsoft.com/en-us/powershell/module/smbshare/get-smbconnection).

Limites: criação negada sem isolar NTFS de SMB; edição/exclusão não testadas. A identificação posterior da conexão não é um log do servidor de cada operação. Inventário posterior: [coleta final AD e comparação](../17-conferencia-final-ad.md).

[Voltar ao índice por assunto do IAM-010](../README.md).
