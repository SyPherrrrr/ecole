numbers = []  # Crée une liste pour stocker les nombres saisis

while True:
    user_input = input("Entrez un nombre entier (ou appuyez sur Entrée pour terminer) : ")

    # Vérifie si l'utilisateur a entré une ligne vide
    if user_input == "":
        break

    try:
        number = int(user_input)  # Convertit l'entrée en un nombre entier
        numbers.append(number)  # Ajoute le nombre à la liste
        min_number = min(numbers)  # Trouve le minimum des nombres saisis
        max_number = max(numbers)  # Trouve le maximum des nombres saisis
        average = sum(numbers) / len(numbers)  # Calcule la moyenne des nombres saisis
        print(f"Minimum : {min_number}")
        print(f"Maximum : {max_number}")
        print(f"Moyenne : {average:.2f}") #.2f pour arrondir à 2 chiffres après la virgule
    except ValueError:
        print("Veuillez entrer un nombre entier valide.")

print("Fin de la saisie.")


