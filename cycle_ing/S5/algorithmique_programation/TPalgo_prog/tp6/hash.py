def encodage(s: str) -> int:

    code = ""
    for a in s:
        code += str(ord(a))
    return int(code)

print(encodage("Bonjour"))


def compression(m: int,value: int) -> int:

    index = value % m   # reste de la division euclidienne

    return index

def H(d : dict, m: int):

    t = [[] for _ in range(m)]
    print(t)

    for s in d.values():
        c = encodage(s)
        index = compression(m,c)
        t[index].append(s)

    return t

dictionnaire = {
    0: "Python",
    1: "GPT-3",
    2: "OpenAI",
    3: "Langage",
    4: "Liste",
    5: "Informatique",
    6: "Intelligence",
    7: "Artificielle",
    8: "Programmation",
    9: "ChatGPT"
}


print(H(dictionnaire,12))


#with open('liste_de_mots_francais_frgut.txt','r') as fichier:
 #   contenu = fichier.read()

#print(contenu)

