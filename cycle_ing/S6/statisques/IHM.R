# Installer le package readxl s'il n'est pas déjà installé
# install.packages("readxl")

# Charger la bibliothèque readxl
library(readxl)

# Spécifier le chemin vers votre fichier Excel
chemin_fichier <- "chemin/vers/votre/fichier/excel.xlsx"

# Lire les données à partir du fichier Excel
donnees_excel <- read_excel(chemin_fichier)

# Afficher les premières lignes des données
head(donnees_excel)
