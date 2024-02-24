from ctypes import Array, c_int
from tp0.util import alloc
from dataclasses import dataclass,field

@dataclass
class ArrayList:
    size: int
    array: Array
    max_size: int = 10


def al_new(m: int = 10, l:list[int] = None) -> ArrayList:
    tab: Array = alloc(m)
    for i in range(m):
        if i <len(l):
            tab[i] = l[i]
        else:
            tab[i]=0
    if m < len(l):
        s = m
    else:
        s = len(l)
    return ArrayList(max_size = m, size = s , array = tab )

liste = [7,7,3,9,1,6,0,8,0]
a = []
tab = al_new(m=12, l=liste)
print(tab)
#print("taille : ",tab.size)
#print("taille max : ",tab.max_size)
#print("valeur case 0 array : ",tab.array[0])

def al_len(tab: ArrayList) -> int:
    l = []
    for i in range(tab.size):
        l.append(tab.array[i])
    if l is None:
        l=[]
    taille = len(l)
    return taille

#print("La taille avec la fonction al_len : ",al_len(al_new(m=10, l=liste)))

def al_is_empty(tab: ArrayList) -> bool:
    return True if al_len(tab) == 0 else False

#print(al_len(tab))
#print(al_is_empty(tab))

def al_str(tab: ArrayList) -> str:
    return str(tab.array[:tab.size])

#print(al_str(tab))



#Exercice 5
def al_get(tab: ArrayList, i: int) -> int:
    while True:
        try:
            if 0<= i < tab.size:
                return tab.array[i]
            else:
                raise IndexError("Position incorrecte")
        except IndexError as e:
            print(e)
            i = int(input("Veuillez saisir une nouvelle position : "))

#print(al_get(tab,50))

def al_set(tab: ArrayList, i: int, item: int) -> ArrayList:
    if  0<=i<tab.size:
        tab.array[i] = item
        return tab.array[:tab.size]

#print(al_set(tab,1,45))

def al_lookup(tab: ArrayList, item: int) -> int or None:
    if item in tab.array:
        for i in range(tab.size):
            if tab.array[i] == item:
                return i
    else:
        return None

#print(al_lookup(tab,3))

def al_remove(tab: ArrayList, i: int) -> ArrayList:
    l = []
    for j in range(len(tab.array)):
        if j != i:
            l.append(tab.array[j])
            print(j)
        print(j)
    tab = al_new(tab.max_size,l)
    return tab

#print(f"tab.array avant : {tab.array}")
#print(f"al_remove(tab,4) : {al_remove(tab,4)}")
#print(f"tab.array apres : {tab.array}")

def al_insert(tab: ArrayList, i: int, item: int):
    l = []
    try:
        if len(tab.array)< tab.max_size:
            for j in range(len(tab.array)):
                if j == i:
                    l.append(item)
            l.append(tab.array[j])
            tab = al_new(tab.max_size,l)
        else:
            raise OverflowError("Débordement de capacité")
    except IndexError:
        raise IndexError("Position incorrecte")
    return tab

#print(tab.array[::])
#print(al_insert(tab,5,20).array[::])

#Exercice 7
def partionne(i: int, j: int) -> int:  # i indice de début de tableau et j indice de fin de tableau
    pivot = tab[i]  # valeur pivot
    deb = i+1  # indice de debut de recherche (= indice après le pivot)
    fin = j  # indice de fin de recherche (= indice de la dernière case du tableau)

    while deb <= fin:
        while tab[fin] > pivot:  # pas de condition de sortie de tableau car au pire des cas tab[fin] = pivot
            fin = fin - 1
        while deb <= j and tab[deb] <= pivot:  # condition deb <= j pour ne pas sortir du tableau
            deb = deb + 1
        if deb < fin:  # les valeurs à l'indice deb et fin sont mal placées
            tab[deb], tab[fin] = tab[fin], tab[deb]  # on replace les valeurs du bon côté du tableau
            deb = deb + 1
            fin = fin - 1
    tab[i], tab[fin] = tab[fin], tab[i]  # on place la valeur pivot à la bonne place dans le tableau
    return fin  # on retourne l'indice où se trouve maintenant le pivot



def quicksort(tab):
    if len(tab) <= 1:
        return tab
    else:
        pivot_index = len(tab) // 2
        pivot = tab[pivot_index]

        elements_inf = [x for x in tab if x < pivot]
        elements_eq = [x for x in tab if x == pivot]
        elements_sup = [x for x in tab if x > pivot]

        return quicksort(elements_inf) + elements_eq + quicksort(elements_sup)

# Exemple d'utilisation :
exemple_tab = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
resultat = quicksort(exemple_tab)
print(resultat)



