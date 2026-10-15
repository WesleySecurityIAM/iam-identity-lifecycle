# TI — fundamento da ampliação da matriz em 29/09/2026

**Achado:** TI já existia no RH, mas não tinha perfil de recursos na matriz inicial de três cargos. A revisão de cobertura do IAM-010 identificou essa lacuna; não houve criação de um novo departamento no RH nem detecção automática pelo comparador de três grupos.

## O que as fontes mostravam

Recorte do RH preservado na coleta de **28/09**, somente as pessoas de TI:

| Matrícula / pessoa | Área / cargo | Gestor | Status naquela fonte |
|---|---|---|---|
| EMP0004 — Diego Rocha | TI / Terceiro de Sistemas | Fernanda Souza | ATIVO |
| EMP0009 — Isabela Ferreira | TI / Analista de Sistemas | Fernanda Souza | ATIVO |

A matriz inicial `matriz_tres_cargos.csv`, de 29/08, previa apenas **Analista Financeiro → GG_FIN_READ**, **Analista de Suporte → GG_SUP_TICKET** e **Analista de RH → GG_RH_READ**. Nenhuma linha definia o acesso funcional de TI. Em 28/09, a [regra por sistema](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md) ainda mantinha Isabela fora do provisionamento; a ausência não era descumprimento de uma concessão já aprovada.

## Decisão e mudança de escopo

Em 29/09, decidiu-se completar a [matriz](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md#catalogo-acessos): Isabela ativa precisava consultar procedimentos de TI. O perfil ficou **Isabela → GG_TI_READ → DL_TI_PROCEDIMENTOS_READ → ProcedimentosTI**, com leitura e sem administração pelo cargo. Wesley registrou a decisão simulada; Fernanda Souza é a responsável de negócio fictícia.

A implementação ocorreu **somente no AD**, seguida de teste de leitura permitida e criação negada. Entra ficou planejado para o piloto híbrido. Diego seguiu o [encerramento pelo prazo](../IAM-004/README.md); não recebeu novo acesso para preencher a matriz.

No RH vigente de 29/09, **Isabela permaneceu ATIVO/TI/Analista de Sistemas**, com a mesma matrícula. A atualização do RH registrou Diego como DESLIGADO, com término em 29/09. Portanto, ampliar a matriz de TI e atualizar o vínculo do terceiro são mudanças distintas.

<details>
<summary>Fontes preservadas e integridade</summary>

| Fonte privada | SHA-256 |
|---|---|
| RH da coleta de 28/09 — `reconciliacao-ampliada/hr_authoritative_source.csv` | `1836A9BC4F3D9248F30933EA2A65268655ECA51AA7962416A756283C7A128B1E` |
| Matriz inicial — `290826/matriz_tres_cargos.csv` | `07763A9548A03848B117EBC3CA1725DDB50A1642B1B502AD164A64F24603FDA5` |
| RH vigente de 29/09 — `290926/hr_authoritative_source.csv` | `A10F8A3F5768CD5FEC7D77E4D3D1AC9168B779070DB5158F8F648AC3AAF875DC` |

Recortes documentais dos arquivos fictícios preservados. Esses arquivos definem pessoas/regras; as capturas e inventários posteriores demonstram execução. A ampliação de 29/09 não altera os resultados limitados ao escopo de 28/09.

</details>

[Próximo: implantação e testes de Isabela](ti-isabela/README.md) · [Decisão das duas associações](08-recertificacao-simulada.md#cobertura-ti-2909) · [Índice do IAM-010](README.md#cobertura-ti).
