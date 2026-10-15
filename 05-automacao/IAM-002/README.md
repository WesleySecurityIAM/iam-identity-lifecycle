# IAM-002 — Rotinas das comparações

**Código de consulta organizado em 15/10/2026 a partir das rotinas locais de 28/09.** Os originais também organizavam arquivos e escreviam relatórios. Aqui ficam somente as comparações, com parâmetros de entrada e validações, sem operações de arquivamento ou alteração nos diretórios. Os CSVs integrais permanecem privados.

| Rotina pública | Origem histórica e finalidade | Resultado documentado |
|---|---|---|
| [Compare-MoverEntra.py](Compare-MoverEntra.py) | Seis regras de `fechar-mover-2809.py`: RH × usuários Entra; grupos pela regra do Mover; identidade pelo Object ID anterior. | [Prova 23](../../evidencias/sanitizadas/IAM-002/23-comparacao-final.md): seis conformes, zero exceções. |
| [Compare-MoverOu.ps1](Compare-MoverOu.ps1) | Recorte de EMP0007 da rotina `arquivar-bruno-final.ps1`: `Import-Csv` e `Compare-Object` entre dois inventários AD; consulta do DN esperado. | [Prova 29](../../evidencias/sanitizadas/IAM-002/29-conferencia-ou-ad.md): OU Financeiro e identidade/cadastro preservados. |

O comparador Entra usa Python 3 e a biblioteca padrão `csv`. O comparador AD usa PowerShell 5.1 ou superior e dispensa o módulo ActiveDirectory porque lê exportações. **PowerShell é a ferramenta; o sistema comparado depende da origem dos dados.**

## Entradas e execução

Na raiz do repositório, com caminhos reais para os arquivos privados:

```powershell
# Pasta privada com os tres exports Entra do IAM-002 de 28/09.
$fontesEntra = 'C:\CAMINHO\IAM-002'
python .\05-automacao\IAM-002\Compare-MoverEntra.py `
  --rh .\evidencias\sanitizadas\IAM-002\12-fonte-rh-mover-2026-09-28.csv `
  --users "$fontesEntra\exportUsers_2026-9-28.csv" `
  --financeiro "$fontesEntra\exportGroupMembers_2026-9-28-GG_FIN_READ.csv" `
  --suporte "$fontesEntra\exportGroupMembers_2026-9-28-GG_SUP_TICKET.csv"

# Pasta privada da reconciliacao ampliada: coletas AD de 15:52 e 16:59.
$fontesAd = 'C:\CAMINHO\reconciliacao-ampliada'
powershell.exe -NoProfile -ExecutionPolicy Bypass `
  -File .\05-automacao\IAM-002\Compare-MoverOu.ps1 `
  -Antes "$fontesAd\usuarios-ad.csv" `
  -Depois "$fontesAd\depois-165931\usuarios-ad.csv"
```

Substituir `C:\CAMINHO` pela localização dos arquivos preservados. `-ExecutionPolicy Bypass` vale somente para esse processo PowerShell. A execução imprime o resultado; não modifica as entradas. O Python retorna código 0 para conformidade, 1 para exceção e 2 para fonte inválida. O PowerShell encerra com erro se faltarem dados ou houver divergência no recorte.

## Alcance

- As regras e os identificadores são específicos do Mover de EMP0007 em 28/09; não são uma política geral para todas as pessoas ou datas.
- A comparação Entra usa matrícula única, depois Object ID nos membros; não testa acesso a arquivo, sessão ou aplicação. A regra dos grupos vem da decisão do caso, não do CSV de RH sozinho.
- Na comparação AD, `<=` indica a linha apenas no **antes** e `=>` apenas no **depois**. São diferenças entre coletas; a conformidade depende da checagem separada de OU Financeiro. Esse significado é diferente de comparar esperado × observado.
- O recorte de OU não reexecuta a comparação coletiva de grupos do IAM-010 nem o levantamento inicial de 15:52. O achado inicial veio da análise do `DistinguishedName`; a comparação cadastral inicial não tinha uma regra automática para OU.
- Reexecutar agora sobre arquivos históricos confirma o cálculo, sem representar nova consulta ao ambiente ou novo evento em 28/09.

[Ticket IAM-002](../../00-operacao-itsm/05-fila-tickets.md#iam-002) · [Sequência das evidências](../../evidencias/sanitizadas/IAM-002/README.md).
