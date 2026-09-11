# EV-IAM-001-07 - Cargo no inventário do Entra

- Coleta informada pelo operador: 10/09/2026, exportação de All users no Microsoft Entra admin center.
- Fonte: exportUsers_2026-9-10.csv; original integral preservado em área privada, sem alteração.
- SHA-256 do original: B966A491756BAEB9B2841BB4E8C3D40A34D623011B60D957011C3C223199857D
- Método: importação do CSV, seleção exata de employeeId = EMP0006; encontrado um único registro entre 2 registros exportados. Transcrição abaixo mantém os valores dos cinco campos selecionados.

| Campo do CSV | Valor exportado |
|---|---|
| displayName | Felipe Gomes |
| employeeId | EMP0006 |
| jobTitle | Analista Financeiro |
| department | Financeiro |
| accountEnabled | True |

## Comparação

A matrícula, nome, cargo e departamento correspondem à linha EMP0006 da fonte histórica de RH de 29/08. A matriz associa Analista Financeiro a GG_FIN_READ. Este CSV não exporta pertencimento a grupos: a prova dessa associação permanece nas evidências anteriores.

## Escopo e limites

A exportação fornecida comprova os valores cadastrais retornados na coleta de 10/09, superando a dúvida de valores ainda não salvos na tela de edição. Não comprova o cargo em 03/09 ou 04/09, a data em que foi preenchido, nem acesso a uma aplicação. A data da coleta é a informada pelo operador e pelo nome do arquivo; não há timestamp de exportação por registro. O hash permite conferir integridade da cópia preservada, não certifica sozinho a origem do arquivo.

Foram omitidos deste extrato os identificadores privados, UPN, domínio, demais campos e a outra conta. A captura 06 permanece como complemento. O fechamento histórico do IAM-001 é 04/09; esta é complementação documental de 10/09.