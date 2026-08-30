# Laboratório de IAM — ciclo de vida e reconciliação de acessos

Projeto de portfólio em desenvolvimento para praticar operação de identidades e acessos, governança, evidências e automação com PowerShell.

Todos os dados são sintéticos. Nenhuma conta ou ambiente corporativo é utilizado.

## Primeira entrega concluída

### Reconciliação de acessos — estado esperado versus estado atual

O artefato compara associações atuais de contas e grupos com um estado esperado e produz uma lista de exceções para investigação.

A entrega demonstra:

- importação e exportação de dados em CSV;
- tratamento de objetos com PowerShell;
- comparação entre estado atual e esperado;
- identificação de possíveis concessões e remoções;
- geração de evidência reproduzível;
- tratamento de erros;
- separação entre detecção, aprovação e remediação.

O script não concede nem revoga acessos automaticamente, pois uma fonte incorreta poderia propagar o erro em escala. Toda exceção exige validação da fonte, aprovação do responsável e registro em ticket antes de qualquer remediação.

[Ver a entrega e as instruções de reprodução](./05-automacao/)

## Resultado atual

Foram avaliadas cinco associações entre contas e grupos. Duas estavam de acordo com o esperado e três foram classificadas como exceções:

- duas exigem análise para possível remoção;
- uma exige análise para possível concessão.

Nenhum acesso foi alterado.

## Tecnologias e conceitos

- PowerShell;
- objetos e pipeline;
- CSV;
- `Compare-Object`;
- tratamento de erros;
- contas e grupos de segurança;
- reconciliação de acessos;
- evidências para auditoria.

## Limitações

A entrega atual é introdutória e utiliza um cenário local com dados sintéticos. Ainda não existe integração com RH, Active Directory, Microsoft Entra ID, SAP ou plataforma ITSM.
