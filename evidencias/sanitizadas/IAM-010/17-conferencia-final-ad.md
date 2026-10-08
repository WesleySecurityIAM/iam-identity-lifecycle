# Conferência final AD — 29/09/2026

Nova comparação após as mudanças: **nenhuma associação ausente ou excedente e nenhuma divergência nas regras cadastrais/operacionais abaixo**. Isso confirma o estado esperado no recorte AD; não representa auditoria de todas as permissões nem uma nova coleta do Entra.

A captura 18 mostra coleta, contagens e estado da tarefa. Os resultados abaixo são da comparação documental posterior dos arquivos.

## Fontes e método

- Coleta DC01: 29/09/2026, **17:24:44–17:24:48 UTC−03:00**, pasta `revisao-final-20260929-172444`; [captura do resumo](18-resumo-coleta-final-ad.png).
- Três CSVs: usuários, grupos e associações diretas; JSON da tarefa IAM-005 e manifesto. Quatro hashes SHA-256 conferidos contra o manifesto; contagens e referências entre GUIDs consistentes.
- RH vigente de 29/09 (nove pessoas) e [matriz vigente](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md), incluindo TI implantada no AD.
- Matrícula única relaciona pessoa e conta; GUIDs relacionam membros e grupos. Comparação bidirecional: esperado sem observado = ausente; observado sem esperado = excedente. Grupos vazios são identificados no catálogo e conferidos contra as associações.
- Comparação de GUIDs com a coleta AD de 28/09 às 16:59: as nove contas anteriores foram preservadas; Isabela é a décima conta. Sem alteração dos CSVs de origem. Fontes integrais e resultado detalhado preservados em área privada.

## População e controles

| Verificação | Resultado |
|---|---|
| População AD | 10 contas: cinco pessoas com matrícula e cinco contas especiais, classificadas separadamente. |
| Pessoas previstas no AD | Bruno EMP0002, Diego EMP0004, Felipe EMP0006, Gabriela EMP0007 e Isabela EMP0009 presentes, com matrícula única. |
| Ausências intencionais no AD | Ana, Carla, Elisa e Henrique ausentes, conforme escopo por sistema; não são falhas de provisionamento. |
| Quatro pessoas ativas no AD | Bruno, Felipe, Gabriela e Isabela habilitados; departamento e cargo correspondem ao RH. |
| OU de Gabriela / Isabela | Financeiro / TI, respectivamente. OU não substitui concessão ao recurso. |
| Diego | Expiração `2026-09-29T08:00:00-03:00`, anterior à coleta; nenhuma associação direta nos nove grupos avaliados. Enabled=True é compatível com o encerramento por expiração definido no IAM-004. A recusa de autenticação foi comprovada naquele ticket, não por este CSV. |
| Conta de serviço | svc_relatorio_fin=False; nenhuma associação direta aos grupos consultados. Tarefa IAM-005-Relatorio-Financeiro=Disabled. |
| Grupos | Nove grupos Security; prefixos GG com escopo Global e DL com DomainLocal. |

## Associações comparadas

| Grupo | Membros esperados e observados | Resultado |
|---|---|---|
| GG_FIN_READ | Felipe e Gabriela | Conforme |
| GG_SUP_TICKET | Bruno | Conforme |
| GG_TI_READ | Isabela | Conforme |
| GG_AD_SUP_RESET | adm.wesley | Conforme |
| DL_FIN_RELATORIOS_READ | GG_FIN_READ | Conforme |
| DL_SUP_TICKET_READ | GG_SUP_TICKET | Conforme |
| DL_TI_PROCEDIMENTOS_READ | GG_TI_READ | Conforme |
| GG_SVC_RELATORIO_FIN | Vazio | Conforme |
| DL_FIN_SAIDA_WRITE | Vazio | Conforme |

**Oito associações diretas conformes; zero ausentes e zero excedentes.** As três relações de serviço anteriormente removidas continuam ausentes, e os caminhos humanos de Financeiro, Suporte e TI permanecem. Não somar esses números às nove associações departamentais históricas (AD + Entra) de 28/09: são recortes e momentos diferentes.

## Limites

Membros diretos de grupos GG/DL, sem grupo primário ou grupos fora desses prefixos. Não reavalia todas as ACLs, privilégios, GPOs, sessões ou dependências. As consultas são sequenciais. Testes SMB de TI: [provas específicas](ti-isabela/README.md).

Sem nova exportação Entra neste lote. **IAM-010 fechado em 29/09/2026 no escopo revisado.**

[Voltar ao índice por assunto](README.md).
