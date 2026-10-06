# IAM-008 — Avaliação de permissão individual redundante

**Objetivo:** avaliar uma solicitação simulada de leitura diretamente para Felipe (EMP0006) na pasta financeira. As três consultas de **17/09/2026** verificam se o modelo por grupos já atende à necessidade.

**Resultado:** decisão simulada de 17/09 mantém a leitura por grupo e não aprova a permissão individual redundante. Ticket fechado sem alterar grupos ou ACLs.

## 1. Conferir a cadeia que sustenta o acesso

```text
Felipe → GG_FIN_READ → DL_FIN_RELATORIOS_READ → leitura na pasta financeira
```

| Passo | Prova do passo | Pergunta respondida |
|---|---|---|
| Identidade no grupo de função | [01 — Felipe no GG_FIN_READ](01-felipe-no-gg-fin-read.png) | Felipe pertence ao grupo pelo qual deve receber leitura? Sim. |
| Grupo de função no grupo do recurso | [02 — Membros da DL_FIN_RELATORIOS_READ](02-membros-dl-fin-relatorios-read.png) | O GG_FIN_READ está na DL usada pela pasta? Sim. A lista também contém GG_SVC_RELATORIO_FIN; esta prova não avalia a rotina da conta de serviço. |
| Permissão no recurso | [03 — ACL da pasta financeira](03-acl-pasta-financeira.png) | A DL tem Allow, ReadAndExecute/Synchronize? Sim. Há entrada direta para Felipe? Não na ACL mostrada. |

## 2. Análise e decisão

As consultas sustentam a recomendação de manter a associação aos grupos, preservando o modelo de acesso previsto. A [decisão simulada no ticket](../../../00-operacao-itsm/05-fila-tickets.md#iam-008) registra a aprovação do Gestor Financeiro para manter esse modelo, sem conceder a entrada individual solicitada. Não houve mudança técnica a executar ou reverter.

## 3. Validação do escopo e referência histórica

A validação de 17/09 é **de configuração**: associação de Felipe, associação do GG à DL e permissão da DL na pasta. Não foi executado um novo teste de leitura nesse atendimento.

O [teste de Felipe de 14/09 — leitura permitida e criação negada](../agdlp-financeiro/05-felipe-leitura-permitida-escrita-negada.png) é uma referência histórica opcional para entender o acesso existente. O link vai diretamente à prova de Felipe no mesmo recurso; não é um teste novo nem exige percorrer as demais provas daquele laboratório.

## Limites das provas

- `IsInherited=False` indica entradas explícitas na pasta. `ContainerInherit/ObjectInherit` permitem propagação aos filhos, sem comprovar a ACL efetiva de cada arquivo ou subpasta.
- As consultas não reavaliam todos os caminhos de acesso nem os consumidores dos demais grupos mostrados. O foco é a solicitação de Felipe.
- Capturas originais sem edição, renomeadas por conteúdo. Datas/horários nominais dos arquivos: 17/09 às 10:54:45, 10:56:07 e 10:58:13; as telas não exibem relógio. Origem e hashes preservados no manifesto privado.

[Voltar ao ticket: solicitação, decisão e fechamento](../../../00-operacao-itsm/05-fila-tickets.md#iam-008).
