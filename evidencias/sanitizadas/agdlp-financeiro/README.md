# Acesso de leitura a relatórios financeiros por grupos do AD

Em 14/09/2026, Felipe conseguiu ler um relatório fictício e teve a criação de arquivo negada; Bruno autenticou no servidor e teve a leitura negada. O objetivo foi disponibilizar relatórios ao perfil financeiro com acesso somente de leitura.

## Configuração e evidências

Laboratório `empresa.lab`, em `DC01`, com testes SMB pelo notebook. A pasta `C:\IAM-Lab\Relatorios-Financeiros` foi publicada como `RelatoriosFin`.

```text
felipe.gomes → GG_FIN_READ (Global / Security)
            → DL_FIN_RELATORIOS_READ (DomainLocal / Security)
            → leitura NTFS na pasta, subpastas e arquivos
```

| Verificação | Estado observado | Evidência |
|---|---|---|
| Identidade | Felipe, EMP0006, habilitado; Analista Financeiro, departamento e OU Financeiro. | [01 — Atributos no AD](01-felipe-ad-atributos-emp0006.png) |
| Grupos | Felipe no GG; GG como membro do DL. | [02 — Escopos e membros](02-grupos-agdlp-escopos-e-membros.png) |
| NTFS | DL com ReadAndExecute/Synchronize; SYSTEM e Administrators com FullControl. Herança da pasta superior desabilitada; entradas propagáveis aos itens internos. | [03 — Permissões e herança](03-permissoes-ntfs-e-heranca.png) |
| Sharing | Domain Users: Read; Domain Admins: Full. | [04 — Compartilhamento SMB](04-compartilhamento-smb-e-permissoes.png) |
| Felipe | Conexão aceita; leitura permitida; criação de arquivo negada. | [05 — Teste positivo e negativo](05-felipe-leitura-permitida-escrita-negada.png) |
| Bruno | Conexão ao IPC$ aceita; leitura do relatório negada. | [06 — Autenticação e negação](06-bruno-autenticado-leitura-negada.png) |

## Procedimento e limites

Configuração conferida com `Get-ADUser`, `Get-ADGroup`, `Get-ADGroupMember`, `Get-Acl`, `Get-SmbShare` e `Get-SmbShareAccess`. Os testes usaram `net use` com senha solicitada por `*`, `type` para leitura e redirecionamento para tentar criar um arquivo. O procedimento separa as conexões de Felipe e Bruno; o encerramento da conexão anterior não aparece nas capturas.

- A escrita foi negada na combinação Sharing + NTFS; o teste não isola qual camada a bloqueou nem testa alteração ou exclusão de arquivo existente.
- O primeiro PathNotFound de Felipe foi resolvido após corrigir a extensão duplicada `.txt.txt`, conforme relato do operador. No teste de Bruno, a saída apresenta Access denied e também PathNotFound; não indica exclusão do arquivo.
- As capturas mostram a ACL da pasta, sem uma exportação separada da ACL do arquivo. Foram preservadas sem edição e sem valores de senha.
- A preparação usou senhas definidas pelo administrador, sem troca obrigatória pendente, para os testes SMB. Não demonstra troca pelo próprio usuário.
- O DC hospeda o arquivo somente por limitação do laboratório. Felipe no AD e no Entra permanece como contas independentes; este caso não comprova sincronização nem altera a data de fechamento do IAM-001.

[Voltar às entregas](../../../README.md)
