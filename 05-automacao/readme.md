# Reconciliação de acessos — estado esperado versus estado atual

## Scripts e escopos da v0.5

| Script | Finalidade e limite |
|---|---|
| [Invoke-IamReconciliation.ps1](Invoke-IamReconciliation.ps1) | Exercício sintético com Compare-Object; detalhado abaixo. Não consulta os diretórios. |
| [Compare-DepartmentMembership.ps1](Compare-DepartmentMembership.ps1) | Comparação histórica dos CSVs e matriz de 28/09, com três grupos departamentais. Não aplicar à matriz ampliada de TI sem adaptação. |
| [Invoke-SoDLab.ps1](Invoke-SoDLab.ps1) | Cinco cenários fictícios em memória, com detecção e tratamento de SoD; não altera AD/Entra. [Provas](../evidencias/sanitizadas/IAM-010/14-sod-resultado.md). |
| [Export-IamReviewSnapshot.ps1](Export-IamReviewSnapshot.ps1) | Consulta contas AD, grupos GG/DL, membros diretos e tarefa IAM-005; exporta CSVs, estado da tarefa e manifesto. Executar na VM com módulo AD. Não altera o diretório nem calcula conformidade. [Resultado comparado](../evidencias/sanitizadas/IAM-010/17-conferencia-final-ad.md). |

As seções seguintes descrevem somente o primeiro exercício sintético. Os inventários integrais do laboratório permanecem privados.

## Objetivo

Comparar associações atuais de contas e grupos com um estado esperado e gerar uma lista de exceções para análise.

## Dados do laboratório

Todos os dados são sintéticos. O cenário representa contas e grupos de segurança semelhantes aos encontrados em Windows Active Directory.

## Entrada

`estado-final.csv` contém o estado atual:

- `conta`: identificador fictício da conta;
- `grupos`: grupos associados, separados por `|`.

O estado esperado está definido no script para este cenário didático.

## Como a comparação funciona

O `Import-Csv` transforma cada linha da entrada em um objeto do PowerShell com as propriedades `conta` e `grupos`.

Em seguida, o script transforma cada associação na chave `conta::grupo`. Isso permite comparar a relação completa, sem analisar conta e grupo separadamente.

O `Compare-Object` recebe:

- `ReferenceObject`: estado esperado;
- `DifferenceObject`: estado atual.

Os indicadores significam:

- `==`: associação presente nos dois estados;
- `=>`: associação presente somente no estado atual;
- `<=`: associação presente somente no estado esperado.

O script traduz esses indicadores para ações compreensíveis e exporta somente as diferenças que exigem análise.

## Resultado desta execução

| Associação | Situação | Ação |
|---|---|---|
| `usr_ana.silva::GG_VPN_USERS` | Presente nos dois estados | Manter |
| `svc_iam_report::GG_FIN_READ` | Presente nos dois estados | Manter |
| `usr_ana.silva::GG_SUP_READ` | Somente no estado atual | Revisar possível remoção |
| `usr_orphan01::GG_SUP_READ` | Somente no estado atual | Revisar possível remoção |
| `usr_ana.silva::GG_FIN_READ` | Somente no estado esperado | Revisar possível concessão |

Foram avaliadas cinco associações:

- duas estavam de acordo com o esperado;
- duas existiam somente no estado atual;
- uma existia somente no estado esperado.

O script gerou três exceções. Nenhuma concessão ou revogação foi executada automaticamente.

## Saída

`excecoes.csv` contém somente as três associações que precisam de investigação:

- duas possíveis remoções;
- uma possível concessão.

## Como reproduzir

Na raiz do repositório, execute:

```powershell
powershell.exe `
    -NoProfile `
    -ExecutionPolicy Bypass `
    -File '.\05-automacao\Invoke-IamReconciliation.ps1'
```

O script lê `estado-final.csv` e recria `excecoes.csv`.

## Como saber que funcionou

A execução correta:

1. apresenta a mensagem `Relatorio criado`;
2. confirma que nenhum acesso foi alterado;
3. recria `excecoes.csv` com três registros.

A quantidade pode ser conferida com:

```powershell
Import-Csv '.\05-automacao\excecoes.csv' |
    Measure-Object
```

O resultado esperado para este cenário é `Count: 3`.

Se o arquivo de entrada estiver ausente ou ilegível, o script encerra com uma mensagem útil, apresenta o detalhe técnico e confirma que nenhum acesso foi alterado.

## Por que nada é corrigido automaticamente

A fonte de dados pode estar incorreta, incompleta ou desatualizada. Automatizar a correção poderia remover um acesso necessário ou conceder um acesso indevido em escala.

Por isso, o script apenas detecta e reporta diferenças. Toda concessão ou revogação exige validação da fonte, aprovação do responsável e registro em ticket.

## Limitações

Este é um laboratório introdutório. O estado esperado está definido no script e não existe integração com RH, Active Directory, Microsoft Entra ou plataforma ITSM.

Em outros casos do portfólio, já existem comparações com fonte de RH e exportações reais do laboratório: [Leaver de Carla](../evidencias/sanitizadas/IAM-003/08-validacao-final.md) e [Mover de Gabriela](../evidencias/sanitizadas/IAM-002/23-comparacao-final.md). Elas não são resultados deste script sintético.

A evolução de 28/09 está no [comparador de população e grupos departamentais](Compare-DepartmentMembership.ps1), usado com exportações do laboratório no [IAM-010](../evidencias/sanitizadas/IAM-010/07-comparacao-populacao-grupos.md). Ele possui regras explícitas desta revisão, valida chaves e referências e sinaliza fontes incompletas; não calcula habilitação, expiração ou todos os acessos. É independente do exemplo sintético acima. Consulta direta por Microsoft Graph permanece uma etapa futura.
