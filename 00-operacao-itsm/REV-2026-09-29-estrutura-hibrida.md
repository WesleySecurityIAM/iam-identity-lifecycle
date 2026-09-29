# Revisão do ambiente — RH, AD, Entra e preparação híbrida

Análise de 29/09/2026 para o IAM-010. Base: RH de nove pessoas; exportações AD inicial/final e Entra de 28/09; tickets e evidências publicadas. Não é inspeção ao vivo das VMs ou do tenant. A [matriz vigente](MAT-2026-09-29-acessos-por-sistema.md) diferencia observado, esperado e planejado.

## Achados e decisões

| Achado sustentado pelas fontes | Decisão / prioridade |
|---|---|
| RH possui Financeiro, Suporte, RH e TI; comparação antiga abrangia três áreas | TI incluída na regra de 29/09; lacuna documental reconhecida no IAM-010. Nenhuma outra área aparece nas nove linhas de RH |
| Diego é Terceiro de Sistemas, TI; matrícula EMP0004; prazo definido para 29/09 às 08:00 | Encerrar pelo fim da vigência, independentemente da matriz incompleta; validar efeito da expiração e ações Entra. Prioridade v0.5 |
| Isabela é Analista de Sistemas ativa, TI, EMP0009, sem conta nas coletas | Planejar caso TI/piloto híbrido após v0.5; não criar duas contas independentes nem chamá-la de órfã/erro automaticamente |
| Ana/Elisa/Henrique sem AD; Carla desligada sem AD | Preservar recorte cloud-only. Híbrido não exige espelhar todas as pessoas em ambos os sistemas |
| Bruno, Felipe e Gabriela existem nos dois diretórios | Candidatos a posterior estudo de matching; ainda são objetos independentes. Matrícula comum não comprova vínculo híbrido |
| Gabriela já está em OU Financeiro, com GUID/matrícula e grupos preservados | Não repetir movimentação. Falta evidência de GPO/delegação das OUs; obter no preflight |
| Diego em OU Terceiros, adm.wesley em OU TI, serviço em OU Contas-de-Servico | Organização por ciclo/finalidade é válida. Não mover Diego à OU TI só para igualar Department; não incluir toda OU TI no sync, pois contém administrador |
| Sete grupos AD coletados; Financeiro/Suporte testados; RH apenas cloud | Manter AGDLP e fronteiras de recurso. Não criar DL/RH/recursos fictícios adicionais apenas para simetria |
| Serviço desabilitado conserva três vínculos | Tratar retenção no IAM-010 após conferir membros/dependências; não mexer em GG_FIN_READ nem ACL compartilhada. Prioridade v0.5 |
| Três grupos cloud têm nomes usados no modelo AD | Registrar IDs e origem. Não presumir união de grupos existentes por nome; planejar migração de grupos separada do primeiro piloto |
| Exportação AD não contém UPN, SID, mail, proxyAddresses nem mS-DS-ConsistencyGuid | **Dados não coletados**, não atributos comprovadamente vazios. Obter esses campos antes de avaliar prontidão |
| Exportação Entra tem campos de sincronização vazios na coleta e histórico de operação independente | Não comprova correspondência técnica ou capacidade de sync. Coletar estado atual e IDs/atributos relevantes; manter cloud-only até piloto validado |

## Estrutura-alvo enxuta

```text
RH: matrícula, pessoa, área/cargo/gestor, status e vigência
             |
             v
Matriz: necessidade por sistema + recurso + permissão + owner
       /                                           \
AD: conta comum -> GG -> DL -> ACL/SMB       Entra: conta -> grupo -> recurso
       |                                    (recurso cloud ainda não integrado)
       +---- piloto híbrido controlado ----> conta sincronizada

Separados: administração | serviço | emergência | convidados | internas
```

Responsabilidade de atributos: RH define situação de negócio; operador atualiza fontes aprovadas. AD é autoridade dos atributos sincronizados do futuro piloto conforme mapeamento escolhido; Entra continua autoridade das contas cloud-only e das configurações específicas da nuvem. Registrar o mapeamento concreto; não editar o mesmo atributo dos dois lados por tentativa.

## Piloto recomendado e critérios de entrada

**Isabela é candidata**, porque ainda não tem conta e não exige vincular imediatamente uma identidade cloud existente. A decisão de sincronização só entra em execução após os critérios abaixo; não criar grupo/conta/app agora como se já fossem evidência de híbrido.

