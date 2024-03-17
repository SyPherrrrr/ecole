# Partie 1 : Analyse 1D


df = read.table("vins.data", header = TRUE)
attach(df)
vins = df

# Question 1 : Combien de vins sont pr ́esents dans le jeu de données ?
nrow(df)

# Question 2 : Visualisez les distributions des variables `a l’aide des repr ́esentations de votre choix et
#r épondez aux questions suivantes :

#— Quel composant est pr ́esent dans le vin en beaucoup plus grandes quantit ́es que les
#autres composants ?
#— Quelles variables pr ́esentent des valeurs extrˆemes du cˆot ́e des petites valeurs ?
boxplot(chlorides, sucre, sulphates)
# on voit que le sulphate est eb plus grande quantité car cest en gramme
# Les cercles sur les schemas représentent les valeurs extrèmes et donc le chloride a des valeurs extreme de petite valeur


# Question 3 : Repr ́esentez la densit ́e continue estim ́ee de la variable sulphates. Qualifieriez-vous cette
# distribution de multimodale ? Justifiez.
plot(density(sulphates))
# On voit qu'un seul pic donc cest pas multimodal

# Question 4 : A l’aide d’un graphique, v ́erifiez la normalit ́e de la variable chlorides.
qqnorm(chlorides) # outil pour voir si les valeurs suivent une loi normale
qqline(chlorides)
# On voit que les points ne suivent pas toujours la ligne donc pas normale

# Autre méthode avec la p-value :
shapiro.test(chlorides) # Si p-value > 0.05 ça suit une loi normale

# Question 5 : Donnez la moyenne et la variance non corrig ́ee de la variable sucre, sans utiliser une
# fonction  écrite par vous.
# variance non corrigée = avec formule de la moyenne sinon corrigée avec
var_sucre = mean(sucre^2) - mean(sucre)^2

# Question 6 : Combien de vins ont un degr ́e d’alcool sup ́erieur à 13% ?
vins_sup13 = df[alcool>13,]
# alcool>13 : on récupère les indices des lignes 
# , : permet de sélectionner toutes les colonnes

# Question 7 : Calculez un intervalle de confiance sur la quantit ́e moyenne de sulphates dans la popula-
# tion des vins. Utilisez le niveau de confiance de 90%. V ́erifiez votre r ́esultat `a l’aide d’une commande R.

intervalle_confiance(sulphates)
# Borne inférieure: 44.34937 
# Borne supérieure: 48.49645

# Pour vérifier 
# Calculer l'intervalle de confiance à 90%
resultat_test <- t.test(sulphate, conf.level = 0.90)

# Afficher l'intervalle de confiance
print(resultat_test$conf.int)

# Question 8 : Est-ce que les donn ́ees remettent en cause l’hypoth`ese H0 d’une quantit ́e moyenne de sucre
# dans la population  ́egale `a 15g ? Pour r ́epondre `a cette question, calculez la p-valeur, puis
# concluez le test. Choisissez un seuil de risque de 1%.
# Calcul de la p-value voir fonction dans bibliothèque
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
# p-value < 0.05 donc la corrélation est significative


# Question 3 : calcul de la valeur observée

correlation = cor(acidite, chlorides, method = 'pearson')
n = nrow(vins)
stat_test = correlation*sqrt(n-2)/sqrt(1 - correlation^2)

# Question 4 : 



# EXERCICE 2 
# Partie 2.1 Analyse 1D

# Question 1 : nombre de films dans le jeux de données
nrow(films)

# Question 2 : Combien de réalisateurs différents sont présents ?
directorf = factor(director)
length(levels(directorf))
# 73

#Question 3 : Visualisez la distribution des cat ́egories de films (genre)
genref = factor(genre)
pie(summary(genref))

# Question 4 : Les donn ́ees remettent-elles en cause l’hypoth`ese H0 d’une proportion de com ́edies  ́egale à 30% dans la population ?
prop.test(sum(genre == "Comedy"), length(genre), 0.3) # On effectue un test de proportion pour savoir si 30% de comedie est envisageable
# p-value = 0.04978 < 0.05 donc on rejette l'hypothèse


# Partie 2.2 : analyse 2D

# Question 1 : Donnez la table de contingence qui croise les deux variables.
table_g_s = table(as.factor(genre),as.factor(starring))


# Question 2 : Question théorique : indiquez par une formule comment vous pouvez calculer la table de contingence attendue sous hypoth`ese d’ind ́ependance.
table(genre) %*% t(table(starring)) / sum(table(genre, starring))


# Question 3 : 
table = table(starring, genre)
assocplot(table)


# Question 4 : Le lien entre les deux variables est-il fort (=intense) ? Est-il significatif ?
cramer(genre, starring, nrow(films))
#  => 0.2516143 voir tableau de cramer => Donc on a une intensité moyenne et non intense entre les variables

