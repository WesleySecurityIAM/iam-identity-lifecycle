# Perguntas essenciais — Redes, IAM e PAM


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

### 6. O que é ARP e como ele encontra o endereço MAC correspondente a um IPv4?

---

## IP, máscara, gateway e serviços básicos

### 7. Para que servem endereço IPv4, máscara de sub-rede, gateway padrão e servidor DNS?

### 8. Como determinar se dois endereços IPv4 pertencem à mesma sub-rede?

### 9. Quais sintomas podem aparecer quando IP, máscara ou gateway estão incorretos?

### 10. Qual é a diferença entre IP privado, IP público, APIPA e endereço IP duplicado?

### 11. Como funciona o DHCP e quais configurações ele normalmente entrega ao cliente?

### 12. Como funciona o DNS e para que servem registros A, AAAA, CNAME e SRV?

### 13. O que o NAT faz e por que vários usuários podem aparecer com o mesmo IP público?

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