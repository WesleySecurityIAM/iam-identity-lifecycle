# IAM-008 — Conferência de acesso por grupo

Três consultas de 17/09/2026 apoiam a avaliação de uma solicitação simulada de permissão individual para Felipe. Decisão simulada registrada em 17/09: manter o acesso por grupo e não acrescentar permissão individual redundante. Ticket fechado, sem alteração de permissões.

| Evidência | Resultado |
|---|---|
| [01 — Grupo global](01-felipe-no-gg-fin-read.png) | Felipe é membro do GG_FIN_READ. |
| [02 — Grupo de recurso](02-membros-dl-fin-relatorios-read.png) | A DL contém GG_FIN_READ e GG_SVC_RELATORIO_FIN. |
| [03 — ACL da pasta](03-acl-pasta-financeira.png) | Leitura/execução pela DL; nenhuma entrada direta para Felipe. |

Capturas originais sem edição, renomeadas por conteúdo. Datas/horários nominais dos arquivos: 17/09 às 10:54:45, 10:56:07 e 10:58:13; as telas não exibem relógio. Origem e hashes preservados no manifesto privado.

IsInherited=False indica entradas explícitas na pasta. ContainerInherit/ObjectInherit indicam propagação aos filhos, sem comprovar a ACL efetiva de cada filho. Esta coleta não inclui novo teste de leitura. O [teste de Felipe de 14/09](../agdlp-financeiro/05-felipe-leitura-permitida-escrita-negada.png) permanece histórico.

[Ticket e decisão](../../../00-operacao-itsm/05-fila-tickets.md#iam-008).
