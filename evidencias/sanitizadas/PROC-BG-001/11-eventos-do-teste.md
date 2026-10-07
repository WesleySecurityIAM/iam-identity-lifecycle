# Emergência — eventos das duas contas e do grupo validado

Recorte de leitura preparado em 07/10/2026 dos extratos 05–06, preservados sem alteração. Horários de 24/09/2026 em Brasília (UTC−03:00). Não é nova coleta.

<a id="criacao"></a>

## 1. Criar as contas — 17:24–17:25

| Horário | Executor / alvo | Evento | Resultado |
|---|---|---|---|
| 17:24:17 | ADMIN-LAB-001 → bg-lab-01 | Add user | success |
| 17:25:52 | ADMIN-LAB-001 → bg-lab-02 | Add user | success |

<a id="papeis"></a>

## 2. Atribuir administração — 19:03–19:04

| Horário | Conta que recebeu o papel | Alteração / executor | Resultado |
|---|---|---|---|
| 19:03:43 | bg-lab-01 | Global Administrator / ADMIN-LAB-001 | success |
| 19:04:04 | bg-lab-02 | Global Administrator / ADMIN-LAB-001 | success |

<a id="entradas"></a>

## 3. Confirmar entradas no portal — 19:07 e 19:21

| Horário | Conta | Aplicação / código | Interpretação |
|---|---|---|---|
| 19:07:05 | bg-lab-01 | Azure Portal / 0 | Êxito; MFA satisfeita por claim anterior, sem identificar novo desafio. |
| 19:21:25 | bg-lab-02 | Azure Portal / 0 | Êxito; MFA satisfeita por claim anterior, sem identificar novo desafio. |

Esses eventos comprovam entrada na aplicação. As capturas de método 07–10 são eventos distintos, descritos no [roteiro cronológico](README.md).

<a id="grupo"></a>

## 4. Operar e excluir o mesmo grupo — 19:12–19:26

Object ID do grupo: `5e11f8b2-05a8-449f-96d9-cd91e708c85e`. A tabela abaixo reúne somente esse objeto.

| Horário | Executor | Ação | Resultado |
|---|---|---|---|
| 19:12:10 | bg-lab-01 | Add group | success |
| 19:24:38 | bg-lab-02 | Update group | success |
| 19:26:14 | bg-lab-02 | Delete group | success |

Criação com descrição “Teste administrativo bg-lab-01”; alteração para “Teste2 administrativo bg-lab-02”; exclusão posterior. Essas ações demonstram administração pelas duas contas. Não representam recuperação durante indisponibilidade real.

<details>
<summary>Fontes e rastreabilidade — consultar somente se necessário</summary>

[05 — Auditoria](05-audit-extrato.json) e [06 — Sign-ins](06-signins-extrato.json) preservam IDs de eventos e hashes das fontes privadas. O 05 também contém cadastro de passkeys e ensaio de outro grupo pelo administrador habitual; o 06 contém a entrada habitual e um desafio anterior. Esses registros não são necessários para provar a operação do grupo acima e não foram repetidos na leitura principal.

</details>
