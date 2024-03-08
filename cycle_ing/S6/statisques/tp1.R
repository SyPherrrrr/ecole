x <- c(1, 3, 2.7, -1, 3, 4, 6)
y <- x>3
z <- x[x>3]

# A mettre dans la console

# 2 Vecteurs
# Question 1
mode(x) # Retourne le type de la variable
length(x) # Retourne la lingueur de la variable

# Question 2 
summary(x) # Pour obtenir les indicateurs stats de base
hist(x) # Pour renvoyer un histogramme avec x qui doit etre de type 'numeric'

# Question 3 
which(x>3)  # Récupérer les index qui respectent la condition
which(x==3)

# 2.1 Types et conversions
# Question 1 
> numeric(5) # Pour créer un vecteur de numéric de la taille 5
[1] 0 0 0 0 0
> character(5) # Pour créer un vecteur de caractères de la taille 5
[1] "" "" "" "" ""
> logical(5) # Pour créer un vecteur de booléens de la taille 5
[1] FALSE FALSE FALSE FALSE FALSE

# Question 2 Pour convertir le type d'un vecteur
> as.numeric(x)
[1]  1.0  3.0  2.7 -1.0  3.0  4.0  6.0
> mode(x)
[1] "numeric"
> as.character(x)
[1] "1"   "3"   "2.7" "-1"  "3"   "4"   "6"  
> as.logical(x)
[1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE

# Question 3 Pour tester le type d'un vecteur
> is.numeric(x)
[1] TRUE
> is.character(x)
[1] FALSE
> is.logical(x)
[1] FALSE

# 3 Facteurs (vecteur particulier représentant une variable catégorique)
# Vecteur classique (donc rien ne change avec les fonctions)
> x <- c(2,5,3,5,5,-1,3,-1,-1,5,5,5)
> x
 [1]  2  5  3  5  5 -1  3 -1 -1  5  5  5
> class(x)
[1] "numeric"
> levels(x)
NULL
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 -1.000   1.250   4.000   2.917   5.000   5.000 

# Facteur (regroupement par catégorie )
> x <- factor(x) 
> x
 [1] 2  5  3  5  5  -1 3  -1 -1 5  5  5 
Levels: -1 2 3 5
> class(x)
[1] "factor"
> levels(x)
[1] "-1" "2"  "3"  "5" 
> summary(x)
-1  2  3  5 
 3  1  2  6 
> levels(x) <- c("A","B","C","D")
> x
 [1] B D C D D A C A A D D D
Levels: A B C D
> summary(x)
A B C D 
3 1 2 6 # Quantité que la valeur est répétée


# 4 Tableaux de données : dataframes
> x <- c(2,5,3,5,5,-1,3,-1,-1,5,5,5)
> x <- factor(x) 
> y <- c(10,90,32,87,87,-1,3,-1,-1,10,10,90)
> y <- factor(y) 
> z <- c(34,90,20,87,87,-1,32,32,-1,10,10,9)
> z <- factor(z) 

# Fonctions de bases
> nrow(d)
[1] 12
> ncol(d)
[1] 3
> rownames(d)
 [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12"
> colnames(d)
[1] "x" "y" "z"
> dim(d)
[1] 12  3

# Lecture d'un fichier (le mettre dans le projet)
df <- read.table('USArrests.data')

# Les fonctions getwd() et setwd() peuvent ˆetre utiles pour consulter et changer le r ́epertoire de travail.
> getwd()
> setwd("Z:/monDossier/...")

df[2:4] # pour garder que les colonnes de 2 à 4
df[10,] # Accéder à la ligne 10 ou d["nom de la ligne",]
df[10,][1:2] # mixte
df[2] # Accès à une colonne
df[,1] # toutes les valeurs de la colonne 
 > [1] 13.2 10.0  8.1  8.8  9.0  7.9  3.3  5.9 15.4 17.4  5.3  2.6 10.4  7.2  2.2
[16]  6.0  9.7 15.4  2.1 11.3  4.4 12.1  2.7 16.1  9.0  6.0  4.3 12.2  2.1  7.4
[31] 11.4 11.1 13.0  0.8  7.3  6.6  4.9  6.3  3.4 14.4  3.8 13.2 12.7  3.2  2.2
[46]  8.5  4.0  5.7  2.6  6.8

# 5 Lois de proba
x = seq(-10, 20, length=1000) # Grand vecteur
dens = dnorm(x, 5, 3) # fonction de densité
plot(dens)

# Calcul de P(0<X<12)
> pnorm(12,5,3) - pnorm(0,5,3)
[1] 0.9423943

# Calcul 3e quartile
> qnorm(0.75,5,3) 
[1] 7.023469

# Calcul intervalle de confiance à 95% (P(X<a) = 1,95/2)
erreur_standard <- qnorm((1 + niveau_confiance) / 2)
[1] 10.87989

# Ici la moyenne est 5 donc [5 - erreur * (ecart_type/sqrt(n)); 5 + erreur*(ecart_type/sqrt(n))]

# 6.1 Déclaration et éxecution 
# Voir le fichier bibliothèque.R
> source("bibliothèque.R")
> addition(1,6)
[1] 7



# 6.2 Travail demandé

