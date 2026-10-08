# SoD-001 — regra e método do exercício

Exercício local concluído em 29/09/2026; [capturas e resultado](14-sod-resultado.md).

A regra fictícia Compras-LAB proíbe acumular **FORNECEDOR_MANTER (A)** e **ORCAMENTO_APROVAR (B)** pela mesma pessoa no mesmo escopo. Trata a concentração do cadastro de fornecedores e da aprovação de orçamento; esses direitos, sozinhos, não demonstram capacidade de executar pagamentos.

O [script](../../../05-automacao/Invoke-SoDLab.ps1) agrupa por caso, matrícula e escopo antes de verificar A+B. Avalia cinco cenários independentes: A somente, B somente, A+B, pessoas diferentes e escopos diferentes. Cada execução recria os dados; a etapa Depois retira A do caso conflitante em memória e mantém B. Não altera diretórios ou arquivos de entrada.

SoD estática sobre dados fictícios, sem ERP ou prevenção implantada. A regra não avalia aprovação da própria transação, conluio ou efeitos entre unidades. Os direitos não derivam de GG_FIN_READ nem representam concessões reais a Gabriela.

[Índice do IAM-010](README.md).
