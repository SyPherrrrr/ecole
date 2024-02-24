from __future__ import annotations
from dataclasses import dataclass



@dataclass
class HashMap:
    pairs: list[Item]
    current_size: int = 0   # taille actuelle de la liste
    max_size: int = 2**20   # taille effective du tableau qui doit etre une puissance de 2


@dataclass
class Item:
    key: str = None
    value: int = None


def hm_size(aa: HashMap) -> int:  # Taille ici est le nb d'éléments ajouter
    return len(aa.current_size)


def hm_is_empty(aa: HashMap) -> bool:
    return aa.current_size == 0


def hm_new(l : list[Item], current_size : int = 0,puissance2: int = 20) -> HashMap:
    return HashMap(l,current_size,2**puissance2)


def hm_get(aa: HashMap, k: str) -> int:
    for item in aa.pairs:
        if item.value is not None and item.key is not None:
            if item.key == k:
                return item.key  # jai changé item.value par item.key pour HashSet
    return None


def hm_put(aa: HashMap, k: str, v: int) -> HashMap:
    for item in aa.pairs:
        if item.value is None and item.key is None:
            item.key = k
            item.value = v
            aa.size += 1

            return aa


def hm_delete(aa: HashMap, k: str) -> HashMap:
    for item in aa.pairs:
        if item.key == k:
            item.key = None
            item.value = None
            aa.size -= 1
            return aa



def hm_str(aa: HashMap) -> str:
    dico = "{"
    for item in aa.pairs:
        if item.key is not None and item.value is not None:
            dico += item.key + ": " + str(item.value) + ","
    dico = dico[:-1]
    dico += "}"
    return str(dico)

item1 = Item(key="clé1", value=42)
item2 = Item(key="clé2", value=17)
item3 = Item(key="clé3", value=99)

m = 8

hm = hm_new([])
print(hm.size)
print(hm_is_empty(hm))

hm_put(hm,k="clé1", v=42)
hm_put(hm,k="clé2", v=17)
hm_put(hm,k="clé3", v=99)

print(hm_str(hm))



@dataclass
class HashSet:
    data: HashMap
    size: int = 0

def hs_size(hs: HashSet)->int:
    return hs.size


def hs_is_empty(hs:HashSet) -> bool:
    return hs.size == 0


def hs_new(hm: HashMap) -> HashSet:
    return HashSet(hm,1)


def hs_member(hs: HashSet,e:int) -> bool:
    return hm_get(hs.data,e) == e


def hs_insert(hs: HashSet, e: int) -> HashSet:
    if hs_member(hs,e) is False:
        hs.data = hm_put(hs.data,e,0)
        hs.size += 1
    return hs


def hs_delete(hs: HashSet, e: int) -> HashSet:
    if hs_member(hs, e):
        hs.data = hm_delete(hs.data, e)
        hs.size -= 1
    return hs


def hs_str(hs:HashSet) -> str:
    l = []
    l.append((hm_str(hs.data),"taille : " + str(hs.size)))
    return str(l)

hs = hs_new(hm)
hs_insert(hs,'10')
print(hs_str(hs))
hs_delete(hs,'10')
print(hs_str(hs))



# Exercice 3 du palindrome

#def palindrome(mot: str, ) -> str:
