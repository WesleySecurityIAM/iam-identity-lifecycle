# Diego — RH e vigência do encerramento

Na fonte fictícia vigente de **29/09/2026**, o registro de EMP0004 é:

```csv
employee_id,nome,cargo,area,gestor,admissao,desligamento,status
EMP0004,Diego Rocha,Terceiro de Sistemas,TI,Fernanda Souza,2026-06-01,2026-09-29,DESLIGADO
```

Recorte literal de `290926/hr_authoritative_source.csv`; fonte integral privada, SHA-256 `A10F8A3F5768CD5FEC7D77E4D3D1AC9168B779070DB5158F8F648AC3AAF875DC`.

O RH informa a **data e a situação do vínculo**. O [ticket IAM-004](../../../00-operacao-itsm/05-fila-tickets.md#iam-004) define o horário simulado de corte, **29/09 às 08:00 UTC−03:00**, que não consta do CSV. A [captura de 28/09](01-expiracao-configurada.png) demonstra a configuração desse horário no AD.

Após a vigência, o esperado é impedir novas autenticações: expiração no AD e bloqueio/revogação tratados separadamente no Entra. `Enabled=True` no AD não invalida o controle por expiração demonstrado pelo erro 1793. O encerramento ocorreu pelo prazo do terceiro, não pela lacuna de TI na matriz.

O RH é fonte do esperado; não comprova execução. [Seguir as provas técnicas](README.md#validacao-ad) → [comparação cadastral Entra após as mudanças](07-comparacao-final.md).
