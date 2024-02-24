def robot_cupide(damier: list[list[int]], x: int = 0, y: int = 0,road: list = []) -> int:
    N = len(damier)
    M = len(damier[0])

    if (x, y) == (N - 1, M - 1):
        road.append((x,y))
        print(road)
        return damier[x][y]

    if x+1 < N and y+1 < M:
        if damier[x + 1][y] > damier[x][y + 1]:
            road.append((x,y))
            return damier[x][y] + robot_cupide(damier, x + 1, y,road)

        else:
            road.append((x, y))
            return damier[x][y] + robot_cupide(damier, x, y + 1,road)

    elif x+1 == N:
        road.append((x, y))
        return damier[x][y] + robot_cupide(damier, x, y + 1,road)
    elif y+1 == M:
        road.append((x, y))
        return damier[x][y] + robot_cupide(damier, x + 1, y,road)
    else:
        print("erreur")


damier1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
damier = [
    [1,1,0],
    [0,1,1],
    [0,0,1]
]

resultat = robot_cupide(damier)
print(resultat)