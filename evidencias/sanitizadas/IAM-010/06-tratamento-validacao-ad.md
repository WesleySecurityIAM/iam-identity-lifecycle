# Tratamento e comparação posterior — 28/09/2026

## Resultado

Bruno passou a integrar GG_SUP_TICKET, com leitura permitida e criação negada em SuporteLab. A nova coleta AD confirma também Gabriela na OU Financeiro, preservando a identidade e as associações anteriores dela.

A concessão atende à [regra definida nesta revisão](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md). A análise do inventário motivou a definição da necessidade; não se alega descumprimento de aprovação histórica.

## Evidências

| Prova | Horário UTC−03:00 e resultado |
|---|---|
| [02 — Antes](02-bruno-grupo-ausente.png) | 16:41:36: EMP0002 habilitado em Suporte; BrunoPresente=False e zero membros no grupo. |
| [03 — Depois](03-bruno-grupo-presente.png) | 16:42:48: Bruno listado em GG_SUP_TICKET. A captura não mostra o comando de inclusão. |
| [04 — Leitura](04-bruno-leitura-permitida.png) | 16:55:18: net use inicialmente sem entradas, conexão explícita como EMPRESA\bruno.costa concluída e conteúdo de chamado-teste.txt exibido. |
| [05 — Criação negada](05-bruno-criacao-negada.png) | 16:57:45: New-Item no compartilhamento SuporteLab retorna Access is denied. |

Os horários são leituras exibidas junto aos comandos, não timestamps de auditoria da inclusão no grupo. A criação negada não testa todas as operações de escrita. Foi orientado reset administrativo de senha por indisponibilidade da credencial anterior; as provas recebidas não demonstram o reset, portanto ele não é apresentado como ação comprovada. Nenhuma credencial integra as evidências.

## Nova comparação dos arquivos

Coletas AD: **15:52:51 → 16:59:31**, ambas em 28/09, UTC−03:00. Comparação executada em PowerShell com Import-Csv e Compare-Object, por campos explícitos:

| Verificação | Resultado |
|---|---|
| População de usuários | 9 antes e 9 depois; mesmas identidades. |
| Cadastro | SamAccountName, ObjectGUID, EmployeeID, Enabled, Department, Title e AccountExpirationDate sem diferenças. |
| Localização | Única diferença: DistinguishedName de Gabriela mudou de OU Suporte para OU Financeiro. |
| Grupos GG/DL | Mesmos 7 grupos e mesmos GUIDs, escopos e categorias. |
| Associações diretas | 8 antes e 9 depois; única inclusão: bruno.costa em GG_SUP_TICKET. Nenhuma remoção. |
| Encadeamento de Suporte | GG_SUP_TICKET permanece membro de DL_SUP_TICKET_READ. |

As duas mudanças observadas correspondem aos encaminhamentos registrados: leitura de Suporte para Bruno e localização de Gabriela em Financeiro. Os CSVs originais, horários, comparação detalhada e manifesto SHA-256 estão preservados em área privada, em uma coleta posterior separada. Quatro prints publicados sem edição.

## Limites e pendências

Comparação limitada aos atributos e associações exportados; não inclui senha, ACLs, GPOs ou todas as sessões. Os exports não são inventário de todos os grupos do domínio: a coleta de grupos cobre GG_* e DL_*.

Tratamento desses dois achados validado no escopo descrito. **IAM-010 continua em andamento:** comparação e decisões posteriores estão nas evidências 07–08; retenção da conta de serviço, encerramento de Diego e microcaso SoD ainda pendentes. O Entra não foi alterado nesta rodada.
