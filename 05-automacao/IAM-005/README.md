# IAM-005 — Script da rotina financeira

[gerar-resumo.ps1](gerar-resumo.ps1) é a cópia fornecida pelo operador após os testes do laboratório, publicada sem alterar o código. A revisão confirmou sintaxe válida e ausência de credenciais no arquivo; não houve nova execução nesta publicação.

| Etapa | Resultado esperado |
|---|---|
| Conferir identidade | Executar como `EMPRESA\svc_relatorio_fin`; outra identidade interrompe o script. |
| Ler entrada | Contar linhas de `relatorio-teste.txt`. |
| Testar escrita na entrada | Receber `PermissionDenied` ao criar um arquivo de teste com nome exclusivo. |
| Testar alteração na pasta de scripts | Receber `PermissionDenied` ao acrescentar texto a `arquivo-protegido.txt`. |
| Gravar saída | Criar/atualizar `resumo.json` com horário UTC, identidade e resultados. |

## Como reproduzir no laboratório

1. Preparar os grupos e permissões descritos no [caso e evidências](../../evidencias/sanitizadas/IAM-005/README.md).
2. Disponibilizar os arquivos nos caminhos fixos do script: entrada em `C:\IAM-Lab\Relatorios-Financeiros`, saída em `C:\IAM-Lab\Saidas-Relatorios-Financeiros` e código/arquivo de teste em `C:\IAM-Lab\Scripts-Relatorios`. Usar somente dados fictícios e um `arquivo-protegido.txt` descartável.
3. Na VM, configurar a tarefa com a conta de serviço, logon em lote e privilégios limitados. Programa: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`. Argumentos:

```text
-NoProfile -NonInteractive -File "C:\IAM-Lab\Scripts-Relatorios\gerar-resumo.ps1"
```

4. Em nova execução autorizada, habilitar conta/tarefa, executar pelo Agendador e conferir `resumo.json` e `LastTaskResult`. Ao terminar a demonstração, desabilitar conta e tarefa.

Código **0** significa que o resumo foi gravado e as duas escritas foram negadas; **1** indica uma escrita indevida permitida. Outros erros são propagados. Se uma permissão estiver excessiva, o teste poderá criar o arquivo na entrada ou acrescentar texto ao arquivo descartável; revisar esses artefatos após corrigir o acesso.

O XML da tarefa não foi exportado. O script depende do AD, das ACLs e dos direitos de logon preparados na VM; não é executável isoladamente no notebook. Os resultados históricos permanecem nas [evidências do IAM-005](../../evidencias/sanitizadas/IAM-005/README.md).
