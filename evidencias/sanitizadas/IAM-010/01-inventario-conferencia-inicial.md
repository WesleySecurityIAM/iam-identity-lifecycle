# Reconciliação ampliada — conferência inicial de 28/09/2026

**Registro histórico da coleta inicial de 28/09.** Naquele momento, a coleta estava organizada e o cadastro comparado; a matriz completa por sistema e a classificação de concessões ainda estavam pendentes. Nenhuma conta ou permissão foi alterada nesta conferência. Os tratamentos posteriores e o fechamento de 29/09 estão no [índice por assunto](README.md).

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

## Achados naquele momento e encaminhamento

1. Bruno: cadastro de Suporte no AD e GG_SUP_TICKET sem membros. Validar se a matriz exige leitura de SuporteLab para ele; só então classificar como acesso ausente e registrar eventual concessão.
2. Gabriela: Financeiro/Analista Financeiro, membro de GG_FIN_READ e ausente de GG_SUP_TICKET. DistinguishedName ainda contém OU=Suporte. O Mover não prometeu mudança de OU; avaliar separadamente dependências de GPO/delegação antes de mover o objeto.
3. Serviço: svc_relatorio_fin está desabilitada e continua em GG_SVC_RELATORIO_FIN. Coerente com o estado final documentado do IAM-005; associação não prova autenticação nem sessão ativa.
4. Diego: Enabled=True e AccountExpirationDate=01/10/2026 00:00:00, conforme texto exportado. A antecipação da expiração ainda não foi executada. Confirmar fuso da VM ao definir o teste.
5. Classificar as contas sem matrícula: no AD, Administrator, Guest, krbtgt, adm.wesley e svc_relatorio_fin; no Entra, administrador, duas contas de emergência e convidado. Tipos conhecidos pelo contexto do laboratório; a coleta não verifica owner, papel administrativo ou necessidade atual.

## Encaminhamento registrado em 28/09

Definir uma matriz explícita de população e concessões por sistema, concluir a comparação de grupos com essa matriz e testar o comparador com amostras separadas (acesso ausente, excedente, matrícula duplicada e fonte faltante). Não criar erros no ambiente para produzir evidência. Não apresentar este relatório como recertificação ou reconciliação integral concluída.

Os CSVs originais ficam privados. O inventário Entra inclui campos que não devem ser publicados integralmente. O manifesto registra origem, destino e SHA-256 dos arquivos preservados.

**Continuação documentada:** [decisão de escopo de 28/09](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md), [comparação de grupos](07-comparacao-populacao-grupos.md) e [decisões por associação](08-recertificacao-simulada.md). As pendências acima descrevem a origem da revisão, não o estado final do ticket.
