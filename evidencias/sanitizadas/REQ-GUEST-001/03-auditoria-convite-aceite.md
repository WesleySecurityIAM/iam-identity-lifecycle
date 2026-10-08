# Guest - convite, sponsor e aceite

Fonte: AuditLogs_2026-09-22_complemento.json.json, preservada integralmente na área privada com extensão normalizada para .json. Seleção por Object ID do convidado; sponsor correlacionado por ID com o inventário privado, identificado publicamente como ADMIN-LAB-001.

Data: 22/09/2026. Horário abaixo em Brasília (UTC-03:00), convertido de activityDateTime. Todos os eventos selecionados têm result=success.

<a id="convite"></a>

## 1. Convite e responsável — 14:09

| Hora | Evento | O que comprova |
|---|---|---|
| 14:09:48 | Add user | Criação: UserType=Guest, CreationType=Invitation, AccountEnabled=true e UserState=PendingAcceptance. |
| 14:09:48 | Invite external user | Convite processado para Convidado LAB 01; não comprova aceite sozinho. |
| 14:09:49 | Add user sponsor | ADMIN-LAB-001 adicionado como sponsor do convidado. |

<a id="aceite"></a>

## 2. Aceite — 14:17

| Hora | Evento | O que comprova |
|---|---|---|
| 14:17:23 | Update user | UserState mudou de PendingAcceptance para Accepted. |
| 14:17:23 | Redeem external user invite | Resgate do convite concluído. |

O campo AcceptedOn registra 17:17:22Z (14:17:22 Brasília); os eventos de atualização/resgate foram registrados às 17:17:23Z. São campos distintos, não uma divergência a corrigir.

## Conclusão e limites

Convite, associação de sponsor e aceite comprovados em 22/09. Encerramento posteriormente concluído em 25/09: [estado final e auditoria](06-encerramento.md). As capturas confirmam a mudança de estado. Não foi fornecido arquivo de Sign-in logs nem inventário novo após a inclusão do Guest. Não alegar MFA, acesso a aplicação ou ausência de atribuições com base somente neste extrato.

IDs, endereços, IPs, tokens/identificadores de sessão e dados de convite foram omitidos. Não houve alteração no tenant nesta revisão documental.

- SHA-256 do JSON original: `dd82da41fa06825bd540816cf0b5470fd5292d979b1c3079ef7170b6aaa7e5fe`.

[Solicitação](../../../00-operacao-itsm/REQ-GUEST-001.md).

[Voltar à sequência de evidências](README.md).
