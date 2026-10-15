"""Recorte de leitura da comparacao de fechar-mover-2809.py, publicado em 15/10/2026.

Preserva as seis regras historicas; acrescenta argumentos e validacao de entrada.
Somente le CSVs locais. Nao consulta nem altera AD/Entra ou arquivos de evidencias.
"""
import argparse
import csv
import sys

EMPLOYEE_ID = "EMP0007"
OBJECT_ID = "2d5bee1a-e26c-47ef-bea2-a55a2fd8614d"


def rows(path, required):
    with open(path, encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream)
        if not set(required).issubset(reader.fieldnames or []):
            raise ValueError(f"Colunas ausentes em {path}: esperado {required}")
        result = list(reader)
        if any(row.get(key) is None for row in result for key in required):
            raise ValueError(f"Linha incompleta em {path}")
        return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("rh", "users", "financeiro", "suporte"):
        parser.add_argument(f"--{name}", required=True)
    args = parser.parse_args()
    rh = [r for r in rows(args.rh, ["employee_id", "status", "area", "cargo"])
          if r["employee_id"] == EMPLOYEE_ID]
    users = [u for u in rows(args.users, ["employeeId", "id", "accountEnabled", "department", "jobTitle"])
             if u["employeeId"] == EMPLOYEE_ID]
    if len(rh) != 1 or len(users) != 1:
        raise ValueError("EMP0007 deve ter exatamente uma correspondencia em RH e Entra.")
    r, u = rh[0], users[0]
    if r["status"] not in ("ATIVO", "DESLIGADO"):
        raise ValueError("Status RH fora do escopo historico.")
    if u["accountEnabled"] not in ("True", "False"):
        raise ValueError("accountEnabled deve usar True/False, conforme o CSV historico.")
    fin, sup = rows(args.financeiro, ["id"]), rows(args.suporte, ["id"])
    for members in (fin, sup):
        ids = [member["id"] for member in members]
        if any(not value.strip() for value in ids) or len(ids) != len(set(ids)):
            raise ValueError("ID vazio ou duplicado na exportacao de membros.")
    # Identidade: ID anterior. Cadastro: RH. Grupos: regra aprovada no cenario.
    checks = [
        ("Object ID preservado", OBJECT_ID, u["id"]),
        ("Conta habilitada conforme RH", str(r["status"] == "ATIVO"), u["accountEnabled"]),
        ("Departamento", r["area"], u["department"]),
        ("Cargo", r["cargo"], u["jobTitle"]),
        ("GG_SUP_TICKET: associacao direta", "False", str(any(x["id"] == OBJECT_ID for x in sup))),
        ("GG_FIN_READ: associacao direta", "True", str(any(x["id"] == OBJECT_ID for x in fin))),
    ]
    writer = csv.writer(sys.stdout, lineterminator="\n")
    writer.writerow(["Regra", "Esperado", "Observado", "Resultado"])
    for rule, expected, observed in checks:
        writer.writerow([rule, expected, observed, "CONFORME" if expected == observed else "EXCECAO"])
    exceptions = sum(expected != observed for _, expected, observed in checks)
    print(f"{len(checks)} regras; {exceptions} excecoes. Somente arquivos fornecidos.", file=sys.stderr)
    return 1 if exceptions else 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (OSError, ValueError, csv.Error) as error:
        print(f"Comparacao inconclusiva: {error}", file=sys.stderr)
        sys.exit(2)
