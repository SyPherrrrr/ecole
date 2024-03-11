
# Analyse des caractéristiques musicales
# question 1 
df <- read.table('spotify.data')
attach(df) # Pour créer des vecteurs avec les colonnes

summary(df) # Pour avoir toutes les colonnes
summary(BPM) # pour un vecteur particulier
summary(danceability)

boxplot(df) # Permet de faire le schema pour toutes les colonnes du df
boxplot(BPM) # Affiche le schema de BPM

# Question 2 : on voit sur le boxplot qu'il y a des valeurs extrèmes pour l'acousticness et BPM
# Les 3 titres qui maximisent la proba liveness sont : Let It Go - James Bay Spotify Session 2015 [James Bay], 
#Radioactive [Imagine Dragons], She Will Be Loved - Acoustic [Maroon 5]

# Question 3 :  Test de normalité avec shapiro
# Il faut la p-value > 0,05 donc il y a : valence, energy, danceability
shapiro.test(valence)
hist(valence)

# Question 4 : Indicateur de dispersion avec sd() pour l'écart type
> sd(BPM)
[1] 31.11892

apply(df, 2, sd) # df : data frame, 2 pour calculer sur les colonnes et 1 sur les lignes, sd indicateur à calculer

# 1.2 Analyse des corrélations entre caractéristiques musicales
# Question 1 
cor(df)

# valence est plus liée avec danceability qu'avec energy car la corrélation est plus élevée

# Question 2 
pairs(df) # Nuage de points

# Question 3
# cor(x,y) = cov(x,y)/sqrt(var(x)*var(y))
# covariance(x,y) = mean(x*y) - mean(x)*mean(y)

> cov = mean(danceability*acousticness) - mean(danceability)*mean(acousticness)
> cov
[1] -80.104
> source("bibliothèque.R")
> cor = cov/sqrt(varriance(danceability)*varriance(acousticness))  # Utiliser la fonction qu'on avait deja fait pour la variance
> cor
[1] -0.2120455

# Question 4 voir bibliothèque
# BPM  en correlation avec  acousticness  avec une valeur de  -0.2676016 
# danceability  en correlation avec  valence  avec une valeur de  0.4994608 
# danceability  en correlation avec  acousticness  avec une valeur de  -0.2120455 
# energy  en correlation avec  valence  avec une valeur de  0.2637863 
# energy  en correlation avec  acousticness  avec une valeur de  -0.7051655 

# Question 5 
#SIGNIFICATIVÉ
> cor.test(BPM,acousticness ) # p-value = 0.06027 > 0.05 donc on ne rejette pas H0 donc c'est pas significatif
# Faire avec toutes les corélations > 0.2
# energy et acousticness => p-value = 1.083e-08 < 0.05 => on rejette H0 donc cest significatif

# INTENSITÉ
# Une valeur absolue de la corrélation de 0.7 à 1 indique une corrélation forte.
# Une valeur absolue de la corrélation de 0.3 à 0.7 indique une corrélation modérée.
# Une valeur absolue de la corrélation inférieure à 0.3 indique une corrélation faible.



# Question 6 : 
# A Faire, voir photo 14/02


# Partie 2 : les différents coefficients de corrélation

# Générer un vecteur x de 60 observations provenent d'une distribution normale N(0,1)
x = rnorm(60) # Par défaut il y a N(0,1)
y = −3.14*x + 7.04
z = -exp()
t = x*x

# 2.1 Relations parfaites 
plot(x,y)
> plot(x,z)
> cor(x,y)
[1] -1
> cor(x,z)
[1] -0.8698223

# Calcul coefficients de pearson, kendall, spearman
a = cor(x,y, method='pearson')
[1] -1
> b = cor(x,y, method='kendall')
[1] -1
> c = cor(x,x, method='spearman')
[1] 1


# 2.2 Relations bruitées
