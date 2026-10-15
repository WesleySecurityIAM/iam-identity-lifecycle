# SoD-001 — regra e método do exercício

Demonstração local refeita, com data fictícia do cenário de 29/09/2026. [Regra, conflito e duas provas de antes/depois](14-sod-resultado.md).

A regra fictícia Compras-LAB proíbe acumular **FORNECEDOR_MANTER (A)** e **ORCAMENTO_APROVAR (B)** pela mesma pessoa no mesmo escopo. Trata a concentração do cadastro de fornecedores e da aprovação de orçamento; esses direitos, sozinhos, não demonstram capacidade de executar pagamentos.

O [script atual](../../../05-automacao/SoD-001/README.md) lê regra, direitos e decisão em três arquivos públicos. Avalia somente Gabriela/EMP0007 em Compras-LAB. A+B gera conflito; a etapa Depois recria a entrada, retira A em memória e mantém B. Exporta JSON e HTML com o resultado, sem alterar diretórios ou arquivos de entrada.

SoD estática sobre dados fictícios, sem ERP ou prevenção implantada. A regra não avalia aprovação da própria transação, conluio ou efeitos entre unidades. Os direitos não derivam de GG_FIN_READ nem representam concessões reais a Gabriela.

[Índice do IAM-010](README.md).
