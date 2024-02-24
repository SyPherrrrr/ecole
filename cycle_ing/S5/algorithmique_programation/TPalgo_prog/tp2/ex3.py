def fibonacci_recusrive(n: int)->int:
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fibonacci_recusrive(n-1) + fibonacci_recusrive(n-2)

def fibonacci_memorisation(n: int)->int:
    f = [0,1]
    for i in range(n+1):
        a = f[i] + f[i+1]
        f.append(a)
    return f[n]

print(fibonacci_recusrive(7))
#
