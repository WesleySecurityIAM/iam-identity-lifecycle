# Evidências por caso

Escolha um caso e acompanhe **objetivo → referência/estado anterior → decisão ou diagnóstico → ação → validação → resultado e limites**. Cada índice explica por que a prova está ali e o que ela demonstra. O [ticket](../00-operacao-itsm/05-fila-tickets.md) reúne a história; os links do índice abrem as capturas, extratos e resultados correspondentes.

RH, matriz e decisão definem o esperado. Capturas, logs e comparações sustentam o observado. Preparação, execução e complementos posteriores aparecem identificados por data, sem tratar uma coleta antiga como estado atual.

## Tickets IAM

| Caso | Pergunta que orienta a leitura | Roteiro das provas |
|---|---|---|
| IAM-001 — Felipe, provisionamento | A conta e o grupo previstos foram criados? | [RH/matriz → criação → associação → conferência cadastral](sanitizadas/IAM-001/README.md) |
| IAM-002 — Gabriela, Mover | O acesso antigo foi retirado e o novo validado? | [Preparação → RH/matriz → antes/depois → testes → comparação; OU como complemento](sanitizadas/IAM-002/README.md) |
| IAM-003 — Carla, Leaver | A divergência com RH desligado foi corrigida? | [Estado anterior → exceção → bloqueio/revogação/remoção → nova entrada e comparação](sanitizadas/IAM-003/README.md) |
| IAM-004 — Diego, terceiro | O término do prazo teve efeito nos dois sistemas independentes? | [Prazo AD → autenticação expirada → bloqueio/revogação Entra → estado final](sanitizadas/IAM-004/README.md) |
| IAM-005 — Conta de serviço | A rotina executou com a identidade e os acessos previstos? | [Preparação → execução/testes → repetição → desativação](sanitizadas/IAM-005/README.md) |
| IAM-006 — Felipe, login | O que foi observado, tratado e validado na autenticação? | [Evidência inicial → eventos de senha → login posterior; ServiceNow como complemento](sanitizadas/IAM-006/README.md) |
| IAM-007 — Felipe, MFA | Método cadastrado e uso efetivo foram demonstrados? | [Registro → método atual → evento específico de uso](sanitizadas/IAM-007/README.md) |
| IAM-008 — Felipe, acesso direto | Era necessário adicionar uma permissão individual? | [Associação → encadeamento → ACL → decisão de manter acesso por grupo](sanitizadas/IAM-008/README.md) |
| IAM-009 — Felipe, contexto SMB | Por que a leitura persistiu após retirar o grupo? | [Remoção → leitura persistente → reconexão negada → restauração e reteste](sanitizadas/IAM-009/README.md) |
| IAM-010 — Recertificação e SoD | Quem precisa manter acesso e quais achados foram tratados? | [Inventário → matriz/comparação → decisões → tratamentos → SoD → conferência final](sanitizadas/IAM-010/README.md) |
| IAM-011 — Ana, Joiner | A entrada foi preparada e depois ativada? | [Pré-admissão → teste bloqueado → ativação/grupo → login/MFA; RH posterior identificado](sanitizadas/IAM-011/README.md) |

## Casos complementares

| Caso | Propósito | Evidências |
|---|---|---|
| PROC-BG-001 | Validar acesso administrativo pelas contas de emergência e registrar limites de independência | [Preparação, operação administrativa, MFA e limpeza](sanitizadas/PROC-BG-001/README.md) |
| REQ-GUEST-001 | Acompanhar convidado do convite ao encerramento | [Solicitação, aceite, bloqueio/revogação e estado final](sanitizadas/REQ-GUEST-001/README.md) |

## Fundamentos e exercícios próprios

São entregas de apoio com propósito próprio. Quando uma prova é reutilizada num ticket, o motivo e a data dessa referência são indicados.

- [AGDLP financeiro](sanitizadas/agdlp-financeiro/README.md): configuração de grupos/ACL e testes com Felipe e Bruno.
- [Delegação de reset por OU](sanitizadas/delegacao-reset-ou/README.md): operação permitida em Suporte e negada em Terceiros.
- [Preparação inicial da conta de serviço](sanitizadas/conta-servico/README.md): estado histórico anterior à rotina do IAM-005.
- [ADUC indisponível](../06-troubleshooting/2026-09-11-aduc-rede-nat/README.md): diagnóstico e recuperação do console.
- [Automação e reprodução](../05-automacao/readme.md): exercício sintético de associações, coletor AD, comparador de grupos e SoD; cada resultado tem seu próprio escopo.

<details>
<summary>Fontes históricas compartilhadas — consultar somente a identidade e a data pertinentes ao caso</summary>

- [Inventário AD de 18/09](sanitizadas/inventario-ad-2026-09-18/README.md).
- [Inventário e auditoria Entra de 22/09](sanitizadas/inventario-entra-2026-09-22/README.md).
- [Conferências Entra de 23/09](sanitizadas/inventario-entra-2026-09-23/README.md).
- [Comparação RH × Entra executada em 23/09](sanitizadas/reconciliacao-2026-09-23/README.md): Carla e Gabriela; os índices dos casos identificam as linhas relevantes para cada pessoa.

</details>

## Escopo e integridade

Laboratório com identidades de negócio fictícias e decisões simuladas. Algumas capturas de Guest/emergência contêm dados pessoais do operador publicados com sua autorização; credenciais, tokens e exportações integrais permanecem privados. Os arquivos originais e as datas históricas são preservados. Um índice explicativo não representa nova coleta, e uma prova de associação no Entra não comprova acesso ao arquivo SMB do AD.
