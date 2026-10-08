# Diego — comparação após encerramento

Em 29/09/2026 foi feita nova comparação depois das mudanças, usando o RH vigente de 29/09 e o CSV Entra exportUsers_2026-9-29.csv recebido às 11:55. Matrícula EMP0004 correlacionada de forma única; mesmo Object ID da conta anterior e dos eventos.

| Regra | Esperado | Observado | Resultado |
|---|---|---|---|
| Conta habilitada conforme RH | False, pois RH=DESLIGADO | accountEnabled=False | CONFORME |
| Preservar identidade existente | Mesmo Object ID | af6fd404-ebf1-491a-ade0-809bf0e7f0bf | CONFORME |

O resultado confirma o bloqueio cadastral da mesma conta. Não é comparação de grupos, papéis ou aplicações; o CSV All users não contém esses vínculos. Não comprova encerramento imediato de todos os tokens/sessões de recursos. Coletas integrais e hashes preservados em área privada.

[Voltar à sequência de evidências](README.md).
