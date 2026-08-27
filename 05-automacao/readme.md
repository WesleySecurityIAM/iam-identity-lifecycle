# Reconciliação de acessos — estado esperado versus estado atual

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

Em uma evolução futura, o estado esperado será obtido de uma fonte autoritativa de RH e o estado atual poderá ser consultado no Microsoft Entra por meio do Microsoft Graph.