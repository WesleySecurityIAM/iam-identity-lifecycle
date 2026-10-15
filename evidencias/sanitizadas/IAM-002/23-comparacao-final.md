# Prova 23 — Conferência final do Mover — 28/09/2026

**Objetivo:** verificar se Gabriela (EMP0007) ficou com o cadastro e os grupos esperados após a transferência para Financeiro. A conferência usa a fonte RH e as exportações de usuários e membros de **28/09/2026**.

**Leitura:** fontes e regra → comparação → resultado → limites. A tabela principal reúne seis verificações do Entra; a seção PowerShell identifica separadamente as comparações de cadastro e grupos realizadas sobre as coletas do dia.

## Como e por que foi comparado

1. Ler o [RH vigente de Gabriela](12-fonte-rh-mover-2026-09-28.csv) e o CSV de usuários exportado **depois** das alterações. Exigir uma correspondência de EMP0007 em cada fonte.
2. Traduzir o status **ATIVO** do RH em habilitação esperada **True** e comparar com `accountEnabled`; comparar também `area` com `department` e `cargo` com `jobTitle`. Conferir o Object ID observado contra o registrado antes da mudança.
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

<a id="powershell"></a>

## Reconciliações PowerShell de 28/09 relacionadas ao fechamento

| Etapa / script | Como compara e por quê | Resultado de Gabriela |
|---|---|---|
| Cadastro — `conferir-coleta-2809.ps1`; [recorte de consulta](../../../05-automacao/IAM-002/Compare-MoverCadastro.ps1) | `Import-Csv` carrega RH/AD/Entra; `Where-Object` encontra EMP0007; igualdade por regra compara habilitação, departamento e cargo. Objetivo: conferir o cadastro frente ao RH vigente. | As três regras conformes em cada sistema. Resultado preservado em `comparacao-cadastro.json`. |
| Grupos — [Compare-DepartmentMembership.ps1](../../../05-automacao/Compare-DepartmentMembership.ps1) | Resolve membros por ObjectGUID no AD e id no Entra; relaciona a matrícula à matriz e compara os pares matrícula/grupo. Objetivo: detectar associação ausente ou excedente. | GG_FIN_READ conforme nos dois sistemas; nenhuma associação departamental excedente de EMP0007 no recorte. |

As três regras cadastrais por sistema são diferentes das seis verificações **somente do Entra** da tabela consolidada. O comparador de grupos pertence à rodada do IAM-010, posterior ao tratamento da OU; [fontes e método da rodada coletiva](../IAM-010/07-comparacao-populacao-grupos.md). Aqui consta somente o resultado de Gabriela.

[Scripts, entradas e execução](../../../05-automacao/IAM-002/README.md). A prática anterior de 23/09, também em PowerShell, está nas [provas 10–11](09-11-referencias-antes-mover.md) e usava outras fontes/regras.

## Fontes e integridade

| Fonte privada | SHA-256 |
|---|---|
| exportUsers_2026-9-28.csv | `532adcb5571bcf7437e678eba20021a9b73c6c115b538dc3046214f8a00eede6` |
| exportGroupMembers_2026-9-28-GG_FIN_READ.csv | `5384d97603e7e5d9689cd175d9a609944f499244d3e9457aa5b97854fb7740be` |
| exportGroupMembers_2026-9-28-GG_SUP_TICKET.csv | `6aa5749f6bf969cf50de07475a9f66d0f1a2d9096dd826b9c1c17367b8227331` |

<details>
<summary>Proveniência da tabela consolidada</summary>

A rotina auxiliar local `fechar-mover-2809.py` processou os CSVs e escreveu o relatório de seis verificações durante a organização das evidências. Ela não é a execução PowerShell do operador. O [código auxiliar](../../../05-automacao/IAM-002/Compare-MoverEntra.py) permite conferir o cálculo; as rotinas PowerShell relacionadas estão identificadas na seção anterior. O relatório não equivale a uma captura de execução de um único script PowerShell com essas seis regras.

</details>

## Limites

Não compara Manager, OU, papéis, outras concessões, grupos aninhados ou sessões, nem executa correções. Carlos Lima consta do RH, sem validação do atributo Manager. Associação aos grupos não comprova acesso ao recurso.

[Voltar à etapa 5 — Entra](README.md#execucao-entra) · [Próxima etapa — OU no AD](README.md#complemento-ou) · [Ticket IAM-002](../../../00-operacao-itsm/05-fila-tickets.md#iam-002).
