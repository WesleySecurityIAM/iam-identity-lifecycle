# Gabriela — origem do achado e conferência posterior de OU

**Recorte documental de EMP0007 organizado em 15/10/2026**, a partir dos inventários e da comparação de 28/09. Não é nova coleta. Horários em UTC−03:00.

## Origem e decisão

O inventário **AD de 15:52:51**, analisado na preparação do IAM-010, mostrava `Department=Financeiro`, mas `DistinguishedName=CN=Gabriela Santos,OU=Suporte,DC=empresa,DC=lab`. A análise motivou a [decisão de 16:14](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md): complementar o Mover, alinhando a localização do objeto à área, preservando identidade e acessos.

A rotina inicial `conferir-coleta-2809.ps1` importou os inventários e comparou habilitação, departamento e cargo com o RH. **OU não era uma regra automática dessa comparação:** o ponto foi identificado ao analisar a localização exportada e registrado para tratamento. Por isso, cadastro conforme não significava que a revisão da OU estava concluída.

As [provas 24–28](README.md#complemento-ou) mostram a sequência: consulta antes às 16:20:03 → OU Financeiro às 16:23:08 → leitura financeira permitida, criação negada e Suporte negado. A alteração foi no AD local; o Entra deste cenário não tinha essa estrutura de OUs.

## Como a comparação posterior confirmou o resultado

Após a nova coleta de **16:59:31**, a rotina histórica `arquivar-bruno-final.ps1` usou `Import-Csv` e `Compare-Object` para comparar os inventários AD anterior e posterior, especificando os campos. Além de detectar diferenças, verificou se o DN final de EMP0007 era exatamente o esperado em Financeiro.

O [recorte PowerShell de Gabriela](../../../05-automacao/IAM-002/Compare-MoverOu.ps1), publicado em 15/10, permite consultar essa comparação sem as operações de arquivamento do original. [Como executar](../../../05-automacao/IAM-002/README.md).

| Verificação | Antes — 15:52:51 | Depois — 16:59:31 | Conclusão |
|---|---|---|---|
| Matrícula / ObjectGUID | EMP0007 / cc17f00e-178a-47be-91be-dab949512b83 | Mesmos valores | Identidade preservada. |
| Localização — DistinguishedName | CN=Gabriela Santos,OU=Suporte,DC=empresa,DC=lab | CN=Gabriela Santos,OU=Financeiro,DC=empresa,DC=lab | Única mudança nos campos cadastrais comparados de Gabriela; destino conforme a decisão. |
| Demais campos comparados | SamAccountName, Enabled, Department, Title e AccountExpirationDate | Sem diferenças | Movimentação de OU preservou esses dados. |

Em `Compare-Object`, `<=` representa o DN apenas no inventário **antes**; `=>`, apenas no **depois**. Essas duas linhas representam uma mudança de localização da mesma conta, não duas contas nem duas falhas.

## Fontes e limite

| Fonte privada | SHA-256 |
|---|---|
| usuarios-ad.csv — coleta de 15:52:51 | `ecee6032a68b32e60a718f42bde127cd5375cbbd504672a04f3e977e1750a692` |
| depois-165931/usuarios-ad.csv | `d246e7e7aa9beb432a900d9c03530be497134de65542e18f25988376e538d120` |
| depois-165931/comparacao-antes-depois.json | `c34d6ac0ebead4e395b6335433c1918ac39db4fd2c7e166bf861bccd2480a393` |

Arquivos da reconciliação ampliada de 28/09. O JSON também contém outro tratamento; este recorte apresenta somente Gabriela. [Origem coletiva no IAM-010](../IAM-010/06b-comparacao-coletiva-ad.md).

A comparação confirma a localização e os campos listados. Não audita GPOs, delegação, sessões ou todas as permissões; os testes de acesso são provas separadas. A evidência da movimentação é o estado antes/depois, sem captura do comando de alteração.

[Voltar ao complemento de OU](README.md#complemento-ou) · [Ticket IAM-002](../../../00-operacao-itsm/05-fila-tickets.md#iam-002).
