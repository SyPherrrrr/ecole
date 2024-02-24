import re

def calculateur()-> str:
    resultat = None
    calcul = input("Saisir le calcul : ")

    if calcul[-1] != "=":
        return "Il n'y a pas de egal en dernier caractère"

    if "+" not in calcul and "*" not in calcul and "%" not in calcul and "//" not in calcul:
        return "Il manque un opérateur correct"

    if "-" in calcul:
        return "Il ne faut pas d'entiers négatifs"
    nombres = re.findall(r'\d+',calcul) # autre possibilité de teser re.split(r'[*+//%-=])
    if len(nombres)>2: # Pour voir s'il y a bien qu'une opération dans le calcul
        return "Il n'y a pas qu'une opération"

    if "+" in calcul:
        resultat = int(nombres[0]) + int(nombres[1])
    if "*" in calcul:
        resultat = int(nombres[0]) * int(nombres[1])
    if "//" in calcul:
        resultat = int(nombres[0]) // int(nombres[1])
    if "%" in calcul:
        resultat = int(nombres[0]) % int(nombres[1])


    print(f"Le résultat est : {resultat}")
    return resultat

calculateur()