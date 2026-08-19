# Perguntas BASE — Redes, IAM e PAM


# Bloco 1 — Redes e diagnóstico

### 1. Qual é a diferença entre cliente, servidor e serviço?
A estrutura cliente-servidor é um modelo de arquitetura, os computadores são divididos em dois grupos: 
servidores, que fornecem serviços ou recursos, e clientes, que solicitam estes serviços e recursos,
recebendo-os como respostas. A comunicação entre os dois é feita por meio de protocolos de rede, como 
TCP/IP, e é geralmente realizada pela internet ou por uma rede privada.

### 2. Qual é a função de um switch, roteador, access point e firewall?
Switch: Conecta dispositivos dentro da mesma rede local (LAN) e distribui o tráfego de dados entre eles. 

Roteador: Conecta redes diferentes (LAN local + WAN internet) e traduz endereços IP para direcionar pacotes de dados. 

Access Point: Cria uma rede local sem fio (WLAN) e conecta dispositivos sem fio à rede com fio. 

Firewall: Protege a rede interna contra acessos não autorizados e ameaças externas. 
Esses dispositivos trabalham em conjunto para garantir que a comunicação na rede seja eficiente, segura e organizada.


### 3. Qual é a diferença entre LAN, WLAN e WAN?
LAN: conecta dispositivos em uma área geográfica limitada, como um escritório, casa ou prédio. Ela utiliza conexões
físicas, como cabos Ethernet ou Wi-Fi, para permitir comunicação rápida e segura entre dispositivos próximos. A LAN
é ideal para redes privadas, como em pequenas empresas ou residências, devido à sua alta velocidade e baixa latência.

WAN: por outro lado, conecta várias LANs em uma área geográfica ampla, como cidades, países. Ela utiliza conexões virtuais, como VPNs, MPLS ou linhas alugadas, frequentemente baseadas na infraestrutura da Internet. A WAN é usada por organizações para conectar filiais, acessar serviços em nuvem e compartilhar dados entre locais diferentes.

WLAN, ou Rede Local Sem Fio, é uma tecnologia que permite a conexão de dispositivos eletrônicos, como computadores e smartphones, sem a necessidade de cabos físicos. Essa tecnologia utiliza ondas de rádio para transmitir dados, permitindo que dispositivos se conectem e compartilhem recursos em uma área específica, como uma casa ou escritório. A WLAN é frequentemente associada ao padrão Wi-Fi.
### 4. Quando dois dispositivos estão na mesma sub-rede, eles utilizam o gateway para se comunicar?



### 5. Qual é a diferença entre um endereço MAC e um endereço IP?
endereço MAC: Físico e Fixo: Vem gravado de fábrica na peça de hardware pelo criador do aparelho e não muda nunca. Rede Local: Funciona apenas para achar os aparelhos dentro da mesma rede pequena, como o Wi-Fi da sua casa.Formato: Usa letras e números separados por dois pontos (por exemplo: 00:1A:2B:3C:4D:5E).

Endereço IP: Lógico e Variável: É dado pelo seu roteador ou provedor de internet e pode mudar toda vez que você se conecta.  Rede Global: Permite que dados viajem por redes grandes e cheguem até a internet.  Formato: Pode ser numérico em blocos como 192.168.1.1 (IPv4) ou em formato mais longo (IPv6).


### 6. O que é ARP e como ele encontra o endereço MAC correspondente a um IPv4?

---

## IP, máscara, gateway e serviços básicos

### 7. Para que servem endereço IPv4, máscara de sub-rede, gateway padrão e servidor DNS?
IPv4: é um endereço de rede lógico que identifica um host específico. Ele deve ser configurado corretamente e de forma exclusiva dentro da LAN, para fornecer comunicação local. Também deve ser configurado corretamente e de forma exclusiva no mundo, para fornecer comunicação remota. É assim que um host se comunica com outros dispositivos na Internet.
MASCARA DE SUB-REDE: é um tipo especial de endereço IPV4 que, associado ao endereço IP,
determina a sub-rede no qual o dispositivo faz parte. e o numero da rede é o numero dos 3 primeiros conjutos do ipv4 com a mascara de rede padrao 255.255.200.0

### 8. Como determinar se dois endereços IPv4 pertencem à mesma sub-rede?

### 9. Quais sintomas podem aparecer quando IP, máscara ou gateway estão incorretos?

### 10. Qual é a diferença entre IP privado, IP público, APIPA e endereço IP duplicado?
IP publico: são endereço roteados globalmente entre roteadotes e provedores de internet.
IP privado: endereços que são usados pelas maioria das organizações para atribuir endereços IPV4
a hosts internos.


