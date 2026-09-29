# SoD-001 — conflito tratado no modelo local

Exercício concluído pelo operador em 29/09/2026, com [script](../../../05-automacao/Invoke-SoDLab.ps1) e [regra/roteiro](09-roteiro-sod.md). Dados fictícios separados dos inventários AD/Entra; nenhuma concessão real foi alterada.

| Etapa | Evidência e resultado |
|---|---|
| Antes, 17:06:37 -03:00 | [15 — Antes](15-sod-antes.png): um conflito, no cenário A+B para EMP0007 em Compras-LAB. |
| Decisão e depois, 17:10:04 -03:00 | [16 — Depois](16-sod-depois.png): decisão didática de Carlos Lima exibida; manter ORCAMENTO_APROVAR e retirar FORNECEDOR_MANTER do cenário A+B, pois a manutenção de fornecedores cabe a outra pessoa. Zero conflitos após o filtro, preservando B. |

Cinco cenários independentes: A somente, B somente, A+B, pessoas distintas e escopos distintos. O script agrupa por caso/matrícula/escopo e verifica presença simultânea dos dois direitos. Os quatro casos sem conflito permanecem sem conflito; não foram somados direitos entre pessoas ou escopos diferentes.

Cada execução recria os dados e a etapa Depois aplica o tratamento em memória. Isso demonstra detecção e tratamento da regra conhecida, não execução de revogação numa aplicação. A decisão é simulada e exibida no exercício; não é uma aprovação corporativa externa.

Limites: SoD estática; sem ERP, transações financeiras, API de concessão ou prevenção implantada. GG_FIN_READ não concede esses direitos. Zero conflitos não comprova necessidade de cada acesso, nem encerra a reconciliação do estado atual dos diretórios. A conferência final foi concluída depois, nas provas 17–18; IAM-010 fechado em 29/09 no escopo documentado.
