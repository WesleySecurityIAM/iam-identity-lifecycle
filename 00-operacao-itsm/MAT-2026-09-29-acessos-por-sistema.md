# Matriz geral fictícia — cargos, recursos e acesso por sistema

**Regra vigente no recorte: 29/09/2026.** Define o acesso esperado das nove pessoas do laboratório. Decisão de desenho simulada no [IAM-010](05-fila-tickets.md#iam-010); não comprova execução. Texto reorganizado em 07/10, sem alterar concessões.

RH informa pessoa, área, cargo e situação. Esta matriz define perfil e sistemas previstos. A decisão do ticket autoriza a execução; suas evidências mostram o resultado.

<a id="catalogo-acessos"></a>

## 1. Perfis e recursos

Aplicar à pessoa ativa, com necessidade e decisão registradas. Área, cargo ou OU não concedem acesso automaticamente.

| Área / cargo / responsável simulado | Recurso e necessidade | AD: grupo e permissão | Entra: associação prevista |
|---|---|---|---|
| **Financeiro** / Analista Financeiro / Carlos Lima | `RelatoriosFin`: consultar relatórios | `GG_FIN_READ → DL_FIN_RELATORIOS_READ`; NTFS ReadAndExecute e SMB Read; sem gravação | `GG_FIN_READ`; sem aplicação financeira integrada |
| **Suporte** / Analista de Suporte / Daniela Alves | `SuporteLab`: consultar chamados fictícios | `GG_SUP_TICKET → DL_SUP_TICKET_READ`; NTFS ReadAndExecute e SMB Read; sem gravação | `GG_SUP_TICKET`; sem sistema de chamados integrado |
| **RH** / Analista de RH / Gabriel Nunes | Representar o perfil de RH; recurso de negócio ainda não modelado | Sem conta ou recurso AD previsto nesta fase | `GG_RH_READ`; sem documento/aplicação integrado |
| **TI** / Analista de Sistemas / Fernanda Souza | `ProcedimentosTI`: consultar procedimentos | `GG_TI_READ → DL_TI_PROCEDIMENTOS_READ`; NTFS ReadAndExecute e SMB Read; sem gravação | Planejado para o híbrido; sem concessão cloud vigente para Isabela nesta entrega |

AD e Entra são independentes neste recorte. Associação no Entra não comprova acesso ao arquivo SMB. TI não recebe administração, reset de senhas ou acesso a outras áreas pelo cargo.

<a id="populacao"></a>

## 2. Pessoas e sistemas previstos — 29/09

Usar junto com o catálogo. As ausências abaixo são intencionais; conta encontrada fora desse escopo exige investigação.

| Pessoa | Perfil / situação | AD esperado | Entra esperado |
|---|---|---|---|
| Ana — EMP0001 | Analista Financeiro / ativa | Não provisionar nesta fase | Habilitada; `GG_FIN_READ` |
| Bruno — EMP0002 | Analista de Suporte / ativo | Habilitada; `GG_SUP_TICKET` | Habilitada; `GG_SUP_TICKET` |
| Carla — EMP0003 | Assistente Financeiro / desligada | Não provisionar | Bloqueada; sem concessões departamentais |
| Diego — EMP0004 | Terceiro de Sistemas, TI / encerrado | Expirada desde 29/09 às 08:00 UTC−03:00; Enabled=True compatível com esse controle; sem concessões departamentais | Bloqueada; revogação de sessões requerida; sem concessões departamentais |
| Elisa — EMP0005 | Analista de RH / ativa | Não provisionar nesta fase | Habilitada; `GG_RH_READ` |
| Felipe — EMP0006 | Analista Financeiro / ativo | Habilitada; `GG_FIN_READ` | Habilitada; `GG_FIN_READ` |
| Gabriela — EMP0007 | Analista Financeiro / ativa | Habilitada; OU Financeiro; `GG_FIN_READ`; sem `GG_SUP_TICKET` | Habilitada; `GG_FIN_READ`; sem `GG_SUP_TICKET` |
| Henrique — EMP0008 | Analista de RH / ativo | Não provisionar nesta fase | Habilitada; `GG_RH_READ` |
| Isabela — EMP0009 | Analista de Sistemas / ativa | Habilitada; OU TI; `GG_TI_READ` | Planejado para o híbrido; não criar conta cloud separada nesta fase |

Desligamento ou prazo vencido prevalece sobre o perfil departamental. Carla e Diego não recebem novas concessões. Cargo/recurso ainda sem regra exige **PENDÊNCIA_DE_REGRA** e decisão antes de conceder.

<a id="controles-transversais"></a>

## 3. Contas especiais e restrições

| Categoria | Regra de acesso |
|---|---|
| Terceiros | Responsável, finalidade, início e término; revisar concessões e sessões no encerramento. Expiração AD não agenda bloqueio Entra neste ambiente. |
| Administração | Conta técnica separada; `adm.wesley → GG_AD_SUP_RESET` é delegação específica, fora do perfil comum de TI. |
| Serviço | `svc_relatorio_fin` e tarefa desabilitadas; sem vínculo ao `GG_SVC_RELATORIO_FIN`; esse GG sem vínculo às DL de leitura/escrita. Nova finalidade exige nova decisão. |
| Emergência | Duas contas cloud-only separadas dos grupos departamentais e do piloto híbrido; atribuições conforme [procedimento próprio](PROC-BG-001-acesso-emergencia.md). |
| Convidado | Sponsor, finalidade e prazo; manter encerramento definido na [requisição Guest](REQ-GUEST-001.md); fora da sincronização AD. |
| Internas AD | Administrator, Guest e krbtgt fora da população RH; ausência de matrícula não caracteriza conta órfã. |
| SoD | No exercício fictício, manutenção de fornecedor + aprovação de orçamento pela mesma pessoa no mesmo escopo é conflito. `GG_FIN_READ` não concede esses direitos. [Regra do microcaso](../evidencias/sanitizadas/IAM-010/14-sod-resultado.md). |

<a id="uso-nos-tickets"></a>

<details>
<summary>Versões e referência nos tickets</summary>

- **IAM-001:** [regra original do cargo](../evidencias/sanitizadas/IAM-001/EV-IAM-001-02-regra-matriz.csv). **IAM-002:** [RH e decisão de 28/09](05-fila-tickets.md#iam-002-regra-acesso). **IAM-011:** [admissão e decisão de 15/09](05-fila-tickets.md#iam-011).
- **IAM-003/004:** desligamento/prazo individual prevalece sobre o cargo. **IAM-005:** perfil próprio da rotina, com retirada posterior no IAM-010. **IAM-008/009:** regra financeira e configuração consultada em 17/09.
- **IAM-010:** [regra de 28/09](REV-2026-09-28-escopo-reconciliacao.md) na primeira comparação; matriz de 29/09, com TI, no [fechamento AD](../evidencias/sanitizadas/IAM-010/17-conferencia-final-ad.md). O comparador histórico de três grupos não aplica automaticamente esta versão.
- **IAM-006/007:** autenticação comprovada por logs e verificações de senha/MFA; sem mudança da regra de recursos.

Esta consolidação não é aprovação retroativa. Datas, ações, testes e limites permanecem nos [tickets e suas evidências](05-fila-tickets.md).

</details>
