# Comparação final — RH × Entra — 28/09/2026

Nova comparação executada após as mudanças, usando a fonte RH de 28/09 e os CSVs de usuários e membros de 28/09. Correlação por matrícula única EMP0007; membros por Object ID da conta.

## Como e por que foi comparado

A rotina histórica **`fechar-mover-2809.py` usou Python**, com `csv.DictReader`, para calcular esta tabela. O [código de comparação publicado](../../../05-automacao/IAM-002/Compare-MoverEntra.py) foi extraído dessa rotina em 15/10; [entradas e execução](../../../05-automacao/IAM-002/README.md).

1. Ler o [RH vigente de Gabriela](12-fonte-rh-mover-2026-09-28.csv) e o CSV de usuários exportado **depois** das alterações. Exigir uma correspondência de EMP0007 em cada fonte.
2. Comparar `status == ATIVO` com `accountEnabled`, `area` com `department` e `cargo` com `jobTitle`. Conferir o Object ID observado contra o registrado antes da mudança.
3. Procurar esse Object ID nos dois CSVs de membros. A [regra do Mover](../../../00-operacao-itsm/05-fila-tickets.md#iam-002-regra-acesso) exige ausência em Suporte e presença em Financeiro; essas regras de acesso não vêm apenas do RH.
4. Comparar esperado e observado nas seis regras. A tabela registra o resultado calculado, para conferir se as mudanças atenderam ao cenário; não é somente uma lista de ações executadas.

## Resultado

| Regra | Esperado | Observado | Resultado |
|---|---|---|---|
| Object ID preservado | 2d5bee1a-e26c-47ef-bea2-a55a2fd8614d | 2d5bee1a-e26c-47ef-bea2-a55a2fd8614d | CONFORME |
| Conta habilitada conforme RH | True | True | CONFORME |
| Departamento | Financeiro | Financeiro | CONFORME |
| Cargo | Analista Financeiro | Analista Financeiro | CONFORME |
| GG_SUP_TICKET: associação direta | False | False | CONFORME |
| GG_FIN_READ: associação direta | True | True | CONFORME |

**Resultado: seis verificações conformes, zero exceções nesse escopo.** Estado das exportações de 28/09, sem consulta ao tenant em tempo real.

A conferência de OU ocorreu depois, sobre inventários do **AD** e usando PowerShell: [complemento de OU e comparação posterior](README.md#complemento-ou). Ela não integra estas seis regras do Entra.

## Fontes e integridade

| Fonte privada | SHA-256 |
|---|---|
| exportUsers_2026-9-28.csv | `532adcb5571bcf7437e678eba20021a9b73c6c115b538dc3046214f8a00eede6` |
| exportGroupMembers_2026-9-28-GG_FIN_READ.csv | `5384d97603e7e5d9689cd175d9a609944f499244d3e9457aa5b97854fb7740be` |
| exportGroupMembers_2026-9-28-GG_SUP_TICKET.csv | `6aa5749f6bf969cf50de07475a9f66d0f1a2d9096dd826b9c1c17367b8227331` |

## Limites

Não compara Manager, OU, papéis, outras concessões, grupos aninhados ou sessões, nem executa correções. Carlos Lima consta do RH, sem validação do atributo Manager. Associação aos grupos não comprova acesso ao recurso.

[Voltar à sequência de evidências](README.md).
