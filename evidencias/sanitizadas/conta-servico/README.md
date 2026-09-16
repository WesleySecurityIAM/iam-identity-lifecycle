# Conta de relatórios aguardando integração

[Captura da consulta no AD](01-conta-relatorios-desabilitada.png), em 11/09/2026 às 15:58:23 pelo relógio da VM (contexto de Brasília).

## Estado observado

- Conta: `svc_relatorio_fin`, consultada na OU `Contas-de-Servico`.
- `Enabled=False`: conta desabilitada.
- Departamento: Financeiro.
- Responsável técnico na descrição: Wesley.
- Finalidade prevista: rotina de relatórios financeiros.
- Situação registrada: aguardando integração e autorização de acesso.

O objeto está criado e desabilitado enquanto o uso é preparado. Isso não comprova ausência de grupos ou permissões existentes, encerramento de sessões anteriores ou funcionamento de uma rotina integrada. Não foi realizado teste de acesso a recurso com essa conta.

## Pendências registradas em 11/09

O identificador na descrição aparece como `AM-005`; o ticket previsto é `IAM-005`. A correção desse texto no AD ainda depende do operador. A captura original foi preservada sem alteração. Integração, aprovação, permissões e validação operacional continuam pendentes; esta evidência não encerra o IAM-005.

## Continuação concluída em 15/09

A integração e os testes foram concluídos no [IAM-005](../IAM-005/README.md), com conta e tarefa desabilitadas ao final. O estado inicial acima foi preservado como evidência histórica.
