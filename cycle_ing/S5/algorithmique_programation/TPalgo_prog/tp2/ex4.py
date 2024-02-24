def nb_digits(n: int, base: int)-> int:
    if n < base :
        return 1
    return 1 + nb_digits(n//base,base)

print(nb_digits(10,2))

def convert(n: int, base: int) -> list:
    liste = []
    while n > 0 :
        r = n % base
        n = n//base
        liste.append(r)
    liste.reverse()
    return liste

print(convert(10,2))

def convert_mirror(n: int, base: int) -> list:
    liste = convert(n,base)
    liste.reverse()
    return liste
print(convert_mirror(10,2))
