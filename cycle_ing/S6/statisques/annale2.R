# Partie 1 : Analyse 1D


df = read.table("vins.data", header = TRUE)
attach(df)
vins = df

# Question 1 
nrow(df)

# Question 2
boxplot(chlorides, sucre, sulphates)
# on voit que le sulphate est eb plus grande quantité car cest en gramme
# Les cercles sur les schemas représentent les valeurs extrèmes et donc le chloride a des valeurs extreme de petite valeur


# Question 3
plot(density(sulphates))
# On voit qu'un seul pic donc cest pas multimodal

# Question 4 : normalité d'une variable
qqnorm(chlorides) # outil pour voir si les valeurs suivent une loi normale
qqline(chlorides)
# On voit que les points ne suivent pas toujours la ligne donc pas normale

# Autre méthode avec la p-value :
shapiro.test(chlorides) # Si p-value > 0.05 ça suit une loi normale

# Question 5 : variance non corrigée = avec formule de la moyenne sinon corrigée avec 
var_sucre = mean(sucre^2) - mean(sucre)^2

# Question 6
vins_sup13 = df[alcool>13,]
# alcool>13 : on récupère les indices des lignes 
# , : permet de sélectionner toutes les colonnes

# Question 7 : intervalle de confiance
intervalle_confiance(sulphates)
# Borne inférieure: 44.34937 
# Borne supérieure: 48.49645

# Pour vérifier 
# Calculer l'intervalle de confiance à 90%
resultat_test <- t.test(sulphate, conf.level = 0.90)

# Afficher l'intervalle de confiance
print(resultat_test$conf.int)

# Question 8 : Calcul de la p-value voir fonction dans bibliothèque
calculate_p_value(sucre, 15)
0.03207212


# On ne rejette pas H0 car pvaleur > 0.01



# Partie 2 : Analyse 2D
# Question 1 : 
pairs(vins)

# bonne corrélation => droite linéaire 
# mauvaise corrélation => points dispersés
# on retiens sucre et sulphates qui sont corrélées et alcool 

# Valeurs numériques 
cor(vins, method = "pearson") # proche de 1 bonne corrélation

# Question 2 : corrélation significative
cor.test(sulphates, sucre)
# p-value < 0.05 donc le test est significatif


# Question 3 : calcul de la valeur observée

correlation = cor(acidite, chloridiques, method = 'pearson')
n = nrow(vins)
stat_test = correlation*sqrt(n-2)/sqrt(1 - correlation^2)

# Question 4 : 


