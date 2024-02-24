def pgcd(a: int ,b: int )->int:
    return a if b==0 else pgcd(b,a%b)

print(pgcd(12,15))


def pgcd_iteratif(a, b):
    while b !=0:
        a, b = b, a % b
    return a

nombre1 = 4
nombre2 = 12
resultat = pgcd_iteratif(nombre1, nombre2)
print(f"Le PGCD de {nombre1} et {nombre2} est {resultat}")
