from ctypes import Array, c_int
from random import randint
from typing import List, Optional


def alloc(m: int) -> Array:
    IntArrayType = c_int * m
    return IntArrayType()

# Collection of an integer number
def saisir_entier(invite: str = 'Saisir un nombre entier : ', escape: str = "*") -> Optional[int]:
    flag = False
    while not flag:
        try:
            print("Le caractère d'échappement est '*' ")
            flag = True
            x = int(input(invite + "\n"))
            if x == escape:
                x = None
            return x
        except ValueError:
            print()


# Collection of a String
def saisir_chaine(invite: str = 'Saisir une chaine de caractère : ') -> str:
    flag = False
    while not flag:
        try:
            flag = True
            x = input(invite + "\n")
            return x
        except ValueError:
            print("")


# Add new integer in List
def ajouter_saisie(tab: List[int]) -> bool:
    new_int = saisir_entier()
    is_add: bool

    if new_int is None:
        is_add = False
    else:
        tab.append(new_int)
        is_add = True

    return is_add


# Create new tab with integer asked to the user
def saisir_tableau() -> List[int]:
    new_tab: List = []

    while ajouter_saisie(new_tab):
        print("Ajout effectué")

    return new_tab


# Create new tab with n number witch the value is between a and b
def remplir_tableau(n: int, a: int = 0, b: int = 100) -> List[int]:
    new_tab: List = []

    for i in range(n):
        new_int = randint(a, b)
        new_tab.append(new_int)

    return new_tab


# Test function
if __name__ == '__main__':
    tab: List[int] = [1, 2, 3]

    print("ajouter saisie", ajouter_saisie(tab))
    print(tab)
    print("saisir tableau :", saisir_tableau())
    print("remplir tableau :", remplir_tableau(10))