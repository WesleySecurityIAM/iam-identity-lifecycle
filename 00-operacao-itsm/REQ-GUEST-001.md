# REQ-GUEST-001 — Convidado externo de laboratório

- Ambiente: Microsoft Entra ID — laboratório fictício
- Tipo: requisição de colaboração B2B, complementar à fila IAM
- Abertura: 2026-09-22
- Status: Aberto — registro preparado; convite pendente
- Solicitante e responsável: Wesley
- Nome de exibição previsto: Convidado LAB 01
- Encerramento previsto: 2026-09-25, após validação

## Contexto e objetivo

Demonstrar convite e aceite de uma identidade externa B2B com finalidade, responsável e prazo documentados. Usar endereço externo controlado pelo operador, diferente da conta administrativa do tenant. Não expor o endereço no repositório público.

## Estado anterior

Convite e criação do Guest ainda não comprovados neste atendimento. Endereço externo a selecionar pelo operador; conferir se já existe no tenant antes de convidar para evitar duplicidade.

## Aprovação e fundamento

Preparação solicitada por Wesley em 22/09/2026 para o próprio laboratório. Finalidade restrita ao teste de convite e aceite. Sem aprovação corporativa real. Nenhum grupo financeiro, papel administrativo ou aplicação está previsto nesta etapa.

## Ações e validação

- **Concluído:** registrar finalidade, responsável, início e prazo de encerramento.
- **Pendente:** conferir a identidade externa e enviar o convite.
- **Pendente:** registrar User type=Guest e estado inicial do convite.
- **Pendente:** aceitar o convite com a identidade externa e conferir Accepted.
- **Pendente:** exportar auditoria e inventário complementar; preservar originais privados e publicar provas sanitizadas.
- **Pendente — 25/09:** encerrar a participação: bloquear entrada, revogar sessões quando aplicável e conferir ausência de grupos, papéis e aplicações atribuídos. Preservar evidências; eventual exclusão do objeto deve ser registrada separadamente.

## Evidências

Ainda não recebidas. Acrescentar convite, aceite, auditoria e estado final conforme execução, sem antecipar resultados.

## Riscos, limites e reversão

O prazo é controle documental/manual; não configura expiração automática no Entra. O aceite comprova resgate do convite, não acesso a aplicação. Se o convite for enviado à identidade errada, interromper o teste e remover o objeto indevido após conferir as dependências. Não registrar senhas ou links de resgate no Git.

## Fechamento

Aberto. Encerrar após convite/aceite documentados e encerramento efetivamente validado. Se o aceite ficar bloqueado, registrar o motivo e o estado observado. Não considerar o teste concluído apenas por criar o objeto.

[Voltar à fila](05-fila-tickets.md).