### 11. Como funciona o DHCP e quais configurações ele normalmente entrega ao cliente?

### 12. Como funciona o DNS e para que servem registros A, AAAA, CNAME e SRV?

### 13. O que o NAT faz e por que vários usuários podem aparecer com o mesmo IP público?
O NAT: é usado para converter entre endereços IPv4 privados e IPv4 públicos. Isso geralmente é feito no roteador que conecta a rede interna à rede ISP. Os endereços IPv4 privados na intranet da organização serão traduzidos para endereços IPv4 públicos antes do encaminhamento para a Internet.
---

## TCP, UDP, portas e HTTPS

### 14. Qual é a diferença entre TCP e UDP?

### 15. O que são porta, socket e serviço de rede?

### 16. Por que um servidor pode responder ao ping, mas não responder na porta 443?

### 17. Quais serviços utilizam normalmente estas portas?

| Porta | Serviço |
|---:|---|
| 22/TCP | SSH |
| 53/TCP e UDP | DNS |
| 67/68 UDP | DHCP |
| 80/TCP | HTTP |
| 88/TCP e UDP | Kerberos |
| 123/UDP | NTP |
| 389/TCP e UDP | LDAP/DC Locator |
| 443/TCP | HTTPS |
| 445/TCP | SMB |
| 636/TCP | LDAPS |
| 3268/TCP | Global Catalog |
| 3269/TCP | Global Catalog sobre TLS |
| 3389/TCP e UDP | RDP |
| 5985/5986 TCP | WinRM |
| 1812/1813 UDP | RADIUS |

### 18. Como funciona o HTTPS e o que um certificado TLS comprova?

### 19. Ao testar um serviço, o que significam timeout, conexão recusada, erro TLS, HTTP 401 e HTTP 
### 403, e por que uma porta aberta não garante que TLS ou a aplicação estejam funcionando?

---

## Roteamento e controles

### 20. Como um roteador escolhe uma rota utilizando sua tabela de roteamento?

### 21. Qual é a diferença entre sub-rede, VLAN, ACL e firewall?

### 22. Para que servem VPN, proxy direto, proxy reverso, DMZ e IDS/IPS?

---

## Ferramentas e ordem de diagnóstico

### 23. O que estes comandos ajudam a verificar e o que cada resultado não comprova?

```powershell
ipconfig /all
ping
tracert
nslookup
Resolve-DnsName
arp -a
route print
Test-NetConnection servidor -Port 443
curl.exe -I -v https://servidor

#24. Qual é a ordem correta para investigar uma falha de acesso?

Sintoma e escopo  
→ conexão local/VPN  
→ IP e máscara  
→ gateway e rota  
→ DNS  
→ porta TCP/UDP  
→ firewall/ACL  
→ TLS, certificado e proxy  
→ serviço  
→ autenticação  
→ MFA e políticas  
→ autorização  
→ logs e evidências

> Status: resposta inicial — completar durante os módulos 15–17 e revisar nas semanas de autenticação e Microsoft Entra.

Como diferenciar esses endereços IPv4
Tipo	Faixa principal	Como reconhecer	Para que serve
Privado	10.0.0.0/8	Começa com 10	Redes internas
Privado	172.16.0.0 até 172.31.255.255	Segundo número entre 16 e 31	Redes internas
Privado	192.168.0.0/16	Começa exatamente com 192.168	Redes internas
Link-local/APIPA	169.254.0.0/16	Começa com 169.254	Configuração automática quando o DHCP falha
Loopback	127.0.0.0/8	Começa com 127	Testar o próprio computador
Experimental	240.0.0.0/4	Primeiro número entre 240 e 255	Reservado; não usado normalmente
Público	Fora das faixas reservadas	Não pertence às faixas especiais	Pode ser roteado pela Internet


Exemplos:
- 10.1.1.1 → privado.
- 172.16.4.4 → privado.
- 172.32.5.2 → não é privado, pois passou de 172.31.
- 192.168.5.5 → privado.
- 192.167.10.10 → não é privado, pois não começa com 192.168.
- 169.254.1.5 → link-local/APIPA.
- 127.0.0.1 → loopback, também chamado de localhost.
- 240.2.6.255 → experimental.
- 198.133.219.2 → público.
Uma forma rápida de memorizar:
Privados: 10, 172.16–31 e 192.168.
APIPA: 169.254.
Loopback: 127.
Experimental: 240–255.

Observação importante: um endereço público pode ser roteável pela Internet, mas isso não garante que esteja acessível. Firewall, rota, porta fechada ou serviço indisponível ainda podem impedir a conexão.
