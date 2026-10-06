# SoD-001 — roteiro do exercício concluído

Estado: exercício concluído pelo operador em 29/09/2026; [resultado e capturas antes/depois](14-sod-resultado.md). O roteiro abaixo permanece como referência de execução. Não é evidência de direitos financeiros reais concedidos a Gabriela.

## Propósito

Demonstrar que duas permissões compatíveis com atividades diferentes podem formar um conflito quando acumuladas pela mesma pessoa no mesmo processo. A regra fictícia Compras-LAB proíbe manter fornecedores e aprovar orçamento simultaneamente.

O risco tratado é concentrar manutenção de cadastro de fornecedores e aprovação de orçamento, reduzindo a independência da revisão no processo fictício. Não se afirma que esses dois direitos, sozinhos, permitem executar um pagamento. A segregação é uma escolha explícita da política deste cenário.

## Como executar

No PowerShell do computador pessoal, entre na raiz do repositório. Não precisa de DC01, módulo AD ou conexão ao Entra.

1. Leia o [script](../../../05-automacao/Invoke-SoDLab.ps1): cinco cenários independentes: A somente; B somente; A+B na mesma pessoa/escopo; A e B em pessoas diferentes; A e B em escopos diferentes. O agrupamento usa caso, matrícula e escopo antes de avaliar os direitos.
2. Execute a etapa Antes e capture horário, direitos e resultados:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\05-automacao\Invoke-SoDLab.ps1 -Etapa Antes
```

3. Esperado: A somente e B somente sem conflito; A+B com conflito. Explique por que A+B viola a regra, mesmo que os dois direitos sejam válidos individualmente.
4. Decisão didática: Carlos Lima mantém ORCAMENTO_APROVAR e retira FORNECEDOR_MANTER do caso A+B, pois neste cenário Gabriela aprova orçamento e outra pessoa cuida dos fornecedores. Não é aprovação externa real nem direito derivado de GG_FIN_READ.
5. Execute a etapa Depois e capture a decisão exibida e o resultado:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\05-automacao\Invoke-SoDLab.ps1 -Etapa Depois
```

6. Esperado: o caso que tinha A+B conserva apenas B e fica sem conflito; os demais cenários permanecem iguais. As alterações são feitas em dados na memória, sem modificar arquivos de entrada ou diretórios. O parâmetro Bypass vale somente para o processo iniciado.
7. Guarde as duas capturas em Downloads para conferência e conclusão documental. Diga com suas palavras qual direito foi preservado e qual risco a regra tenta reduzir.

## Limites

SoD estática sobre direitos fictícios. Sem ERP, workflow de aprovação ou mecanismo preventivo implantado. Não implementa a proibição dinâmica de aprovar a própria transação. Pessoas e escopos diferentes não geram conflito nesta política, o que testa falsos positivos. Isso não exclui risco de conluio ou efeitos entre unidades: são riscos fora desta regra. O script não é um motor genérico de SoD.

Verificação técnica do preparo: o script foi executado nas duas etapas para conferir a lógica, com um conflito antes e nenhum depois; as saídas de desenvolvimento não substituem as capturas do exercício do operador.

[Ver as provas do exercício concluído](14-sod-resultado.md) · [Índice por assunto](README.md).