1. Concluir a v0.5 com provas próprias de Diego, serviço e SoD. Preservar nova coleta final e o RH de 29/09.
2. Escolher **Cloud Sync ou Connect Sync** conforme pré-requisitos, infraestrutura e objetivos, usando documentação atual. Não instalar ambos para a mesma população. Não instalar agente no DC por conveniência sem revisar suporte/desenho.
3. Conferir VM/sistema suportado, recursos, DNS, tempo, TLS/conectividade, conta de instalação e conectores. Registrar domínio e UPN utilizável no tenant. O domínio AD empresa.lab não determina o UPN cloud; um sufixo válido deve ser definido sem renomear a floresta só para esse laboratório.
4. Fazer consulta read-only dos UPNs/SIDs/anchors/e-mails/aliases AD e dos IDs/UPNs/estado de sync Entra. Verificar duplicidades; não trocar GUID, SID ou anchor arbitrariamente.
5. Usar OU piloto de contas comuns, com GPOs/delegação conhecidos e escopo pequeno explícito. Manter administração, emergência, serviço, convidados e contas encerradas fora do piloto. Departamento não é filtro suficiente; considerar também finalidade e ciclo de vida.
6. Preservar os grupos atuais no primeiro teste. Para TI, planejar origem AD do futuro GG; DL e ACL continuam função local. Se sincronizar um GG depois, registrar objeto cloud criado e impacto antes de atribuir qualquer aplicativo. Não presumir merge por displayName.
7. Fazer prévia do escopo e das mudanças. **Connect Sync:** staging mode/preview quando aplicável. **Cloud Sync:** teste sob demanda/escopo conforme recursos documentados; não chamar de staging mode. Conferir proteção contra exclusões e limite adequado ao lab; limiar padrão grande não protege uma população pequena de todos os erros.
8. Registrar antes/depois: matrícula da pessoa, ObjectGUID/SID AD, ID cloud, UPN, origem de autoridade, estado da conta, grupos e logs. Testar sincronização e autenticação separadamente; sincronização bem-sucedida não prova acesso ao arquivo.
9. Antes de vincular Bruno/Felipe/Gabriela futuramente, resolver matching e impacto de senha/atributos. Não ligar contas administrativas existentes. Preservar dados cloud antes de assumir autoridade AD.
10. Reversão planejada por objeto/atributo. Retirar uma OU do escopo pode excluir objetos sincronizados; snapshot da VM não desfaz alterações no Entra. Parar exportações e avaliar o impacto antes de alterar escopo em uma falha.

## Complemento após recebimento das provas de 29/09

