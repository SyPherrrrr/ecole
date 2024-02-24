Point = tuple[int, int]


def intersect(O: Point, A: Point, B: Point) -> bool:
    (xO, yO), (xA, yA), (xB, yB) = O, A, B
    return (
            (yO <= yA) == (yO > yB) and
            xO < (xB - xA) * (yO - yA) / (yB - yA) + xA
    )


O = [13,44]
A = [10, 15]
B = [12, 45]

print(intersect(O, A, B))
