# IAM-008 — Avaliação de permissão individual redundante

**Objetivo:** avaliar uma solicitação simulada de leitura diretamente para Felipe (EMP0006) na pasta financeira. As três consultas de **17/09/2026** verificam se o modelo por grupos já atende à necessidade.

**Resultado:** decisão simulada de 17/09 mantém a leitura por grupo e não aprova a permissão individual redundante. Ticket fechado sem alterar grupos ou ACLs.

## 1. Referência funcional anterior — 14/09

Consulta opcional: [teste de Felipe no mesmo recurso em 14/09 — leitura permitida e criação negada](../agdlp-financeiro/05-felipe-leitura-permitida-escrita-negada.png). Não houve novo teste funcional neste atendimento.

## 2. Conferir a cadeia que sustenta o acesso — 17/09

```text
Felipe → GG_FIN_READ → DL_FIN_RELATORIOS_READ → leitura na pasta financeira
```

| Passo | Prova | Resultado |
|---|---|---|
| Identidade no grupo de função | [01 — Felipe no GG_FIN_READ](01-felipe-no-gg-fin-read.png) | Felipe pertence ao GG_FIN_READ. |
| Grupo de função no grupo do recurso | [02 — Membros da DL_FIN_RELATORIOS_READ](02-membros-dl-fin-relatorios-read.png) | GG_FIN_READ pertence à DL. O grupo adicional é contexto da consulta. |
| Permissão no recurso | [03 — ACL da pasta financeira](03-acl-pasta-financeira.png) | DL com Allow, ReadAndExecute/Synchronize; nenhuma entrada direta para Felipe na ACL mostrada. |

## 3. Decisão e fechamento — 17/09

A validação **de configuração** sustenta a [decisão simulada do Gestor Financeiro](../../../00-operacao-itsm/05-fila-tickets.md#iam-008): manter a leitura por grupos, sem conceder a permissão individual redundante. Nenhum grupo ou ACL foi alterado.

## Limites das provas

- `IsInherited=False` indica entradas explícitas na pasta. `ContainerInherit/ObjectInherit` permitem propagação aos filhos, sem comprovar a ACL efetiva de cada arquivo ou subpasta.
- As consultas não reavaliam todos os caminhos de acesso de Felipe.
- Capturas originais sem edição, renomeadas por conteúdo. Datas/horários nominais dos arquivos: 17/09 às 10:54:45, 10:56:07 e 10:58:13; as telas não exibem relógio. Origem e hashes preservados no manifesto privado.
