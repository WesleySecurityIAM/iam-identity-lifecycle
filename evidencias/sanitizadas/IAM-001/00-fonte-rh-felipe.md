# Felipe — fonte de RH do provisionamento

**Fonte utilizada:** [RH completo de 29/08/2026 — nove pessoas fictícias](../fontes-rh/rh-2026-08-29.csv). O recorte relevante é:

```csv
employee_id,nome,cargo,area,gestor,admissao,desligamento,status
EMP0006,Felipe Gomes,Analista Financeiro,Financeiro,Carlos Lima,2024-01-08,,ATIVO
```

EMP0006 relaciona a pessoa à conta. ATIVO, cargo, área e gestor fundamentam o cadastro esperado; a [regra do cargo](EV-IAM-001-02-regra-matriz.csv) e a decisão simulada do ticket definem a associação a GG_FIN_READ. O RH não comprova criação da conta nem acesso ao recurso.

[Recorte original em CSV — prova 01](EV-IAM-001-01-fonte-rh.csv) · [Seguir para criação e associação](README.md#execucao) · [Ticket IAM-001](../../../00-operacao-itsm/05-fila-tickets.md#iam-001).
