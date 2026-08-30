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

O script não concede nem revoga acessos automaticamente. Toda exceção exige validação da fonte, aprovação do responsável e registro em ticket.

[Ver a entrega e as instruções de reprodução](./05-automacao/)

## Resultado atual

Foram avaliadas cinco associações entre contas e grupos:

- duas associações estavam de acordo com o esperado;
- duas exigem análise para possível remoção;
- uma exige análise para possível concessão.

O relatório final contém três exceções. Nenhum acesso foi alterado.

## Tecnologias e conceitos

- PowerShell;
- objetos e pipeline;
- CSV;
- `Compare-Object`;
- tratamento de erros;
- contas e grupos de segurança;
- reconciliação de acessos;
- menor privilégio;
- evidências para auditoria.

## Próximas etapas

O laboratório será evoluído gradualmente com:

- fonte autoritativa de RH;
- casos Joiner, Mover e Leaver;
- matriz de acessos por cargo;
- Active Directory;
- Microsoft Entra ID;
- recertificação e revisão de acessos;
- integração e automação com Microsoft Graph.

## Limitações

A entrega atual é introdutória e utiliza um cenário local com dados sintéticos. Ainda não existe integração com RH, Active Directory, Microsoft Entra ID, SAP ou plataforma ITSM.
