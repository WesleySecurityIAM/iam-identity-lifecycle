# IAM-010 — Comparação coletiva após os tratamentos de 28/09

Comparação do inventário AD, separada da evidência 06 na revisão documental de 07/10/2026. Sem nova coleta ou teste.

## Comparação coletiva posterior — Bruno e localização de Gabriela

Coletas AD: **15:52:51 → 16:59:31**, ambas em 28/09, UTC−03:00. Comparação executada em PowerShell com Import-Csv e Compare-Object, por campos explícitos:

| Verificação | Resultado |
|---|---|
| População de usuários | 9 antes e 9 depois; mesmas identidades. |
| Cadastro | SamAccountName, ObjectGUID, EmployeeID, Enabled, Department, Title e AccountExpirationDate sem diferenças. |
| Localização | Única diferença: DistinguishedName de Gabriela mudou de OU Suporte para OU Financeiro. |
| Grupos GG/DL | Mesmos 7 grupos e mesmos GUIDs, escopos e categorias. |
| Associações diretas | 8 antes e 9 depois; única inclusão: bruno.costa em GG_SUP_TICKET. Nenhuma remoção. |
| Encadeamento de Suporte | GG_SUP_TICKET permanece membro de DL_SUP_TICKET_READ. |

CSVs originais, comparação detalhada e manifesto SHA-256 preservados em área privada.

## Alcance

Esta comparação confere os campos exportados, não senha, ACLs, GPOs ou todas as sessões. Os grupos coletados são GG_* e DL_*, não todos os grupos do domínio.

Provas individuais: [Bruno — concessão e testes](06-tratamento-validacao-ad.md) e [Gabriela — complemento de OU](../IAM-002/README.md#complemento-ou).

Etapas seguintes: [comparação departamental 07](07-comparacao-populacao-grupos.md) e [recertificação inicial 08](08-recertificacao-simulada.md#decisoes-2809). [Índice](README.md).
