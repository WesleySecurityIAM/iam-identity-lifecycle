# SoD-001 — demonstração refeita com leitura focada

Mesmo cenário fictício de 29/09/2026: Gabriela não pode manter fornecedores e aprovar orçamento no mesmo escopo. Esta demonstração foi refeita para facilitar a leitura; não é uma captura original daquela data.

| Arquivo | Papel |
|---|---|
| [regra.json](regra.json) | Combinação proibida e seu contexto. |
| [acessos.csv](acessos.csv) | Direitos observados no modelo, somente de Gabriela em Compras-LAB. |
| [decisao.json](decisao.json) | Decisão simulada: manter aprovação e retirar manutenção de fornecedores. |
| [Invoke-SoDCase.ps1](Invoke-SoDCase.ps1) | Valida as entradas, detecta A+B e aplica o tratamento somente na etapa Depois, em memória. |

Na raiz do repositório, executar no PowerShell do computador; não exige VM, AD ou credenciais:

```powershell
$destino = Join-Path $env:TEMP 'IAM-010-SoD-demonstracao'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File '.\05-automacao\SoD-001\Invoke-SoDCase.ps1' -Etapa Antes -PastaSaida $destino
powershell.exe -NoProfile -ExecutionPolicy Bypass -File '.\05-automacao\SoD-001\Invoke-SoDCase.ps1' -Etapa Depois -PastaSaida $destino
```

Abrir `antes.html` e `depois.html` na pasta indicada. `ExecutionPolicy Bypass` vale somente para cada processo iniciado, sem alterar a política persistente. Cada HTML tem um JSON com os mesmos resultados: conflito antes; depois, aprovação preservada e zero conflitos. A data exibida é explicitamente fictícia; as duas imagens públicas são identificadas como demonstração refeita.

O script exige uma única pessoa/escopo, verifica campos obrigatórios, duplicidades, direitos fora da regra e compatibilidade da decisão. Entradas inválidas interrompem a execução. A etapa Depois recria o antes a partir do CSV e aplica o filtro; não há alteração persistente de permissões, API, ERP ou transferência implementada a outra pessoa. `SEM_CONFLITO` não significa acesso necessário ou aprovado.

[Caso e evidências](../../evidencias/sanitizadas/IAM-010/14-sod-resultado.md).
