# PROC-BG-001 — Validação administrativa de emergência

**Objetivo:** testar duas identidades alternativas para administrar o Entra. **Resultado em 24/09/2026:** `bg-lab-01` criou um grupo sem membros; `bg-lab-02` alterou sua descrição e o excluiu. As três contas tiveram entrada bem-sucedida no Azure Portal. Capturas complementares comprovam MFA por notificação na bg-lab-01 e por código OATH na bg-lab-02. **Limite:** uso efetivo da passkey e independência do caminho de recuperação ainda não comprovados.

## Evidências

| Prova | O que demonstra |
|---|---|
| [01 — Contas](01-contas-emergencia.png) | Duas contas Member, no domínio onmicrosoft.com, sem sincronização local indicada. |
| [02 — Privilégio](02-atribuicoes-global-administrator.png) | Administrador habitual e duas contas de emergência com atribuição direta de Global Administrator no diretório. |
| [03 — Criação](03-bg01-criacao-grupo.png) | Sessão bg-lab-01; grupo LAB-BG-VALIDACAO sem membros. |
| [04 — Alteração](04-bg02-alteracao-descricao.png) | Sessão bg-lab-02; mesmo Object ID, descrição alterada. |
| [05 — Auditoria](05-audit-extrato.json) | Criação das contas, atribuições, registro de passkeys, criação/alteração/exclusão do grupo. |
| [06 — Entradas](06-signins-extrato.json) | Última entrada recebida de cada conta e desafio MFA anterior da bg-lab-01. |
| [07 — Identidade bg-lab-01](07-bg01-identidade-evento-mfa.png) · [08 — Método](08-bg01-senha-notificacao-mfa.png) | Evento das 18:55:22: senha e notificação no aplicativo com sucesso; MFA concluída. |
| [09 — Identidade bg-lab-02](09-bg02-identidade-evento-mfa.png) · [10 — Método](10-bg02-senha-codigo-oath-mfa.png) | Evento das 19:23:09: senha e código OATH com sucesso; MFA concluída. |

## Sequência auditada

Horários em **24/09/2026, Brasília (UTC−03:00)**; os extratos também preservam UTC e identificadores dos eventos. Todos os eventos selecionados abaixo tiveram resultado `success`.

| Horário | Executor | Ação |
|---|---|---|
| 17:24:17 / 17:25:52 | ADMIN-LAB-001 | Criou bg-lab-01 / bg-lab-02. |
| 18:53:29 | bg-lab-01 | Registrou passkey vinculada ao dispositivo. |
| 19:03:43 / 19:04:04 | ADMIN-LAB-001 | Atribuiu Global Administrator à bg-lab-01 / bg-lab-02. |
| 19:12:10 | bg-lab-01 | Criou LAB-BG-VALIDACAO, descrição “Teste administrativo bg-lab-01”. |
| 19:20:49 | bg-lab-02 | Registrou passkey vinculada ao dispositivo. |
| 19:24:38 | bg-lab-02 | Alterou a descrição para “Teste2 administrativo bg-lab-02”. |
| 19:26:14 | bg-lab-02 | Excluiu o grupo de teste. |

O grupo validado tem Object ID `5e11f8b2-05a8-449f-96d9-cd91e708c85e`. Houve um ensaio anterior pelo administrador habitual, com o mesmo nome e **outro Object ID**, criado às 19:08:55 e excluído às 19:11:09. Ele está identificado separadamente no extrato; não é prova de operação pela conta de emergência.

## Entradas e interpretação

| Conta | Última entrada no JSON original | Resultado no Azure Portal |
|---|---|---|
| ADMIN-LAB-001 | 18:46:40 | Código 0; detalhes de etapas vazios; informação adicional indica MFA satisfeita por claim anterior. |
| bg-lab-01 | 19:07:05 | Código 0; `Previously satisfied`, MFA satisfeita por claim no token. |
| bg-lab-02 | 19:21:25 | Código 0; primeiro fator e MFA `Previously satisfied`. |

O cadastro de passkey **não prova seu uso**. Estes eventos não identificam um novo desafio FIDO2/Windows Hello. Um evento anterior da bg-lab-01, às 18:42:53, comprova `Mobile app notification` com sucesso. Não se conclui ausência de MFA pelo campo `singleFactorAuthentication` isolado do administrador habitual.

**Complemento por capturas do portal:** as provas 07–10 mostram métodos efetivamente utilizados, sem substituir o JSON histórico. A bg-lab-01 realizou senha + notificação às **18:55:22** (21:55:22Z; Request ID `cc3ffdbf-291f-4445-abff-9d6afca9a600`). A bg-lab-02 realizou senha + código OATH às **19:23:09** (22:23:09Z; Request ID `f51695f7-242a-4999-a26b-a338a5e81800`). Cada par correlaciona a identidade na aba Basic info e as etapas pelo horário na aba Authentication details.

Nas duas capturas, as etapas têm `Succeeded = Yes` e o resultado indica MFA concluída. O status geral `Interrupted` corresponde, conforme a descrição exibida, à pergunta sobre permanecer conectado; não é falha dessas etapas nem comprovação isolada de conclusão do acesso à aplicação. As entradas bem-sucedidas anteriores continuam documentadas separadamente. `Security Defaults` aparece como política aplicada nesses eventos.

**Dois métodos de MFA comprovados, independência ainda não demonstrada:** notificação e código OATH podem depender do mesmo celular. O registro OATH não identifica, sozinho, qual aplicativo ou dispositivo gerou o código. Estas provas não demonstram autenticação por passkey/FIDO2.

**Estado final:** grupo temporário excluído; três atribuições administrativas presentes na captura posterior. Não há prova de remoção dos papéis das contas de emergência. Custódia independente, recuperação sem o dispositivo habitual e alertas automáticos não foram validados por esta coleta.

## Origem e limites

Oito capturas originais, sem edição. As quatro complementares foram capturadas em 24/09 às 20:25–20:26; os horários dos eventos estão descritos separadamente. Extratos derivados de 171 eventos de auditoria e 93 entradas interativas recebidas; seleção por Object ID, evento e horário. ADMIN-LAB-001 representa a conta pessoal do operador; o Object ID permite correlacionar seu UPN de entrada e a representação `#EXT#` na auditoria. Capturas com dados pessoais do operador mantidas com sua autorização.

JSONs completos e manifesto de integridade ficam privados. Os extratos públicos mantêm hashes SHA-256 das fontes, IDs e somente campos necessários; excluem IPs e propriedades de dispositivos/credenciais. A evidência mostra operação administrativa no laboratório, não recuperação após uma indisponibilidade real.

[Procedimento, pendências e acionamento](../../../00-operacao-itsm/PROC-BG-001-acesso-emergencia.md).
