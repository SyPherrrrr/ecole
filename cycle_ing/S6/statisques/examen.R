# Examen
# Exercice 1

# Analyse unidimensionnelle

# Question 1 
boxplot(OdeurCacao, OdeurLait, Amertume, Cacao, Lait, Fondant)
# La distribution lait est la plus basse avec un écart inter quartile bas et quelques valeurs extrèmes élevées 
# La distribution cacao est la plus élevée, avec une médiane et un écart inter quartile les plus élevés


# Question 2


# Question 3 
var(Lait)
[1] 6.801757
# Cet indicateur mesure la dispersion d'une variable. Elle permet de voir l'écart moyen au carré à la moyenne.
# Dans le cas particulier du chocolat cela nous permet de savoir si les avis sont généralement semblables, pas très divisé 
# ou bien s'ils sont plutot extrèmes. 

# Question 4 
# Fondant 
qqnorm(Fondant)
qqline(Fondant)
qqnorm(Amertume)
qqline(Amertume)
# Permet de voir graphiquement la normalité ou non d'une variable
# On peut voir que les points de la varibales Amertume sont plus sur la droite que ceux de Fondant

# Autre test qu'on peut faire :
shapiro.test(Fondant)
p-value = 0.001969

shapiro.test(Amertume)
p-value = 1.707e-06

# on voit que la p-value de Amertume est plus basse que celle de Fondant donc on peut dire que Amertume est plus 
# compatible avec une loi normale


# Question 5 
nb_chocolats = nrow(chocolat) # 300
nb_chocolat_amer = nrow(chocolat[chocolat$Amertume > 5 ,]) # 129
prop = nb_chocolat_amer/nb_chocolats 
# On a une proportion de chocolats jugés amer de 0.43 (43%)


# Question 6 
prop.test(nb_chocolat_amer, nb_chocolats, 0.5)
# p-value = 0.01793 < 0.05 donc on rejette l'hypothèse 

# Question 7 

# J'ai fait une fonction qui détaille les étapes du calcul d'un intervalle de confiance
intervalle_confiance <- function(echantillon) {

    # Nombre d'observations dans l'échantillon
    n <- length(echantillon)

    # Niveau de confiance (par exemple, 95%)
    confiance <- 0.90

    # Degrés de liberté (n-1 pour un échantillon)
    degres_liberte <- n - 1

    # Valeur critique pour un intervalle à deux queues
    alpha <- 1 - confiance
    valeur_critique <- qt(confiance + alpha / 2, df = degres_liberte)

    # Estimation de la moyenne et de l'écart-type de l'échantillon
    moyenne_echantillon <- mean(echantillon, na.rm = TRUE)
    ecart_type_echantillon <- sd(echantillon, na.rm = TRUE)

    # Calcul de l'erreur standard de la moyenne (SEM)
    erreur_standard_moyenne <- ecart_type_echantillon / sqrt(n)

    # Calcul des bornes de l'intervalle de confiance
    borne_inferieure <- moyenne_echantillon - valeur_critique * erreur_standard_moyenne
    borne_superieure <- moyenne_echantillon + valeur_critique * erreur_standard_moyenne

    # Affichage des résultats
    cat("Intervalle de confiance à", confiance * 100, "% pour la moyenne :", "\n")
    cat("Borne inférieure:", borne_inferieure, "\n")
    cat("Borne supérieure:", borne_superieure, "\n")
}


intervalle_confiance(Fondant)
# En utilisant la fonction réalisée on obtient cet intervalle de confiance
# Intervalle de confiance à 90 % pour la moyenne : 
# Borne inférieure: 4.72587 
# Borne supérieure: 5.14213 

# Donc on ne rejette pas l'hypothèse H0 car 5 appartient à l'intervalle




# Analyse Bidimensionnelle

# Question 1 
macor = cor(chocolat)


           OdeurCacao  OdeurLait   Amertume      Cacao       Lait    Fondant
OdeurCacao  1.0000000 -0.5643855  0.5513051  0.7432605 -0.5490479 -0.1047681
OdeurLait  -0.5643855  1.0000000 -0.4581523 -0.5898730  0.8394364  0.3009826
Amertume    0.5513051 -0.4581523  1.0000000  0.7103697 -0.5435060 -0.1914056
Cacao       0.7432605 -0.5898730  0.7103697  1.0000000 -0.6334614 -0.2112109
Lait       -0.5490479  0.8394364 -0.5435060 -0.6334614  1.0000000  0.3245274
Fondant    -0.1047681  0.3009826 -0.1914056 -0.2112109  0.3245274  1.0000000

