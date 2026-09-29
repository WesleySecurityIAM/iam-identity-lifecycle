# IAM-010 — Evidências de preparação da recertificação

**Fechado em 29/09/2026**, após revisão iniciada em 28/09. Inventário, tratamento, comparação dos grupos departamentais e decisões simuladas disponíveis. Atualização de 29/09: Diego encerrado no IAM-004; três vínculos da conta de serviço retirados e comprovados. SoD concluído e Isabela validada no AD em 29/09. Conferência final AD concluída às 17:24:48: oito associações conformes, zero ausentes/excedentes. Sem pendência de alteração de Employee type: tarefa retirada do escopo pelo operador; controles de acesso encerrados no recorte documentado.

- [01 — Inventário e conferência inicial](01-inventario-conferencia-inicial.md): fontes, população, 34 verificações cadastrais e pontos de análise.
- [02–06 — Tratamento de Bruno e comparação posterior AD](06-tratamento-validacao-ad.md): antes/depois, leitura permitida, criação negada e nova coleta confirmando inclusão de Bruno e OU de Gabriela.
- [07 — População e grupos versus matriz](07-comparacao-populacao-grupos.md): nove associações departamentais conformes e seis ausências de contas previstas; contas especiais classificadas separadamente.
- [08 — Recertificação simulada](08-recertificacao-simulada.md): quinze associações revisadas; resultado inicial doze manter/três investigar; após tratamento, doze manter/três remover.
- [09 — Roteiro SoD](09-roteiro-sod.md): cinco cenários executados; [14–16 — resultado e provas](14-sod-resultado.md): um conflito antes, zero depois, com direito necessário preservado.
- [Matriz e decisão de escopo](../../../00-operacao-itsm/REV-2026-09-28-escopo-reconciliacao.md): adotadas após análise do inventário.
- [Ticket IAM-010](../../../00-operacao-itsm/05-fila-tickets.md#iam-010): objetivo, execução, critérios e pendências.

O inventário descreve o observado; a matriz define o esperado; a recertificação deverá registrar a decisão do responsável sobre a necessidade de cada acesso. CSVs brutos e manifesto de hashes permanecem privados.

- [Revisão de 29/09 — matriz vigente](../../../00-operacao-itsm/MAT-2026-09-29-acessos-por-sistema.md): TI incluída como regra, Isabela implementada no AD e planejada no Entra, Diego encerrado por prazo e limites dos resultados anteriores. [Análise de preparação híbrida](../../../00-operacao-itsm/REV-2026-09-29-estrutura-hibrida.md).

- [10–13 — Conta de serviço: decisão e remediação](10-servico-remocao-concessoes.md): três vínculos retirados, conta desabilitada, dependências locais consultadas e grupo humano preservado na DL de leitura.

- [TI — Isabela: implementação e validação no AD](ti-isabela/README.md): cadastro, GG/DL, ACL/SMB, conexão identificada, leitura permitida e criação negada em 29/09. Atualiza o estado anteriormente planejado de TI; a conferência final AD está registrada nas provas 17–18.

- [17–18 — Conferência final AD](17-conferencia-final-ad.md): nova coleta, integridade, população, TI, acessos humanos e ausência dos vínculos de serviço.
