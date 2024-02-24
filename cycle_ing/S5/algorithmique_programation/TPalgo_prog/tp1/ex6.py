def creation_championnat(nb_equipes: int) -> list:
    equipes = 0

    if nb_equipes%2 != 0 :
        equipes = nb_equipes + 1
    else:
        equipes = nb_equipes

    equipe_pivot = equipes

    nb_journees = equipes - 1

    matchs = []
    journee = []

    for jour in range(1,nb_journees+1):
        journee = []
        for i in range(1,equipes//2+1):
            if i == 1:
                if nb_equipes%2==0:
                    equipe_domicile = equipes
                else:
                    equipe_domicile = 0
            else:
                equipe_domicile = ((jour + i - 2)%(equipes - 1)) + 1

            equipe_exterieure = ((jour - i + equipes - 1)%(equipes -1)) + 1

            if equipe_domicile == equipe_pivot and jour%2==0:
                equipe_domicile, equipe_exterieure = equipe_exterieure, equipe_domicile

            journee.append((equipe_domicile,equipe_exterieure))

        matchs.append(journee)

    return matchs


def afficher_calendrier(championnat):
    for jour, journee in enumerate(championnat, start=1):
        print(f'Journée N°{jour}:')
        for match in journee:
            if match[0] == 0:
                print(f"équipe {match[1]} est au repos")
            elif match[1] == 0:
                print(f"équipe {match[0]} est au repos")
            else:
                print(f'équipe {match[0]} reçoit équipe {match[1]}')
        print()


if __name__ == "__main__":
    nb_equipes = 6
    calendrier = creation_championnat(nb_equipes)
    print(calendrier)
    afficher_calendrier(calendrier)

