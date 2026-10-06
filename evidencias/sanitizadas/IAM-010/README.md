# IAM-010 — Recertificação: da população ao tratamento e fechamento

**Fechado em 29/09/2026.** A revisão começou com inventários de 28/09, definiu o esperado por sistema e registrou decisões por associação. Os achados foram tratados nos blocos abaixo. O microcaso SoD usa dados fictícios separados dos diretórios. A conferência final AD encontrou oito associações conformes, zero ausentes e zero excedentes no recorte avaliado.

**Como acompanhar:** leia primeiro a origem e as regras; depois abra o tratamento que deseja conferir. Cada página reúne as provas daquele assunto, com antes, ação/decisão, resultado e limites. Os números são identificadores preservados dos arquivos, não uma sequência única de execução.

## 1. Origem da revisão e definição do esperado

| Etapa | Documento | Propósito e alcance |
|---|---|---|
| Inventário inicial — 28/09 | [01 — Fontes, população e achados](01-inventario-conferencia-inicial.md) | Identificar contas e grupos observados; 34 verificações de cadastro. Ainda não demonstra necessidade de acesso. |
| Regra adotada — 28/09 | [Decisão de escopo](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md) | Definir contas e acessos esperados por sistema após analisar o inventário. Fundamenta Bruno e o complemento de OU de Gabriela. |
| Cobertura ampliada — 29/09 | [Matriz consolidada](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md) | Incluir TI; distinguir pessoas, contas especiais e sistemas. A versão posterior não altera os resultados históricos de 28/09. |

O inventário descreve **o observado**; RH e matriz definem **o esperado**; a recertificação registra **a decisão sobre continuar precisando do acesso**. As fontes de cada momento estão identificadas nos relatórios. CSVs brutos e manifestos permanecem privados.

## 2. Reconciliação e decisão por acesso

| Etapa | Documento | Resultado documentado |
|---|---|---|
| Comparação departamental — 28/09, após tratar Bruno | [07 — População e grupos versus matriz](07-comparacao-populacao-grupos.md) | Nove associações conformes em AD + Entra; seis ausências de contas intencionais. TI ainda não fazia parte deste recorte. |
| Recertificação e acompanhamento | [08 — Decisões por associação](08-recertificacao-simulada.md) | Quinze associações: inicialmente doze manter e três investigar. As três do serviço foram depois decididas como remover. As duas relações de TI são um complemento identificado separadamente. |

Esses dois documentos abrangem várias pessoas porque a unidade da revisão é a população. Eles não substituem o teste individual de um usuário nem significam revisão de todas as permissões do ambiente.

## 3. Tratamentos, cada um com suas próprias provas

| Assunto | Abrir para acompanhar | Provas daquele assunto |
|---|---|---|
| Bruno — conceder leitura de Suporte | [06 — Antes, concessão e testes](06-tratamento-validacao-ad.md) | 02: grupo ausente; 03: grupo presente; 04: conexão e leitura; 05: criação negada. A comparação coletiva ao final é identificada separadamente. |
| Serviço — retirar concessões residuais | [10 — Decisão, dependências e retirada](10-servico-remocao-concessoes.md) | 11: vínculos ainda presentes; 12: dependências locais; 13: três vínculos ausentes e acesso humano preservado na DL. Conta mantida desabilitada. |
| TI/Isabela — implementar a nova regra | [TI — Cadastro, grupos, permissões e testes](ti-isabela/README.md) | Seis capturas exclusivas: identidade, GG/DL, ACL/SMB, conexão/leitura, criação negada e identificação SMB. Implementação somente no AD. |

## 4. Microcaso SoD — exercício separado

[14 — Regra, decisão e resultado antes/depois](14-sod-resultado.md) reúne as capturas **15–16**: um conflito no caso A+B, depois zero, preservando a aprovação de orçamento. O [roteiro 09](09-roteiro-sod.md) explica a execução e aponta o script. Os cinco cenários são alternativos; não representam permissões financeiras reais de Gabriela nem concessões de `GG_FIN_READ`.

## 5. Conferência final e fechamento

[17 — Comparação final AD](17-conferencia-final-ad.md): coleta de 29/09 às 17:24:44–17:24:48, RH e matriz vigentes, dez contas e oito associações conformes; TI presente e vínculos de serviço ausentes.

A [captura 18](18-resumo-coleta-final-ad.png) comprova **a coleta e suas contagens**. O resultado de zero ausentes/excedentes está no relatório 17, obtido da comparação posterior dos arquivos; não é uma saída de reconciliação exibida na captura. Não houve nova coleta Entra neste fechamento.

## Referências necessárias a outros tickets

| Dependência | Por que aparece aqui | Onde está a prova própria |
|---|---|---|
| Gabriela — OU Financeiro | Achado do inventário, tratado como complemento do Mover; a coleta posterior confirma a localização. | [IAM-002 — complemento de OU](../IAM-002/README.md#complemento--movimentação-de-ou-em-2809). Consultar somente as provas 24–28 para este encaminhamento. |
| Diego — encerramento por prazo | A recertificação acompanha a conclusão; a causa do encerramento é a vigência do terceiro. | [IAM-004 — encerramento](../IAM-004/README.md). Não se repete sua prova de autenticação no caso de Bruno ou de TI. |
| Serviço — rotina encerrada | Explica por que revisar os vínculos residuais encontrados. | [IAM-005 — finalidade e encerramento da rotina](../IAM-005/README.md). A retirada posterior pertence às provas 10–13 deste IAM-010. |

Os testes de cada tratamento não comprovam todos os controles do diretório. O preparo de identidade híbrida é um encaminhamento posterior, registrado na [análise de estrutura](../../../00-operacao-itsm/REV-2026-09-29-estrutura-hibrida.md), e não uma evidência de sincronização executada.

[Voltar ao ticket IAM-010](../../../00-operacao-itsm/05-fila-tickets.md#iam-010).