# Les valeurs qui tendent vers 1 sont celles qui ont des corrélations les plus fortes, celles qui tendent vers -1 sont inversement corrélées
# et celle qui tendent vers 0 sont faiblement corrélées. Ici on peut voir Cacao et odeurCacao, Lait et OdeurLait, Cacao et Amertume
# sont fortement corrélées.

# QUestion 2

pairs(chocolat)

# Fondant et OdeurCaco semble proche de l'indépendance étant donné de la dispersion des valeurs sur le graphique

# Question 3 
# Lait et Amertume sont inversement corrélées. 

# QUestion 4 
cor.test(Fondant, OdeurCacao)
# p-value = 0.06998 > 0.05 donc le test n'est pas significative

# Question 5 



# Variables catégoriques
NiveauFondant = cut(Fondant, breaks=quantile(Fondant, probs = seq(0, 1, 0.25), names=FALSE), labels=c("faiblement fondant","légèrement fondant","plutot fondant","très fondant"), include.lowest=TRUE)

NiveauAmertume = cut(Amertume, breaks=quantile(Amertume, probs = seq(0, 1, 0.25), names=FALSE), labels=c("faiblement amer","légèrement amer","plutot amer","très amer"), include.lowest=TRUE)

# QUestion 1 
pie(summary(NiveauFondant))
pie(summary(NiveauAmertume))

# On voit que c'est plutot équitablement divisé en 4 parties pour les 2 variables

# Question 2 

# Question 3

table_F_A = table(NiveauFondant, NiveauAmertume)
                    NiveauAmertume
NiveauFondant        faiblement amer légèrement amer plutot amer très amer
  faiblement fondant              12              23          23        19
  légèrement fondant               7              22          27        19
  plutot fondant                  21              20          19        14
  très fondant                    35              10           8        21



# Sous indépendance

table(NiveauFondant) %*% t(table(NiveauAmertume)) / sum(table(NiveauAmertume, NiveauFondant))
                    NiveauAmertume
NiveauFondant        faiblement amer légèrement amer plutot amer très amer
  faiblement fondant           19.25           19.25    19.76333  18.73667
  légèrement fondant           18.75           18.75    19.25000  18.25000
  plutot fondant               18.50           18.50    18.99333  18.00667
  très fondant                 18.50           18.50    18.99333  18.00667


  # Question 4 


  # Question 5 
  # En utilisant ma fonction de cramer 
  X2_total <- function(f1, f2, K) {
    table_obs = table(f1, f2)
    table_th = (table(f1) %*% t(table(f2))/K)
    sumd2 = 0
    for (i in 1:nrow(table_obs)) {
        for (j in 1:ncol(table_obs)) {
            sumd2 = sumd2 + ((table_obs[i, j]*table_obs[i, j] - table_th[i, j]*table_th[i, j])/table_th[i,j])
        }
    }
    return (sumd2)
}

cramer <- function(f1, f2, K) {
    khi2 = X2_total(f1, f2, K)
    return (sqrt(khi2/(K*(min(nrow(table(f1,f2)), ncol(ncol(table(f1, f2)))) - 1))))
}


  cramer(NiveauAmertume, NiveauFondant, nrow(chocolat))
# coef de cramer : 0.2157817 d'après le tableau s dessous on voit que le lien est d'intensité moyenne

# | Valeur de Cramer | Intensité de la Relation entre Variables       |
#|-------------------|---------------------------------------------|
#| < 0,10            | Relation Nulle ou Très Faible               |
#| >= 0,10 et < 0,20 | Relation Faible                             |
#| >= 0,20 et < 0,30 | Relation Moyenne                            |
#| >= 0,30           | Relation Forte                              |


# Question 6 





# Exercice 2 

# Analyse 1D et 2D 
df = read.table("agro.data", header = TRUE)
attach(df)
# Question 1 
> nrow(df)
# 75 étudiants

# QUestions 2
boxplot(note)  # on voit l'étendue des notes, l'écart inter quartile, la médiane. 
plot(density(note)) # on voit la distribution des notes 


genref = factor(genre)
cursusf = factor(cursus)
pie(summary(cursusf))  # la plus grande partie viennent de prepa
pie(summary(genref))   # il y a plus de filles que de gars 

# QUestion 3 


# Question 4 
ar_note = mean(note^2) - mean(note)^2
# 3.730713

# Question 5 
table_cursus = table(note, cursus)
assocplot(table_cursus)

table_genre = table(note, genre)
assocplot(table_genre)

plot(note)

# Question 6 
# Il faut faire un test et voir sa p-value mais je ne me souviens plus lequel car genre est une variable catégorique. 
# Il faut calculer un coef mais je ne sais plus lequel. Et comparer avec le tableau et conclure sur l'intensité du test


