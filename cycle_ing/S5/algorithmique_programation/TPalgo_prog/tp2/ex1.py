def factorielle(n: int)->int:
    return 1 if n==0 else n*factorielle(n-1)

print(factorielle(10))