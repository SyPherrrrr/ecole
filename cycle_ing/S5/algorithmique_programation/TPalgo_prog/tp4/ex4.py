def revers_list(l: list[int],k: int)-> list:
    if len(l) == 0:
        raise IndexError("Liste vide")

    if len(l) == 1:
        return l

    if k > len(l)/2:
        raise IndexError("K n'est pas bon")

