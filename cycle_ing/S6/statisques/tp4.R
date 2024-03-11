df <- read.table('telephones.data')
attach(df)

# Question 1 
summary(Prix)
Marquef = factor(Marque)
Prixf = factor(Prix)
Autonomief = factor(Autonomie)
Audiof = factor(Audio)
Photof = factor(Photo)
Ecranf = factor(Ecran)
ErgonomieDesignf = factor(ErgonomieDesign)


# Question 2 : construction d'une table de contingence en croisant deux facteurs

> table(Marque, Prix)

         Prix
Marque     A  B  C  D
  Apple    0  1  1  7
  Huawei   8 11  9  8
  Nokia    5  2  5  1
  Samsung  3  4  5  7
  Wiko     5  2  1  0
  Xiaomi   5  5  4  2

> table(Marque, Audio)
         Audio
Marque     A  B  C  D
  Apple    2  4  0  3
  Huawei   0 15 21  0
  Nokia    1  7  4  1
  Samsung  2 16  1  0
  Wiko     0  4  4  0
  Xiaomi   1  9  5  1

mosaicplot(table(Marquef, Prixf)) # Interprétation : Répartition et l'air du carré représente le nombre d'éléments
assocplot(table(Marquef, Prixf)) # Interprétation : Trace l'écart à une répartition équitable

# Question 3 : k est le nombre d'observations // VOIR FEUILLE DE NOTES ET PHOTO 20 FEV 
# t() transposé d'une matrice
# %*%  produit matriciel
# Echantillon d'une taille K = 101
> table(Marque) %*% t(table(Prix)) / 101
         Prix
Marque           A        B        C        D
  Apple   2.316832 2.227723 2.227723 2.227723
  Huawei  9.267327 8.910891 8.910891 8.910891
  Nokia   3.346535 3.217822 3.217822 3.217822
  Samsung 4.891089 4.702970 4.702970 4.702970
  Wiko    2.059406 1.980198 1.980198 1.980198
  Xiaomi  4.118812 3.960396 3.960396 3.960396
> 

# Question 4 : voir bibliothèque et voir feuille de notes
# Les valeurs ne sont pas comparables car le degré de liberté n'est pas le meme
> X2_total(Marquef, Prixf, 101)
[1] 28.51748


# Question 5  : cramer permet de comparer sans prendre en compte les degrés de liberté
# voir ce site pour des details : https://mathcracker.com/fr/calculatrice-v-cramers#results

> cramer(Prixf, Marquef, 101)
[1] 0.3067851
> cramer(Prixf, Audiof, 101)
[1] 0.322252
> cramer(Prixf, ErgonomieDesignf, 101)
[1] 0.4760935                           # ErgonomieDesgin est la caractéristique la plus liée au Prix
> cramer(Prixf, Autonomief, 101)
[1] 0.2031614
> cramer(Prixf, Ecranf, 101)
[1] 0.374005
> cramer(Prixf, Photof, 101)
[1] 0.4743435

# Interprétation : Le coefficient de Cramer est une mesure de l'association entre deux variables catégorielles. 
# Il varie de 0 à 1, où 0 indique aucune association et 1 indique une association parfaite.
# La taille de l'échantillon est à prendre en compte dans l'interprétation du coef de cramer


# Partie 2 : Inf ́erence de l’ ́echantillon vers la population
# Question 1 : 
pairs(vins)











