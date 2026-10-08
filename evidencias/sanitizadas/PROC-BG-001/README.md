# PROC-BG-001 — Validação administrativa de emergência

**Resultado em 24/09/2026:** duas contas alternativas entraram no portal e administraram o mesmo grupo de teste. bg-lab-01 criou; bg-lab-02 alterou e excluiu. MFA por notificação e por código OATH foi demonstrado em eventos específicos. **Limite:** independência de recuperação e uso de passkey não comprovados.

## Sequência essencial — pelo horário do evento

Horários de Brasília (UTC−03:00). Siga de cima para baixo; os números dos arquivos preservam seus identificadores, não a ordem de execução. A consulta de uma tela pode ser posterior ao evento que ela documenta.

| Ordem / horário | Por que e o que ocorreu | Prova necessária |
|---|---|---|
| 1 — 17:24:17 / 17:25:52 | Criar duas identidades alternativas. | [Criação auditada](11-eventos-do-teste.md#criacao); [01 — contas Member/cloud-only](01-contas-emergencia.png) confere o tipo e a origem. |
| 2 — 18:55:22 | Verificar o método usado pela bg-lab-01. | [07 — identidade do evento](07-bg01-identidade-evento-mfa.png) + [08 — senha/notificação](08-bg01-senha-notificacao-mfa.png). As duas abas pertencem à mesma tentativa. |
| 3 — 19:03:43 / 19:04:04 | Atribuir Global Administrator às contas alternativas. | [Atribuições auditadas](11-eventos-do-teste.md#papeis); [02 — atribuições diretas](02-atribuicoes-global-administrator.png). |
| 4 — 19:07:05 | Confirmar entrada da bg-lab-01 no Azure Portal. | [Entrada com código 0](11-eventos-do-teste.md#entradas), MFA previamente satisfeita. |
| 5 — 19:12:10 | Testar uma operação administrativa pela bg-lab-01. | [03 — grupo criado, sem membros](03-bg01-criacao-grupo.png); [evento Add group](11-eventos-do-teste.md#grupo). |
| 6 — 19:21:25 | Confirmar entrada da bg-lab-02 no Azure Portal. | [Entrada com código 0](11-eventos-do-teste.md#entradas), MFA previamente satisfeita. |
| 7 — 19:23:09 | Identificar o método usado pela bg-lab-02. | [09 — identidade do evento](09-bg02-identidade-evento-mfa.png) + [10 — senha/código OATH](10-bg02-senha-codigo-oath-mfa.png). As duas abas pertencem à mesma tentativa. |
| 8 — 19:24:38 | Testar alteração pela outra conta no mesmo objeto. | [04 — descrição alterada](04-bg02-alteracao-descricao.png); [evento Update group](11-eventos-do-teste.md#grupo). |
| 9 — 19:26:14 | Limpar o recurso temporário. | [Delete group pela bg-lab-02](11-eventos-do-teste.md#grupo). |

O grupo validado tem Object ID `5e11f8b2-05a8-449f-96d9-cd91e708c85e`. O recorte de eventos exclui da leitura principal o ensaio do administrador habitual em outro objeto. A conta habitual aparece nas provas 01–02 como contexto das listas e como executora da preparação.

<a id="preparacao"></a>
<a id="operacao"></a>
<a id="autenticacao"></a>

## Correlação e limites da autenticação

Cada par 07–08 e 09–10 liga identidade à etapa de autenticação. As etapas têm `Succeeded=Yes` e MFA concluída, mas o status geral `Interrupted` corresponde à pergunta sobre permanecer conectado. Essas capturas sozinhas não comprovam conclusão do acesso à aplicação; os eventos de código 0 estão separados na sequência.

Request IDs das capturas: bg-lab-01 `cc3ffdbf-291f-4445-abff-9d6afca9a600`; bg-lab-02 `f51695f7-242a-4999-a26b-a338a5e81800`. Security Defaults aparece aplicado. As capturas foram coletadas às 20:25–20:26; o roteiro usa os horários dos eventos exibidos nelas.

<a id="limpeza-e-limites"></a>

## Fechamento e limites

Grupo temporário excluído; atribuições administrativas mantidas na captura 02. Notificação e código OATH podem depender do mesmo celular; OATH não identifica sozinho aplicativo/dispositivo. Passkeys foram cadastradas, mas seu uso não foi comprovado. Custódia independente, recuperação sem dispositivo habitual e alertas automáticos permanecem a validar. O ensaio demonstra administração alternativa, sem alegar recuperação após indisponibilidade real.

<details>
<summary>Registros adicionais e preservação — fora do roteiro essencial</summary>

[05 — Auditoria preservada](05-audit-extrato.json): cadastro de passkeys às 18:53:29 e 19:20:49; ensaio do administrador habitual às 19:08:55–19:11:09 com outro Object ID. [06 — Sign-ins preservados](06-signins-extrato.json): inclui entrada habitual às 18:46:40 e desafio anterior da bg-lab-01 por notificação às 18:42:53. Não é necessário abrir esses registros para acompanhar o teste principal.

Oito capturas originais sem edição. Extratos derivados de 171 eventos de auditoria e 93 entradas interativas; os JSONs completos e manifestos ficam privados. Os extratos preservam IDs e hashes de origem. Dados pessoais do operador nas capturas foram publicados com sua autorização.

</details>

[Procedimento, pendências e acionamento](../../../00-operacao-itsm/PROC-BG-001-acesso-emergencia.md).
