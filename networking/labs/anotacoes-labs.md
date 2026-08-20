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


O IPv6: tem um espaço de endereço maior, de 128 bits, fornecendo 340 undecilhão (ou seja, 340 seguidos por 36 zeros) de endereços possíveis. No entanto, o IPv6 é mais do que, apenas, endereços maiores.

Quando a IETF começou o desenvolvimento de um sucessor para o IPv4, aproveitou para corrigir as limitações do IPv4 e incluir aprimoramentos. Um exemplo é o ICMPv6 (Internet Control Message Protocol versão 6), que inclui a resolução de endereços e a configuração automática de endereços, não encontradas no ICMP para IPv4 (ICMPv4).

O NAT64: (Network Address Translation 64) permite que os dispositivos habilitados para IPv6 se comuniquem com os dispositivos habilitados para IPv4 usando uma técnica de conversão semelhante ao NAT IPv4. Um pacote IPv6 é traduzido para um pacote IPv4 e um pacote IPv4 é traduzido para um pacote IPv6.

Os endereços IPv6 têm 128 bits e são escritos como uma sequência de valores hexadecimais. Cada 4 bits são representados por um único dígito hexadecimal, totalizando 32 valores hexadecimais, como mostra a Figura 1. Os endereços IPv6 não diferenciam maiúsculas e minúsculas e podem ser escritos tanto em minúsculas como em maiúsculas.

<img width="1230" height="751" alt="image" src="https://github.com/user-attachments/assets/84e2b9bd-e18e-420d-8257-10135a3b3bae" />


