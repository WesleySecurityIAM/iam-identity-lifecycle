# SoD-001 — conflito tratado no modelo local

**Objetivo:** detectar e tratar uma combinação de direitos incompatíveis pela regra fictícia de Compras-LAB. Leia regra → conflito → decisão → resultado. As imagens principais são relatórios de uma **demonstração refeita**, com data fictícia do cenário de **29/09/2026**; não são capturas originais daquele dia. As provas históricas 15–16 permanecem em seções de apoio.

<a id="regra"></a>

## 1. Regra e motivo da separação

**SoD significa segregação de funções. Regra SoD-001:** a mesma pessoa não pode acumular os direitos A e B no mesmo escopo de Compras-LAB.

| Direito fictício | Significado no processo |
|---|---|
| A — `FORNECEDOR_MANTER` | Manter o cadastro de fornecedores. |
| B — `ORCAMENTO_APROVAR` | Aprovar orçamento. |

O risco considerado é concentrar a manutenção de fornecedores e a aprovação de orçamento na mesma pessoa. O cenário exige separar essas responsabilidades; esses direitos, sozinhos, não demonstram capacidade de executar pagamentos. A regra é específica deste modelo.

**Caso principal:** Gabriela (EMP0007), no escopo Compras-LAB, acumula A+B. A decisão simulada mantém sua aprovação de orçamento e retira a manutenção de fornecedores. O [novo roteiro](../../../05-automacao/SoD-001/README.md) usa somente esse caso; os cenários alternativos do script histórico ficam no apoio técnico.

<a id="antes"></a>

## 2. Antes — detectar o conflito

O script lê os direitos de Gabriela no CSV fictício: manter fornecedores **e** aprovar orçamento no mesmo escopo. Resultado: **CONFLITO** pela SoD-001.

![Demonstração refeita: regra, dois direitos presentes e conflito de Gabriela](sod-demonstracao/antes.png)

[Relatório estruturado — antes](sod-demonstracao/antes.json).

<details>
<summary>Conferir a captura original 15 — olhar somente a linha A+B</summary>

**Captura histórica de 29/09/2026, 17:06:37 UTC−03:00**, com cinco cenários independentes do script original. Não é a execução que gerou o relatório novo acima.

![Prova 15: cenário A+B com os dois direitos e resultado CONFLITO](15-sod-antes.png)

[Abrir a captura original 15](15-sod-antes.png).

</details>

<a id="depois"></a>

## 3. Decisão e resultado após o tratamento

**Decisão simulada atribuída a Carlos Lima:** manter B e retirar A, pois Gabriela aprova orçamentos no cenário e a manutenção de fornecedores cabe a outra pessoa. A atribuição dessa função a outra pessoa não foi implementada. A etapa Depois aplica a decisão somente aos dados em memória e avalia novamente:

![Demonstração refeita: manutenção de fornecedores retirada no modelo, aprovação preservada e sem conflito](sod-demonstracao/depois.png)

**Validação:** somente B permanece; a contagem passa de um para zero conflitos. [Relatório estruturado — depois](sod-demonstracao/depois.json).

<details>
<summary>Conferir a captura original 16 — decisão exibida e linha A+B somente com B</summary>

**Captura histórica de 29/09/2026, 17:10:04 UTC−03:00.** O nome da linha A+B identifica o cenário original; a coluna Direitos mostra somente B após o tratamento. Não é a execução que gerou o relatório novo acima.

![Prova 16: decisão simulada, caso A+B somente com ORCAMENTO_APROVAR e zero conflitos](16-sod-depois.png)

[Abrir a captura original 16](16-sod-depois.png).

</details>

## 4. Como o script compara e quais são os limites

O [novo script PowerShell](../../../05-automacao/SoD-001/Invoke-SoDCase.ps1) lê **regra.json** (esperado), **acessos.csv** (observado fictício) e **decisao.json** (tratamento simulado). Confere pessoa, escopo, campos e duplicidades. A presença de A e B gera conflito; Depois retira A em memória, preserva B e compara novamente. Cada etapa exporta JSON e HTML; as imagens desta página são capturas desses HTMLs. [Entradas e reprodução](../../../05-automacao/SoD-001/README.md) · [arquivos da demonstração](sod-demonstracao/README.md).

<details>
<summary>Apoio técnico — por que as capturas têm cinco cenários e matrículas repetidas</summary>

O [script histórico](../../../05-automacao/Invoke-SoDLab.ps1) agrupa por caso, matrícula e escopo para separar cinco alternativas de validação, descritas no [roteiro original](09-roteiro-sod.md). As capturas 15–16 correspondem a essa versão; os relatórios novos usam um único caso.

| Cenário independente | Por que recebe esse resultado |
|---|---|
| A somente | Só mantém fornecedores; não acumula B. |
| B somente | Só aprova orçamento; não acumula A. |
| A+B — caso principal | Mesma matrícula e escopo com os dois direitos: conflito antes; somente B depois. |
| Pessoas distintas | Uma pessoa tem A e outra tem B: não acumulam os dois na mesma identidade. |
| Escopos distintos | A e B estão em escopos diferentes: sem conflito pela regra delimitada, que não avalia efeitos entre escopos. |

São alternativas de validação, não concessões simultâneas a Gabriela. Pessoas e escopos distintos ocupam duas linhas cada; por isso há sete linhas de resultado para cinco cenários. Os quatro casos de controle permanecem sem conflito antes e depois.

</details>

Cada execução recria os dados. As provas demonstram detecção e tratamento no modelo local, sem revogação em aplicação real. SoD estática: sem ERP, transações financeiras, API de concessão, prevenção implantada ou avaliação de conluio. A decisão é simulada, sem aprovação corporativa externa. `GG_FIN_READ` não concede esses direitos, e **zero conflitos não comprova necessidade de cada acesso**.

[Voltar ao índice por assunto](README.md).
