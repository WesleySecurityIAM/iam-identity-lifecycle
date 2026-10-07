# IAM-010 — Recertificação: inventário, decisões, tratamentos e fechamento

**Fechado em 29/09/2026.** A revisão começou com os inventários de 28/09. Definiu o esperado por sistema, tratou achados e registrou decisões por associação. A conferência final AD encontrou oito associações conformes, zero ausentes e zero excedentes no recorte avaliado. SoD foi um exercício local separado.

**Como ler:** siga as etapas datadas abaixo. Cada tratamento abre uma página com suas próprias provas. Os números dos arquivos são identificadores preservados; a sequência dos fatos é a das etapas. Comparações coletivas ficam separadas dos testes individuais.

<a id="inventario-e-regra"></a>

## 1. Inventariar e definir o esperado — 28/09

| Abrir | Por que foi necessário |
|---|---|
| [01 — Fontes, população e achados](01-inventario-conferencia-inicial.md) | Levantar o observado: nove pessoas no RH, nove contas AD, doze no Entra e 34 verificações cadastrais. Não demonstra necessidade de acesso. |
| [Decisão de escopo de 28/09](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md) | Definir acesso de Suporte para Bruno, alinhamento de OU de Gabriela e ausências intencionais por sistema. A regra foi estabelecida nesta revisão. |

<a id="tratamentos-2809"></a>

## 2. Tratar os achados e testar — 28/09, antes da comparação final do dia

| Ordem dos tratamentos | Abrir somente o assunto | Provas e propósito |
|---|---|---|
| Gabriela — 16:20–16:35 | [Complemento de OU no IAM-002](../IAM-002/README.md#complemento-ou) | 24–28: OU antes/depois, identidade preservada e retestes. O link abre essa etapa do Mover, sem repetir as capturas aqui. |
| Bruno — 16:41–16:57 | [06 — Concessão e testes de Suporte](06-tratamento-validacao-ad.md) | 02–05: ausência do grupo → inclusão → conexão/leitura → criação negada. A página contém somente as provas de Bruno. |
| Nova coleta — 16:59:31 | [06b — Comparação coletiva AD](06b-comparacao-coletiva-ad.md) | Confirma as duas mudanças entre coletas: associação de Bruno e OU de Gabriela. Por ser comparação de população, reúne os dois resultados. |

<a id="comparacao-e-decisoes-2809"></a>

## 3. Comparar os grupos e registrar decisões — 28/09

| Abrir na ordem | Resultado e alcance |
|---|---|
| [07 — População e grupos versus matriz](07-comparacao-populacao-grupos.md) | Usa a coleta posterior aos tratamentos: nove associações departamentais conformes em AD + Entra; seis ausências de contas previstas. TI ainda não fazia parte desse recorte. |
| [08 — Decisões iniciais por associação](08-recertificacao-simulada.md#decisoes-2809) | Quinze associações: doze manter e três investigar, estas da rotina encerrada. Não é uma lista de quinze pessoas. |

RH e matriz definem o **esperado**; inventários mostram o **observado**; a recertificação registra se o acesso **continua necessário**. Esses relatórios abrangem a população porque essa é a unidade da revisão; não substituem os testes individuais.

<a id="encerramentos-2909"></a>

## 4. Concluir os encaminhamentos de encerramento — 29/09, manhã

| Assunto e horário | Abrir | O que procurar |
|---|---|---|
| Diego — 11:08–11:58 | [IAM-004 — efeito da expiração e encerramento](../IAM-004/README.md#validacao-ad) | Encerramento pelo prazo do terceiro: autenticação AD recusada, bloqueio/revogação Entra e contadores finais. Não foi encerrado por faltar TI na matriz. |
| Serviço — 12:08–12:14; formalização às 12:23:24 | [10 — Dependências, retirada e registro da decisão](10-servico-remocao-concessoes.md) | 11–13: vínculos presentes → dependências locais → três vínculos ausentes. Conta desabilitada e GG_FIN_READ preservado. A formalização posterior está identificada. |

O IAM-005 fornece a finalidade da rotina encerrada; suas execuções de 15/09 não são testes novos desta retirada. Não houve reteste de acesso humano nessa operação.

<a id="cobertura-ti"></a>

## 5. Completar a cobertura de TI e validar Isabela — 29/09

| Abrir na ordem | Motivo e resultado |
|---|---|
| [Matriz consolidada de 29/09](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md) | Tratar a lacuna de TI, separar contas especiais e definir leitura de procedimentos sem privilégio administrativo pelo cargo. Não altera retroativamente a comparação de 28/09. |
| [TI/Isabela — cadastro, grupos, recurso e testes](ti-isabela/README.md) | 01–06, entre 16:28 e 16:54: identidade → GG/DL → ACL/SMB → leitura → criação negada → identificação complementar da conexão. Somente AD. |
| [Decisão complementar de TI](08-recertificacao-simulada.md#cobertura-ti-2909) | Manter as duas novas associações, separadas das quinze relações históricas. Entra e sincronização permanecem planejados. |

A matriz é uma revisão documental de 29/09 sem horário intradiário comprovado neste índice. Os horários acima descrevem a implementação, sem inventar um instante para a aprovação.

<a id="sod"></a>

## 6. Avaliar e tratar o conflito SoD — 29/09, 17:06–17:10

[14 — Regra, decisão e antes/depois](14-sod-resultado.md): capturas **15–16**, um conflito A+B, depois zero, mantendo a aprovação de orçamento. O [roteiro 09](09-roteiro-sod.md) e o script explicam como a comparação foi feita.

São cinco cenários alternativos em dados fictícios; não representam direitos reais de Gabriela em uma aplicação nem permissões concedidas por GG_FIN_READ.

<a id="fechamento"></a>

## 7. Coletar novamente, comparar e encerrar — 29/09

1. [18 — Resumo da coleta final AD](18-resumo-coleta-final-ad.png), 17:24:44–17:24:48: dez contas, nove grupos, oito associações e tarefa desabilitada. A captura informa que a comparação seria feita depois.
2. [17 — Comparação dos arquivos com RH e matriz](17-conferencia-final-ad.md): oito associações conformes, zero ausentes/excedentes, TI presente e vínculos retirados do serviço ausentes.

A coleta vem antes da comparação, mesmo com os identificadores 18 e 17. Não houve nova coleta Entra neste fechamento. O resultado é limitado aos campos e associações exportados; não revalida todas as ACLs, sessões ou privilégios.

O preparo híbrido é um encaminhamento posterior na [análise de estrutura](../../../00-operacao-itsm/REV-2026-09-29-estrutura-hibrida.md), não evidência de sincronização executada. CSVs brutos e manifestos permanecem privados.

[Voltar ao ticket IAM-010](../../../00-operacao-itsm/05-fila-tickets.md#iam-010).
