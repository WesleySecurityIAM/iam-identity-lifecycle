# ADUC indisponível com rede virtual desconectada

**Data:** 11/09/2026 · **Ambiente:** laboratório fictício · **Resultado:** acesso ao console e aos objetos do AD restabelecido.

O Active Directory Users and Computers (ADUC) não abria o domínio `empresa.lab`. O diagnóstico mostrou a placa `Ethernet0` desconectada na VM e o serviço `VMware NAT Service` parado no notebook. Após a orientação para iniciar esse serviço, o operador informou a recuperação e apresentou o console aberto nas propriedades de Diego Rocha.

## Ambiente e impacto

- Notebook Windows executando VMware Workstation; rede da VM em NAT/VMnet8.
- VM `DC01`, Windows Server 2025, com AD DS e DNS.
- Endereço configurado anteriormente: `192.168.21.10/24`; gateway `192.168.21.2`.
- Impacto observado: impossibilidade de consultar os usuários pelo ADUC durante a sessão de estudo. Não foi constatada exclusão de contas.

## Diagnóstico e evidências

Os horários abaixo vêm dos nomes das capturas de 11/09/2026, no contexto do laboratório em Brasília. Não são timestamps de eventos de serviço nem delimitam toda a duração da indisponibilidade.

| Hora | Observação | Evidência |
|---|---|---|
| 11:14:45 | ADUC: “Naming information cannot be located… The server is not operational.” | [01 - Erro inicial](evidencias/01-aduc-servidor-nao-operacional.png) |
| 11:19:40 | Consulta SRV: `No DNS servers configured for local system`. Nome do DC resolvido localmente para loopback; TCP 389 falhou em `::1` e `127.0.0.1`. | [02 - DNS e LDAP](evidencias/02-dns-e-ldap-loopback-falharam.png) |
| 11:21:54 | `Ethernet0 = Disconnected`; `Media disconnected`. Nenhum listener TCP 389 encontrado naquele instante. | [03 - Placa e listener](evidencias/03-ethernet-desconectada-sem-listener-389.png) |
| 11:25:49 | Placa ainda desconectada, `0 bps`; teste direto a `192.168.21.10:389` falhou, sem interface/endereço de origem apresentados. | [04 - Teste por IP](evidencias/04-teste-ip-389-sem-conexao.png) |
| 11:29:13 | Consulta de serviços executada inicialmente dentro da VM mostrou VMware Tools; não era a consulta dos serviços de rede do notebook. | [05 - Contexto da consulta](evidencias/05-servicos-vmware-tools-no-guest.png) |
| 11:30:14 | No notebook: `VMware NAT Service = Stopped`; `VMware DHCP Service = Running`. | [06 - Serviço NAT parado](evidencias/06-servico-nat-parado-no-host.png) |
| 11:35:23 | ADUC novamente acessível; propriedades de Diego: cargo Terceiro de Sistemas, departamento TI. | [07 - Recuperação do console](evidencias/07-aduc-recuperado-cargo-departamento.png) |
| 11:35:47 | Consulta dos atributos de Diego: `employeeID = EMP0004` e caminho contendo `OU=Terceiros`. | [08 - Consulta de objeto recuperada](evidencias/08-aduc-recuperado-matricula-ou.png) |

O operador também informou que NTDS, DNS, Netlogon, Kdc e ADWS estavam em `Running`, e que Connected, Connect at power on e NAT estavam selecionados. Não há captura dessas duas verificações neste conjunto. A reconexão pelo seletor Connected foi orientada; a consulta seguinte continuou mostrando a placa desconectada.

## Correção aplicada no atendimento

A ação orientada foi iniciar o serviço NAT **no Windows do notebook**, em PowerShell como administrador:

```powershell
Start-Service -Name "VMware NAT Service"
Get-Service -Name "VMware NAT Service"
```

Em seguida, foi solicitado o reteste **dentro da VM**:

```powershell
Get-NetAdapter
Test-NetConnection 192.168.21.10 -Port 389
```

O operador respondeu que o acesso voltou e enviou as evidências 07 e 08. A execução do `Start-Service` e as saídas dos dois retestes não foram capturadas; o resultado demonstrado é a recuperação do ADUC e da consulta ao objeto. Não foi necessária, no procedimento registrado, alteração de IP, DNS, firewall ou recriação do domínio.

## Por que essa correção fez sentido

O serviço NAT pertence ao host e participa da rede NAT usada pela VM. Uma configuração correta dentro do Windows Server não substitui o funcionamento da infraestrutura virtual no notebook. Encontrar o serviço parado justificou iniciá-lo e retestar antes de modificar o AD.

DNS permite localizar o controlador; LDAP, na porta TCP 389, permite consultar e alterar objetos conforme as permissões. Durante a falha, havia problemas de conectividade e descoberta, não evidência de credenciais inválidas. Um serviço em `Running` não garante, sozinho, que esteja pronto para aceitar conexões.

O LDAP local não depende de acesso à internet por NAT. Portanto, não se conclui que toda parada do NAT derrube o LDAP ou desconecte uma placa virtual. **Neste caso, o serviço NAT parado foi o achado corrigido e a recuperação do console ocorreu depois da ação orientada.** O motivo original da parada e o mecanismo exato que deixou a placa desconectada não foram determinados.

## Fechamento e limites

- **Confirmado por capturas:** erro no ADUC, placa desconectada, falhas de DNS/TCP, ausência de listener na consulta, NAT parado no host e posterior consulta ao objeto no ADUC.
- **Informado pelo operador:** recuperação após a orientação para iniciar o NAT; cinco serviços do AD em execução.
- **Não comprovado neste conjunto:** reteste TCP 389 positivo, placa `Up` após a correção, saída do NAT em `Running`, causa da parada, persistência da correção após reinicialização ou acesso de usuário a uma pasta.
- A captura de atributos é prova da consulta ao objeto, não de teste de autorização ao recurso.
- Se houver recorrência, coletar o tipo de inicialização e os eventos do Service Control Manager no host, além do `vmware.log`, antes de atribuir a falha a bug ou configuração. Preservar logs brutos em área privada.

## Aprendizado

Investigar na ordem **console → serviços → DNS → conectividade → placa virtual → serviços do host** evitou alterações desnecessárias no domínio. Distinguir host e VM foi decisivo: VMware Tools dentro do guest não informa o estado do serviço NAT do notebook.

## Referências

- [Microsoft: diagnóstico da localização de controladores de domínio](https://learn.microsoft.com/en-us/troubleshoot/windows-server/windows-security/troubleshoot-domain-controller-location-issues).
- [Broadcom: diagnóstico de rede em máquinas virtuais VMware Workstation](https://knowledge.broadcom.com/external/article?legacyId=1008367).

As referências fundamentam o método; os resultados deste caso vêm das capturas e do relato do operador. As oito imagens foram mantidas sem edição e renomeadas apenas para organização. Contas e domínio pertencem ao laboratório fictício; IP privado e MAC virtual foram mantidos como contexto técnico. O manifesto registra os nomes originais e hashes SHA-256.
