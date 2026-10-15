# Fontes de RH fictícias — versões utilizadas nos tickets

Cada CSV contém as nove pessoas fictícias e as oito colunas do cadastro usado no laboratório. Os recortes dos tickets mostram a pessoa relevante; os links abaixo permitem consultar o arquivo completo daquela etapa. RH define vínculo e cadastro; matriz e decisão do ticket definem os acessos.

| Versão / arquivo completo | Contexto e diferença relevante |
|---|---|
| [29/08 — cadastro inicial](rh-2026-08-29.csv) | IAM-001/Felipe e fundamento do IAM-011/Ana. Ana em PRE_ADMISSAO. |
| [18/09 — atualização de Ana](rh-2026-09-18.csv) | Complemento documental do IAM-011: somente Ana/status passa a ATIVO. A ativação técnica foi em 15/09; este CSV não comprova atualização contemporânea naquele dia. |
| [23/09 — cópia usada no Leaver](rh-2026-09-23.csv) | IAM-003 e reconciliação RH × Entra: Carla DESLIGADO; Gabriela ainda em Suporte. Conteúdo idêntico ao de 18/09, preservado com a coleta de 23/09. |
| [28/09 — Mover e coleta inicial](rh-2026-09-28-mover.csv) | IAM-002 e inventário inicial do IAM-010: somente cargo, área e gestor de Gabriela mudam frente a 23/09. Cópia preservada com o inventário; Diego ainda ATIVO, com término em 30/09. |
| [28/09 — prazo do terceiro revisado](rh-2026-09-28-prazo-terceiro.csv) | Etapa de preparação do IAM-004: término de Diego antecipado para 29/09; status ainda ATIVO. O ticket define o corte de 08:00 UTC−03:00, ausente do CSV. |
| [29/09 — após o término de Diego](rh-2026-09-29.csv) | Encerramento do IAM-004 e fechamento do IAM-010: somente Diego/status passa a DESLIGADO frente à versão do prazo revisado. Isabela permanece ATIVO/TI. |

**Como consultar:** abra primeiro o recorte do ticket; use o CSV completo para conferir a linha, as colunas e a população. A versão mais recente não substitui a fonte histórica de um caso. As duas versões de 28/09 têm papéis diferentes e não devem ser intercambiadas.

## Integridade e limites

Os campos foram revisados para publicação: nomes, gestores, matrículas e datas são fictícios; não há senhas, contatos ou identificadores técnicos do tenant. Por isso, as cópias públicas mantêm os mesmos bytes dos CSVs fictícios preservados. Os hashes abaixo foram conferidos na publicação e identificam o conteúdo; não são assinatura do RH nem prova da hora de aprovação ou execução.

<details>
<summary>SHA-256 dos arquivos completos</summary>

| Arquivo | SHA-256 |
|---|---|
| [rh-2026-08-29.csv](rh-2026-08-29.csv) | `F1EB9BFB37390A8C3D000CDD57DE50DFAF3DB9C8FE6FC7D431EC9DCAF3687694` |
| [rh-2026-09-18.csv](rh-2026-09-18.csv) | `532D4EB71ACF3DCBFE7C8BF94848FE1112F21A58D5501D64695B2F296D45B510` |
| [rh-2026-09-23.csv](rh-2026-09-23.csv) | `532D4EB71ACF3DCBFE7C8BF94848FE1112F21A58D5501D64695B2F296D45B510` |
| [rh-2026-09-28-mover.csv](rh-2026-09-28-mover.csv) | `1836A9BC4F3D9248F30933EA2A65268655ECA51AA7962416A756283C7A128B1E` |
| [rh-2026-09-28-prazo-terceiro.csv](rh-2026-09-28-prazo-terceiro.csv) | `70EA1BC3A2340A28E74AD906DCAB3366446F383899B5F1440131ED52CE790289` |
| [rh-2026-09-29.csv](rh-2026-09-29.csv) | `A10F8A3F5768CD5FEC7D77E4D3D1AC9168B779070DB5158F8F648AC3AAF875DC` |

</details>

Exportações brutas de AD/Entra e logs completos continuam privados. Publicar a fonte de RH permite consultar o esperado, mas não torna todas as comparações reproduzíveis sem os inventários observados.

[Voltar aos tickets](../../../00-operacao-itsm/05-fila-tickets.md) · [Índice de evidências](../../README.md).
