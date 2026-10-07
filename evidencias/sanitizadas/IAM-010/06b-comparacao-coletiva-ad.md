# IAM-010 — Comparação coletiva após os tratamentos de 28/09

Relatório separado na revisão documental de 07/10/2026, a partir da comparação já registrada na evidência 06. Não é nova coleta nem novo teste. Aqui a unidade de análise é o inventário AD: por isso Bruno e Gabriela aparecem juntos.

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

As duas mudanças observadas correspondem aos encaminhamentos registrados: leitura de Suporte para Bruno e localização de Gabriela em Financeiro. Os CSVs originais, horários, comparação detalhada e manifesto SHA-256 estão preservados em área privada, em uma coleta posterior separada.

## Alcance e continuação

Esta comparação confere os campos exportados, não senha, ACLs, GPOs ou todas as sessões. Os grupos coletados são GG_* e DL_*, não todos os grupos do domínio.

As provas individuais ficam em [Bruno — concessão e testes](06-tratamento-validacao-ad.md) e [Gabriela — complemento de OU](../IAM-002/README.md#complemento-ou). Esta página não mistura as capturas de uma pessoa com os testes da outra.

Depois desta coleta vieram a [comparação departamental 07](07-comparacao-populacao-grupos.md) e a [recertificação inicial 08](08-recertificacao-simulada.md#decisoes-2809). Os tratamentos de 29/09 e o fechamento estão no [índice do IAM-010](README.md).