[Diego encerrado no IAM-004](05-fila-tickets.md#iam-004): autenticação AD recusada com erro 1793, bloqueio/revogação auditados no Entra, contadores de concessões zero e nova comparação cadastral conforme. Identificado ajuste adicional de qualidade cadastral: Employee type=Funcionário na captura, apesar do cargo/RH de terceiro. Tratar no IAM-010, sem reativar conta, alterar User type=Member por engano ou atribuir grupo novo. As pendências sobre Diego nas tabelas anteriores descrevem a base da análise antes deste complemento.

## Sequência sem atrasar o estudo

**Agora:** matriz/RH e registro do achado; terminar pendências da v0.5. **Preflight já previsto no plano:** coletar lacunas, desenhar OU piloto/autoridade e implementar TI com Isabela quando liberado. **Piloto:** um usuário, uma origem e evidências. **Depois:** coexistência/matching, troubleshooting e aplicações → API. A conta de serviço dá continuidade à futura governança NHI (owner, finalidade, consumidor, concessões e revogação), sem alegar identidade gerenciada/cloud já implementada.

Parecer: a base sustenta novas simulações, mas **ainda não está validada para habilitar sincronização**. As lacunas são delimitadas e tratáveis; não há justificativa para reconstruir AD/Entra, criar departamentos não presentes no RH ou sincronizar toda a população.

## Auditoria de aderência à sequência do plano

Referência confirmada: Plano-IAM-Cloud-Identity-NHI-Consolidado-2026-09-26.pdf, 28 páginas; cópia informada pelo operador confere por SHA-256 com o PDF de trabalho. Calendário pessoal permanece nesse documento. A auditoria verifica aderência às entregas e dependências, sem declarar infraestrutura futura disponível.

| Fase do plano | Base reutilizável | Lacuna / condição de avanço | Encaminhamento |
|---|---|---|---|
| v0.5: JML, terceiro, reconciliação, SoD e recertificação | Mover/Leaver/Joiner evidenciados; inventário e correções Bruno/Gabriela; decisões dos vínculos | Diego, serviço, execução acompanhada de SoD e estado final ainda precisam de provas nesta revisão | Concluir no IAM-004/IAM-010; registrar limite da nova TI sem atrasar fechamento por implantação futura |
| Revisão/entrevista e introdução IGA | Fontes, decisões e achado de cobertura TI | Distinguir estudo/mapeamento SailPoint de uso real do produto | Reusar estes casos no bloco curto pós-v0.5; nenhum tenant SailPoint é pré-requisito do AD/Entra |
| Preflight e piloto híbrido | IDs preservados, RH/matriz separados, população classificada | Infraestrutura, UPN/aliases/anchors, GPO/delegação e escolha de método não validados | Isabela candidata; liberar somente após critérios técnicos acima |
| Troubleshooting híbrido | Antes/depois, logs e correlação já utilizados | Ainda não há sincronização nem erros híbridos observados | Primeiro estabilizar piloto; depois dois cenários controlados, diagnóstico/correção/reteste |
| Aplicação SSO / workload | Pessoas/grupos e conceito de menor privilégio | Não existe recurso cloud integrado comprovado; grupo sozinho não é autorização de aplicação | Uma aplicação SAML ou OIDC; teste permitir/retirar/negar; registrar App ID, IDs, owner e permissão; confirmar licença para recursos por grupo |
| Python/Graph | CSV, PowerShell e reconciliação com chaves explícitas | Cliente de automação, consentimento mínimo e endpoints ainda não implementados | Reusar a aplicação/registro de workload; separar cliente da automação e usuário SSO, não ampliar privilégio para facilitar consulta |
| IGA/PAM e NHI inicial | Serviço com owner/finalidade, permissões e pendência de retenção | Remediação real e dependências da rotina ainda precisam de fechamento | Usar como ponte conceitual; conta de serviço AD não equivale a Managed Identity nem prova uso de CyberArk |
| CA/PIM/Access Review | Emergência testada administrativamente; decisões manuais de revisão | Independência da recuperação, alertas e licença premium não validados; MFA por dois métodos pode depender do mesmo dispositivo | Revalidar recuperação antes de políticas restritivas; confirmar trial/licença só próximo da execução; recertificação manual não é Access Review nativa |
| Entra/Azure NHI e AWS | Modelo de owner, consumidor, recurso, autorização e revogação | Assinatura/recurso Azure, conta AWS, custos e identidades de workload não auditados | Preparar isolamento, limites de custo e encerramento na fase prevista; preferir credencial temporária quando suportada |
| PAM prático / APIs | Inventário e cuidado com dependências | Trial Delinea/lab CyberArk e ambiente Conjur não confirmados | Fazer preflight na janela prevista; mapear consumo/rotação no alvo, teste positivo/negativo e rollback; não ativar trial agora |

### Evidências que faltam para uma auditoria técnica ao vivo

Esta revisão não inventaria toda a floresta ou o tenant. Para avançar ao híbrido, coletar somente o necessário:

- **AD/infraestrutura:** versão/suporte, topologia e disponibilidade do DC, DNS/tempo, saúde do diretório, domínio/UPNs e host do agente. Guardar resultado e erros; não basta conseguir abrir o ADUC.
- **OUs/políticas:** lista de OUs, links de GPO, herança/bloqueios e delegações do piloto; OU TI já contém conta administrativa. Filtrar por objetos aprovados, não por um nome presumidamente seguro.
- **Objetos/atributos:** UPN, SID, GUID, mail/proxyAddresses, mS-DS-ConsistencyGuid quando disponível; papéis/sync state/IDs no Entra. Lacunas dos CSVs não autorizam concluir que esses campos estão vazios no diretório.
- **Autorização:** ACL NTFS e SMB dos recursos relevantes, aninhamento e grupos administrativos fora dos sete GG/DL exportados. Os testes pontuais de leitura/criação não auditam todos os direitos dos objetos.
- **Governança/continuidade:** owners de grupos/apps, necessidade de privilégio, recuperação das contas administrativas, auditoria e retenção de logs, licenças e reversão. Não exportar valores de senha, token ou segredo para provar inventário.

### Parecer e limites

**Base coerente para continuar o laboratório, com correções documentais realizadas e preparação técnica pendente.** A lacuna TI foi coberta pela regra nova; o catálogo técnico não mistura conta comum com administração/serviço. As fontes antigas permanecem intactas, inclusive resultados de escopo menor. Nenhuma conclusão de “ambiente integralmente auditado/seguro” ou “híbrido pronto” pode ser sustentada apenas pelos arquivos disponíveis.

Critério para cada próxima entrega: necessidade e owner definidos → fontes atuais → decisão/escopo → mudança controlada → teste positivo/negativo quando aplicável → comparação final → limites e reversão. Novos departamentos só entram se o RH ou o cenário os justificar; novos recursos só entram se acrescentarem uma capacidade prevista no plano.

## Referências técnicas consultadas em 29/09/2026

- [Tenant existente e matching](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-existing-tenant): UPN/proxyAddresses/sourceAnchor; preservar identidade e considerar impacto sobre atributos/senha.
- [Filtragem Connect Sync](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sync-configure-filtering): escopo e proteção de mudanças.
- [Cloud Sync e comparação de capacidades](https://learn.microsoft.com/en-us/entra/identity/hybrid/cloud-sync/what-is-cloud-sync): selecionar método conforme cenário.
