# Carla — fonte de RH usada no Leaver de 23/09/2026

**Papel da fonte:** definir a situação da pessoa antes de comparar o diretório. Na versão preservada em `230926/hr_authoritative_source.csv`, Carla já constava como desligada:

```csv
employee_id,nome,cargo,area,gestor,admissao,desligamento,status
EMP0003,Carla Mendes,Assistente Financeiro,Financeiro,Carlos Lima,2024-03-18,2026-08-28,DESLIGADO
```

**Consultar a fonte:** [RH completo utilizado em 23/09 — nove pessoas fictícias](../fontes-rh/rh-2026-09-23.csv). A linha acima mantém o foco em Carla; o CSV permite conferir o contexto e a versão. A cópia pública tem o mesmo conteúdo da fonte preservada, SHA-256 `532D4EB71ACF3DCBFE7C8BF94848FE1112F21A58D5501D64695B2F296D45B510`.

| Elemento | Interpretação neste caso |
|---|---|
| RH: DESLIGADO | Situação de negócio que fundamenta o encerramento. |
| Regra do Leaver | Conta desabilitada, retirada de GG_FIN_READ e revogação de sessões. O cargo financeiro não justifica manter concessões após desligamento. |
| CSV Entra de 22/09 | `accountEnabled=True`: estado observado incompatível com a habilitação esperada False. |
| Comparação após tratamento | CSV Entra de 23/09 com False: [resultado de Carla](08-validacao-final.md). Grupos e revogação têm provas próprias. |

A matrícula EMP0003 relaciona RH e conta. A fonte RH define o esperado, mas não executa nem comprova bloqueio. A conta foi criada em 21/09 para reproduzir a divergência; a data fictícia de desligamento não prova acesso contínuo desde agosto.

[Próximo: estado anterior e divergência](README.md#estado-anterior) · [Ticket IAM-003](../../../00-operacao-itsm/05-fila-tickets.md#iam-003).
