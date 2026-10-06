# TI — Isabela e acesso a procedimentos

Complemento da revisão de escopo do IAM-010, executado em 29/09/2026: Isabela (EMP0009) provisionada no AD e acesso de consulta concedido por GG → DL → ACL. A preparação de TI passou de planejada a implementada no AD nas verificações abaixo. Não houve provisionamento de Isabela no Entra nem sincronização híbrida nesta etapa.

**Regra esperada:** a [matriz de 29/09](../../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md) prevê consulta de procedimentos de TI, sem privilégio administrativo pelo cargo. Para acompanhar esta implementação, leia identidade → associações → configuração do recurso → testes. Todas as capturas desta página pertencem a Isabela; a decisão e a conferência coletiva ficam nos documentos próprios da recertificação.

| Evidência | Resultado observado |
|---|---|
| [01 — Cadastro](01-cadastro.png) | 16:28:36 -03:00: EMP0009 habilitada, TI, Analista de Sistemas, OU TI. ObjectGUID f0136911-ed5a-42e5-842b-c50ad7870161. |
| [02 — Associações](02-associacoes.png) | Isabela no GG_TI_READ; GG membro de DL_TI_PROCEDIMENTOS_READ. |
| [03 — Configuração](03-acl-ntfs-smb.png) | 16:38:51: ProcedimentosTI aponta para C:\IAM-Lab\Procedimentos-TI; DL com NTFS ReadAndExecute e SMB Read. |
| [04 — Conexão e leitura](04-conexao-leitura.png) | net use sem conexões listadas, conexão bem-sucedida como EMPRESA\isabela.ferreira e leitura permitida às 16:42:15. Substitui a captura recortada anterior de leitura. |
| [05 — Criação negada](05-criacao-negada.png) | 16:44:11: tentativa de criar teste-escrita-isabela.txt negada. |
| [06 — Identificação SMB](06-identificacao-smb.png) | 16:54:53: compartilhamento ProcedimentosTI, Credential EMPRESA\isabela.ferreira; UserName EMPRESA\Administrator. |

Os horários são os exibidos nos comandos, fuso -03:00. A nova captura de leitura preserva o contexto anterior ao teste; o horário de criação do PNG não substitui o horário da operação.

UserName representa o contexto de logon associado à conexão no cliente, enquanto Credential identifica a credencial usada para conectar ao servidor. O cliente pode usar credencial de rede diferente do logon. Neste caso, net use e Credential identificam Isabela; não se infere que a operação remota usou privilégios administrativos apenas porque UserName mostra Administrator. [Microsoft: Get-SmbConnection](https://learn.microsoft.com/en-us/powershell/module/smbshare/get-smbconnection).

Limites: a negativa de criação não isola NTFS de SMB, pois ambos restringem a leitura. Não foram demonstrados testes de edição/exclusão nem inventário completo nestas seis capturas. A conferência posterior da conexão complementa a sequência, não é registro de autenticação do servidor para cada operação. A [coleta final AD e sua comparação](../17-conferencia-final-ad.md) foram concluídas depois, em documento próprio. O microcaso SoD é independente desta validação.

[Voltar ao índice por assunto do IAM-010](../README.md).
