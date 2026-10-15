# IAM-002 — Comparações PowerShell de 28/09/2026

**Data das fontes e comparações: 28/09/2026.** As rotinas PowerShell locais verificaram cadastro, grupos e localização após o Mover. Os arquivos nesta pasta são recortes de consulta do código histórico; os originais também organizavam arquivos e relatórios. CSVs integrais e resultados preservados permanecem privados.

| Rotina pública | Origem histórica e finalidade | Resultado documentado |
|---|---|---|
| [Compare-MoverCadastro.ps1](Compare-MoverCadastro.ps1) | Recorte de `conferir-coleta-2809.ps1`: `Import-Csv`, correlação por matrícula e comparação de habilitação/departamento/cargo com o RH. | [Prova 23 — conferências PowerShell](../../evidencias/sanitizadas/IAM-002/23-comparacao-final.md#powershell): três regras de cadastro conformes por sistema para Gabriela. |
| [Compare-DepartmentMembership.ps1](../Compare-DepartmentMembership.ps1) | Comparador de população/grupos do IAM-010, com as regras de 28/09. Resolve matrícula e identificadores para comparar associações com a matriz. | EMP0007 com GG_FIN_READ e sem associação departamental excedente nos dois sistemas. O relatório integral é coletivo; o recorte de Gabriela está na prova 23. |
| [Compare-MoverOu.ps1](Compare-MoverOu.ps1) | Recorte de EMP0007 da rotina `arquivar-bruno-final.ps1`: `Import-Csv` e `Compare-Object` entre dois inventários AD; consulta do DN esperado. | [Prova 29](../../evidencias/sanitizadas/IAM-002/29-conferencia-ou-ad.md): OU Financeiro e identidade/cadastro preservados. |

Os scripts leem exportações locais; não consultam nem alteram AD/Entra. **PowerShell é a ferramenta; o sistema comparado depende da origem dos dados.** A comparação de cadastro usa igualdade por regra; a de OU usa `Compare-Object` para detectar mudanças entre coletas.

## Entradas e execução

Na raiz do repositório, com caminhos reais para os arquivos privados:

```powershell
# Pasta privada da reconciliacao ampliada de 28/09.
$fontesAd = 'C:\CAMINHO\reconciliacao-ampliada'

# Cadastro: RH versus inventario de cada sistema; somente EMP0007.
powershell.exe -NoProfile -ExecutionPolicy Bypass `
  -File .\05-automacao\IAM-002\Compare-MoverCadastro.ps1 `
  -Rh "$fontesAd\hr_authoritative_source.csv" `
  -Ad "$fontesAd\usuarios-ad.csv" `
  -Entra "$fontesAd\exportUsers_2026-9-28.csv"

# OU: antes e depois no AD; somente EMP0007.
powershell.exe -NoProfile -ExecutionPolicy Bypass `
  -File .\05-automacao\IAM-002\Compare-MoverOu.ps1 `
  -Antes "$fontesAd\usuarios-ad.csv" `
  -Depois "$fontesAd\depois-165931\usuarios-ad.csv"
```

Substituir `C:\CAMINHO` pela localização dos arquivos preservados. `-ExecutionPolicy Bypass` vale somente para esse processo PowerShell. A rotina cadastral retorna objetos com `Conforme=True/False`; falha de leitura/correlação interrompe a comparação. A rotina de OU também encerra com erro diante de localização divergente. Nenhuma delas altera as entradas.

## Alcance

- As regras e os identificadores são específicos do Mover de EMP0007 em 28/09; não são uma política geral para todas as pessoas ou datas.
- A comparação cadastral exige uma matrícula única por fonte e não compara grupos. O comparador departamental resolve membros por ObjectGUID/id e usa a regra de grupos do cenário, não o CSV de RH sozinho.
- Na comparação AD, `<=` indica a linha apenas no **antes** e `=>` apenas no **depois**. São diferenças entre coletas; a conformidade depende da checagem separada de OU Financeiro. Esse significado é diferente de comparar esperado × observado.
- O recorte de OU não reexecuta a comparação coletiva de grupos do IAM-010 nem o levantamento inicial de 15:52. O achado inicial veio da análise do `DistinguishedName`; a comparação cadastral inicial não tinha uma regra automática para OU.
- Reexecutar sobre arquivos históricos confirma o cálculo, sem representar nova consulta ao ambiente ou novo evento em 28/09.

<details>
<summary>Proveniência do processamento auxiliar do relatório 23</summary>

A tabela de seis verificações **do Entra** na prova 23 foi consolidada durante a organização das evidências pela rotina local `fechar-mover-2809.py`. O [recorte auxiliar em Python](Compare-MoverEntra.py) permite reproduzir esse cálculo. Ele não é o script PowerShell executado pelo operador, nem suas seis linhas equivalem às três regras cadastrais por sistema acima. É necessário preservar essa distinção de origem; a revisão da prática PowerShell usa as rotinas da tabela principal.

</details>

[Ticket IAM-002](../../00-operacao-itsm/05-fila-tickets.md#iam-002) · [Sequência das evidências](../../evidencias/sanitizadas/IAM-002/README.md).
