# PROC-BG-001 — Acesso administrativo de emergência no Entra

- Data: **24/09/2026**. Responsável e custodiante declarado: Wesley.
- Estado: **validação administrativa concluída; independência da autenticação e custódia a validar**.
- Escopo: tenant de laboratório Entra; entrega complementar à v0.3, sem criar um 12º ticket.
- [Evidências: oito capturas, auditoria e entradas](../evidencias/sanitizadas/PROC-BG-001/README.md).

## Objetivo e resultado

Preparar duas identidades alternativas para recuperar a administração quando o acesso habitual não puder ser utilizado. As contas `bg-lab-01` e `bg-lab-02` foram criadas como Member no domínio original onmicrosoft.com e receberam Global Administrator por atribuição direta. O administrador habitual foi preservado.

No teste controlado, bg-lab-01 criou um grupo sem membros às **19:12:10**; bg-lab-02 alterou sua descrição às **19:24:38** e o excluiu às **19:26:14**, horário de Brasília. Auditoria e capturas correlacionam executor e mesmo Object ID. Não houve simulação de bloqueio do administrador habitual.

## Estado e limites da validação

| Controle | Evidência / pendência |
|---|---|
| Duas contas alternativas | Contas e atribuições comprovadas. |
| Entrada e administração | Entradas com código 0 e ações administrativas auditadas. |
| Autenticação | Senha + notificação na bg-lab-01 e senha + código OATH na bg-lab-02, com etapas bem-sucedidas e MFA concluída. Passkeys cadastradas; uso de passkey não comprovado. |
| Independência | Não demonstrada contra perda do celular/computador habitual; não presumir dois caminhos independentes apenas por haver duas contas. |
| Custódia | Responsável identificado; localização privada e recuperação sem dependência do tenant precisam ser conferidas pelo operador. |
| Monitoramento | Consulta manual de logs realizada; alerta automático não demonstrado. |
| Limpeza | Grupo temporário excluído; papéis administrativos mantidos na captura final. |

Portanto, a entrega comprova **contas alternativas capazes de administrar**, com limitações explícitas. Não declara uma solução de emergência plenamente validada. O cadastro de uma passkey é diferente de autenticar com ela; o extrato não permite atribuir o acesso ao Windows Hello ou a uma chave física.

## Completar e manter a preparação

1. Conferir o método e a custódia de cada conta; recuperar o material deve ser possível sem depender do acesso que se pretende substituir. Não registrar senhas, PINs, QR codes ou chaves no Git.
2. Em uma nova entrada, selecionar explicitamente a passkey cadastrada e conferir o método bem-sucedido nos detalhes de autenticação. Se os logs mostrarem apenas `Previously satisfied`, manter essa verificação pendente. Não repetir criação de grupos só para produzir novas capturas.
3. Avaliar dependências comuns de dispositivo e recuperação. Um PIN desbloqueia o autenticador local; um pendrive comum não se torna uma chave FIDO2. Não retirar MFA para contornar o teste.
4. As novas capturas mostram Security Defaults aplicado aos dois eventos de MFA; não representam revisão completa das políticas do tenant ou de Conditional Access. Planejar alertas de uso separadamente da consulta manual.
5. Validar periodicamente, no máximo a cada 90 dias, e após alterações relevantes. Se o experimento for abandonado, tratar os privilégios e objetos de teste, preservando o acesso habitual.

## Quando e como acionar

Usar somente para recuperar administração indisponível, não para atividades diárias. Não resolve indisponibilidade geral do provedor nem recuperação do AD local.

1. Registrar motivo, início e conta usada; recuperar o material privado sob custódia.
2. Entrar por estação confiável e conferir identidade e tenant.
3. Investigar a causa e executar apenas a correção necessária, registrando ações.
4. Validar a conta habitual em outra sessão antes de encerrar a intervenção.
5. Preservar logs, revisar alterações, encerrar sessões e substituir credenciais se houver exposição ou suspeita. Revalidar o caminho de emergência.

Um único operador representa execução e custódia neste laboratório; não há segregação de funções demonstrada nem aprovação corporativa real.

Referência de desenho: [orientações Microsoft para contas de emergência](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access), com duas contas cloud-only, Global Administrator ativo permanente e autenticação forte independente do acesso habitual. [Interpretação dos registros de MFA](https://learn.microsoft.com/en-us/entra/identity/authentication/howto-mfa-reporting).

[Voltar à operação ITSM](README.md).
