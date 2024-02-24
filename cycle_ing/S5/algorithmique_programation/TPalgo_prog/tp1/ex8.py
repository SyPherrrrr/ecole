
def collatz(n: int) -> int:
    return n/2 if n%2==0 else 3*n+1


liste = []
max = 0
maxn = 0
for n in range(10000+1):
    while collatz(n) !=1:
        n = collatz(n)
        liste.append(n)
    if len(liste)> max:
        max = len(liste)
        maxn = n
print(f"La plus grande liste est de {max} et obtenu avec n = {maxn}")
print(liste)