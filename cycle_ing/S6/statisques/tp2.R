df <- read.table('medical.data')
# Question 1
# N.A signifie non attribué 

# Question 2 
attach(df) permet de créer des vecteur avec comme noms les noms des colonnes et possèdant les valeurs
agef = factor(age)
sexef = factor(sexe)
taillef = factor(taille)
poidsf = factor(poids)
groupe.sanguinf = factor(groupe.sanguin)
nb.opf = factor(nb.op)

# question 3 
# Dispersion sd() car écart type et var() pour la variance 
a = mean(taille, trim = 0.2, na.rm = TRUE)
b = var(age)
c = sd(age)
d = median(age)
e = quantile(age)
f = IQR(age)

source("bibliothèque.R")
# Question 4
#voir fonction varriance dans bibliothèque et bien penser à avoir des valeurs numériques dans le vecteur
# variance Biaisée divisée par n-1 et non biaisée par n cela explique la différence entre les 2


# Question 5
# summary(df) permet de résumer tout le df


# partie graphique
# Question 1 

#boxplot(age) graphique pas fou 
# Hist pour faire un histogramme
#pie(summary(poidsf))

# Multimodale = plusieurs valeurs qui ont le plus grand nombre de répétitions
# Hist(taille, breaks=15) pour voir si cest multimodale (plusieurs sommets = multimodale)
#hist(poids, freq=FALSE) pour la densité au lieu de la fréquence


#Question 2
#plot(ecdf(poidsf) pour afficher la fonction de répartition empirique

# Question 3
#plot(density(age, adjust=0.5)) permet de calcul la fonction de densité de l'age et adjust influence le lissage de la courbe
#lines(density(age))

# hist(age, freq=FALSE)
# lines(density(age))     Pour supperposer les courbes (bien changer l'échelle avec freq pour avoir la densité)


#Question 4
#qqnorm(age)  avec nos valeurs
#qqline(age)  la ligne idéale

# Intervalle de confiance
# Question 1
#Voir fonction dans la bibliothèque

#Question 2 
# Non car 1.75 n'est pas dans l'intervalle de confiance

# 2 - tests d'hypothèses simples
# Question 1
shapiro.test(taille) # Résultat 0.2151, comme supérieure à 0.05 on ne peut pas rejetter l'hypothèse H0 donc ça suit une distribution normale
shapiro.test(poids)  # Résultat : 0.3475 -> suit une distribution normale

#Question 2
# H0 : 
t.test(taille,mu=175) # test avec une valeur de moyenne de 1,75m pas dans l'intervalle de confiance -> p-value = 0.005329 < 5% donc on rejette H0 donc pas de disrtibution de student
t.test(taille,mu=168) # test avec une valeur moyenne de 1,68m qui est dans l'intervalle de confiance -> p-value = 0.9234 > 5% donc on ne rejette pas H0 mais on ne pas conclure sur la véracité de cette distribution

a = mean(taille, trim = 0.2, na.rm = TRUE)   # Pas la meme 

#Question 3
a = mean(poids, trim = 0.2, na.rm = TRUE)   # Les deux moyennes ne sont pas exactement les memes 
t.test(poids)

#Question 4 : Prop test pour comparer des proportions / H0 : la proportion d'homme est équivalente à celle des femmes (pas sur de H0)
nb_homme = sum(sexe=="M")
nb_total = length(sexe)
prop.test(nb_homme, nb_total, 0.5) # de la forme (nb de succès, nb d'éléments, proportion)
                                   # On obtient p-value = 0.6714 > 5% donc on ne rejette pas H0 

# Question 5 : conf.level est l'intervalle de confiance
# Le niveau de confiance plus bas augmente l'intervalle de confiance 
t.test(taille,mu=168, conf.level=0.8)
t.test(taille,mu=168, conf.level=0.95)

# La moyenne modifie la p-value
t.test(taille,mu=168, conf.level=0.95)
t.test(taille,mu=175, conf.level=0.95)

# Question 6 
t.test(taille,mu=175, conf.level=1) # on obtient des bornes -inf : inf car si on veut etre sur il faut tout prendre
t.test(taille,mu=175, conf.level=0) # On obtient comme bornes la moyenne 


