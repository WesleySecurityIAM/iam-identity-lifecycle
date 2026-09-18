# Inventário AD — consolidação de 18/09/2026

**Objetivo:** registrar usuários, grupos e associações diretas por consultas PowerShell, conferindo o estado final dos IAM-005 e IAM-009 sem repetir alterações no diretório.

**Resultado:** três CSVs conferidos em 18/09: 8 usuários, 5 grupos e 6 associações diretas, com contagens compatíveis com o print. Felipe está no GG_FIN_READ; a conta de serviço e sua tarefa permanecem desabilitadas. Nenhuma alteração no AD foi realizada nesta consolidação documental.

| Evidência | Resultado observado |
|---|---|
| [01 — Associações e estados finais](01-associacoes-e-estados-finais.png) | GG_FIN_READ contém Felipe; svc_relatorio_fin está desabilitada; tarefa IAM-005 está Disabled. Relógio exibido: 18/09/2026, 10:59:12 UTC−03:00, próximo às consultas. |
| [02 — Contagem dos inventários](02-contagem-dos-inventarios.png) | Import-Csv contou 8 registros em usuarios-ad.csv, 5 em grupos-ad.csv e 6 em associacoes-ad.csv. |

As seis associações visíveis preservam as relações diretas entre conta, GG e DL. A conta de serviço permanece associada ao seu GG mesmo desabilitada; desabilitar a conta não remove associações. A captura não representa um novo teste funcional de acesso.

## Arquivos e validação

| Arquivo | Registros | Conferência |
|---|---|---|
| [Usuários](usuarios-ad.csv) | 8 | Três contas internas (Administrator, Guest, krbtgt), três de negócio, uma administrativa e uma de serviço. |
| [Grupos](grupos-ad.csv) | 5 | Três Global e dois DomainLocal; todos Security. ManagedBy vazio nos cinco. |
| [Associações diretas](associacoes-ad.csv) | 6 | Felipe → GG_FIN_READ → DL_FIN_RELATORIOS_READ; conta de serviço → GG → duas DL; adm.wesley → GG_AD_SUP_RESET. |

Os CSVs foram lidos novamente e comparados às contagens da captura 02. As relações de Felipe e o estado desabilitado da conta de serviço coincidem com a captura 01. A tarefa Disabled é comprovada somente pela captura, pois não integra estes CSVs.

Diego apresenta AccountExpirationDate = 01/10/2026 00:00:00 no formato local exportado. Isso comprova a configuração registrada, não o corte futuro do acesso. ManagedBy vazio é uma observação cadastral; responsáveis podem estar documentados nos tickets. Esta coleta não constitui recertificação de acessos.

## Coleta e limites

As consultas do roteiro usam Get-ADUser, Get-ADGroup e Get-ADGroupMember, seguidas de Select-Object e Export-Csv. Usuários incluem contas internas; grupos são limitados aos nomes GG_* e DL_*; membros são diretos, sem expansão recursiva. Grupo vazio não gera linha no CSV de associações.

Originais recebidos: passo5.png e passo6.png, renomeados sem edição da imagem. Não há horário visível no segundo print. Consultas independentes não constituem snapshot transacional do AD. Os CSVs contêm nomes fictícios, domínio de laboratório e atributos selecionados, sem credenciais. Preservados sem edição; SHA-256 registrado no manifesto privado. Não contêm horário interno de exportação: a data da coleta é informada pelo operador e contextualizada pela captura. A conferência dos responsáveis no cadastro fica como observação para a futura revisão de acesso.

[IAM-005 — conta de serviço](../../../00-operacao-itsm/05-fila-tickets.md#iam-005) · [IAM-009 — restauração do acesso](../../../00-operacao-itsm/05-fila-tickets.md#iam-009).
