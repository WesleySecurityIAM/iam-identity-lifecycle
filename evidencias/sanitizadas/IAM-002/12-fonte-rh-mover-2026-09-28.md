# Prova 12 — RH e mudança de Gabriela

**Fonte utilizada:** [RH completo de 28/09/2026 — Mover e coleta inicial](../fontes-rh/rh-2026-09-28-mover.csv). Recorte de EMP0007:

```csv
employee_id,nome,cargo,area,gestor,admissao,desligamento,status
EMP0007,Gabriela Santos,Analista Financeiro,Financeiro,Carlos Lima,2023-11-13,,ATIVO
```

Na [fonte anterior de 23/09](../fontes-rh/rh-2026-09-23.csv), Gabriela era Analista de Suporte, em Suporte, com Daniela Alves como gestora. Em 28/09, mudaram somente cargo, área e gestor de EMP0007; matrícula, admissão, status e demais pessoas foram preservados nesta versão.

O RH define o novo cadastro esperado. A [decisão simulada e a regra do Mover](../../../00-operacao-itsm/05-fila-tickets.md#iam-002-regra-acesso) determinam retirar Suporte e conceder Financeiro. Esta fonte não comprova execução. A cópia integral foi preservada com o inventário de 28/09; a revisão posterior do prazo de Diego possui outra versão no [catálogo de fontes](../fontes-rh/README.md).

[Recorte original em CSV](12-fonte-rh-mover-2026-09-28.csv) · [Continuar: estado anterior e decisão](README.md#mudanca-e-estado-anterior).
