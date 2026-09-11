# Redefinição de senha delegada por OU

Validação realizada em 11/09/2026 no laboratório `empresa.lab`, em `DC01.empresa.lab`. Horários exibidos pelo relógio da VM, no contexto de Brasília (UTC−03:00).

## Objetivo e contexto

Verificar se `EMPRESA\adm.wesley` consegue redefinir uma senha em Suporte e recebe acesso negado em Terceiros. A configuração informada pelo operador usa o grupo `GG_AD_SUP_RESET` para delegação na OU Suporte. As três capturas comprovam os resultados nos objetos testados; não contêm exportação da ACL nem da associação ao grupo.

A janela está aberta na sessão administrativa, mas cada `Set-ADAccountPassword` fornece explicitamente `-Credential $credDelegada`, com a identidade `EMPRESA\adm.wesley`. A conta da sessão é usada na leitura de verificação; o reset usa a credencial delegada.

## Procedimento e resultados

1. Consultar as duas contas com `Get-ADUser` e preservar `pwdLastSet` em `$antes` antes de qualquer reset da rodada.
2. Obter a senha da conta executora e uma nova senha de teste por entrada protegida (`Read-Host -AsSecureString`), sem registrar seus valores.
3. Executar `Set-ADAccountPassword -Reset` com servidor e credencial explícitos para cada conta; usar `-ErrorAction Stop` para capturar a falha real.
4. Consultar novamente no mesmo DC e comparar `pwdLastSet` com a leitura anterior.

| Hora | Conta / operação | Resultado | Evidência |
|---|---|---|---|
| 15:23:23 | `teste.reset.suporte` — reset | Permitido | [01 — Suporte](01-reset-suporte-permitido.png) |
| 15:25:45 | `teste.reset.terceiro` — reset | `Access is denied` | [02 — Terceiros](02-reset-terceiros-negado.png) |
| 15:27:19 | Comparação antes/depois | SenhaAlterada: Suporte=True; Terceiros=False. Habilitada=False nas duas contas. | [03 — Validação](03-validacao-antes-depois.png) |

Os horários são leituras exibidas antes dos blocos, não timestamps exatos de eventos do AD. Esta é uma nova rodada de validação, posterior à resolução da exigência de troca de senha da conta executora. Os erros de credencial anteriores não são tratados como prova de negação por ACL.

## Conclusão e limites

Redefinição permitida em Suporte e bloqueada no objeto testado em Terceiros, com alteração de senha confirmada somente em Suporte. As contas temporárias estavam desabilitadas; redefinir sua senha não as habilitou.

Não foram testados login interativo, acesso a pastas, todas as OUs ou a opção de forçar troca de senha no próximo acesso. O terceiro print apresenta a comparação calculada em memória; a captura da coleta inicial e os eventos de auditoria do reset não integram este conjunto. A remoção posterior das contas temporárias foi orientada, mas ainda não foi confirmada por evidência.

As capturas foram copiadas sem edição. Nenhum valor de senha integra esta publicação.
