# Reconciliação ampliada — conferência inicial de 28/09/2026

Coleta inicial de 28/09/2026, anterior à definição completa do escopo por sistema. Nenhuma conta ou permissão foi alterada nesta conferência. Tratamentos e fechamento em 29/09: [índice](README.md).

## Fontes e população

- RH vigente: 9 pessoas. Fonte de 28/09 preservada na coleta privada.
- AD: 9 contas, 7 grupos GG/DL e 8 associações diretas. Horário declarado: 28/09/2026 15:52:51 -03:00.
- Entra: 12 contas na exportação de 12:04; Financeiro e Suporte exportados às 12:08, reaproveitados do Mover. RH coletado à tarde (arquivo recebido às 15:50). Não é uma fotografia simultânea dos dois sistemas.
- Entra GG_RH_READ: Elisa Martins e Henrique Oliveira; os dois IDs correspondem ao inventário de usuários.
- Chaves de objetos e matrículas preenchidas sem duplicidade nas fontes conferidas. As associações AD referenciam objetos presentes nos inventários. Isto valida a consistência dos arquivos, não a completude de toda coleta do diretório.

## Comparação calculada

Foram avaliadas 34 regras de cadastro nas contas com matrícula: habilitação conforme status RH, departamento e cargo para pessoas ativas. Resultado: 0 divergências nessas regras. Contas sem matrícula não entraram nessa contagem.

| Sistema | Matrículas encontradas | Pessoas do RH sem conta observada |
|---|---|---|
| AD | EMP0002, EMP0004, EMP0006, EMP0007 | EMP0001, EMP0003, EMP0005, EMP0008, EMP0009 |
| Entra | EMP0001 a EMP0008 | EMP0009 |

Ausência observada não significa automaticamente falha de provisionamento: é preciso definir em qual sistema cada pessoa necessita de conta. Carla está desligada; EMP0009 ainda depende de definição explícita de escopo.

## Achados na coleta

| Objeto | Observação |
|---|---|
| Bruno | Cadastro de Suporte no AD; GG_SUP_TICKET sem membros. A necessidade de concessão ainda dependia da definição de escopo. |
| Gabriela | Financeiro/Analista Financeiro; membro de GG_FIN_READ e ausente de GG_SUP_TICKET; DistinguishedName ainda em OU=Suporte. |
| svc_relatorio_fin | Desabilitada e membro de GG_SVC_RELATORIO_FIN, conforme estado entregue no IAM-005. Associação não comprova autenticação ou sessão ativa. |
| Diego | Enabled=True; AccountExpirationDate=01/10/2026 00:00:00 no texto exportado, antes da antecipação do prazo. |
| Contas sem matrícula | AD: Administrator, Guest, krbtgt, adm.wesley e svc_relatorio_fin. Entra: administrador, duas contas de emergência e convidado. A coleta não verifica owner, papel administrativo ou necessidade atual. |

CSVs originais privados; manifesto com origem, destino e SHA-256.

Etapas posteriores: [decisão de escopo de 28/09](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md), [comparação de grupos](07-comparacao-populacao-grupos.md) e [decisões por associação](08-recertificacao-simulada.md).
