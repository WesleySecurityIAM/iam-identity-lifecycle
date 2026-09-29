# Entregas do laboratório

## v0.5 — 2026-09-29

Base prática de lifecycle/JML e governança de acesso, com decisões simuladas e evidências. Os onze cenários IAM têm resultados documentados; esta versão consolida as entregas abaixo.

| Entrega | Resultado verificável |
|---|---|
| [Joiner, Mover e Leaver](README.md#lifecyclejml--joiner--mover--leaver) | Entrada controlada, retirada do acesso antigo na transferência e encerramento de acesso comprovados nos respectivos casos. |
| [Terceiro — IAM-004](evidencias/sanitizadas/IAM-004/README.md) | Prazo AD aplicado e autenticação recusada por expiração; bloqueio e revogação no Entra, contadores de concessões zero no resumo do portal e comparação final. |
| [Recertificação — IAM-010](evidencias/sanitizadas/IAM-010/README.md) | Inventário comparado à matriz, decisões justificadas, acesso de Bruno tratado e três vínculos residuais da conta de serviço removidos. |
| [Cobertura de TI](evidencias/sanitizadas/IAM-010/ti-isabela/README.md) | Isabela no AD, GG → DL → ACL/SMB, leitura permitida e criação negada com conexão identificada. |
| [SoD](evidencias/sanitizadas/IAM-010/14-sod-resultado.md) | Cinco cenários fictícios; um conflito antes e zero depois de retirar manutenção de fornecedores e preservar aprovação de orçamento no caso conflitante. |
| [Conferência final AD](evidencias/sanitizadas/IAM-010/17-conferencia-final-ad.md) | Coleta de 29/09 às 17:24:44–17:24:48: 10 contas, 9 grupos e 8 associações diretas; nenhuma associação ausente/excedente no recorte. |

**Automação:** coletor AD de consulta, comparações de inventários e demonstração local de SoD. [Scripts e escopos](05-automacao/readme.md). Fontes integrais privadas; evidências selecionadas e resultados disponíveis no repositório.

**Limites:** AD e Entra independentes; não há sincronização híbrida implementada. A conferência final AD não é nova coleta do Entra nem auditoria de toda permissão. SoD não altera um ERP ou implanta controle preventivo. Aprovações são simuladas. O acesso de emergência mantém as limitações de independência/custódia descritas no procedimento.

**Próxima fase:** revisar os casos para consolidação da base, introdução a IGA e preflight de identidade híbrida conforme o plano. Aplicações e APIs vêm nas etapas posteriores; não são competências práticas alegadas por esta versão.
