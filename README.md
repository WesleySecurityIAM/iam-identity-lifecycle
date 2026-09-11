# Laboratório de IAM — ciclo de vida e reconciliação de acessos

Projeto de portfólio em desenvolvimento para praticar operação de identidades e acessos, governança, evidências e automação com PowerShell.

As identidades de negócio e os cenários são fictícios. As operações foram realizadas em ambientes de laboratório; nenhum ambiente corporativo é utilizado. As evidências públicas omitem credenciais e identificadores privados.

## Entregas realizadas

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

### Resultado da reconciliação

Foram avaliadas cinco associações entre contas e grupos. Duas estavam de acordo com o esperado e três foram classificadas como exceções:

- duas exigem análise para possível remoção;
- uma exige análise para possível concessão.

Nenhum acesso foi alterado pelo script de reconciliação.

### Delegação de redefinição de senha no Active Directory

Teste realizado em 11/09/2026 com `adm.wesley` no domínio `empresa.lab`:

- **Suporte:** redefinição permitida e alteração de `pwdLastSet` confirmada.
- **Terceiros:** `Access is denied`, sem alteração de `pwdLastSet`.
- As duas contas de teste permaneceram desabilitadas durante a validação.

[Ver procedimento, resultados e três capturas](evidencias/sanitizadas/delegacao-reset-ou/README.md).

### Três tickets documentados no Microsoft Entra ID

| Ticket | Tipo | Resultado documentado |
|---|---|---|
| IAM-001 | Requisição de provisionamento | Criação de EMP0006 e associação ao `GG_FIN_READ`; conferência cadastral complementada em 10/09. |
| IAM-006 | Incidente de autenticação | Investigação de senha expirada, recuperação e entradas posteriores bem-sucedidas. |
| IAM-007 | Requisição de verificação de MFA | Cadastro do Authenticator e uso em uma entrada confirmados por evidências distintas. |

[Ler os três tickets, evidências e limitações](tickets/05-fila-tickets.md).

### Troubleshooting do acesso ao ADUC

Diagnóstico de indisponibilidade do console, placa virtual desconectada e serviço NAT parado no host, com recuperação do ADUC observada e limitações registradas.

[Ver o relato e as oito capturas](troubleshooting/2026-09-11-aduc-rede-nat/README.md).
