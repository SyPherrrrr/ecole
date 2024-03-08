df = read.table('cosmetics.data', header = TRUE)  # header = true pour 
attach(df)

# Question 1
# Étude des Corrélations
cor(df)
pairs(df)

# Étude unidimensionnelle 
> summary(df)
      V1                 V2                 V3                 V4           
 Length:33          Length:33          Length:33          Length:33         
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
      V5           
 Length:33         
 Class :character  
 Mode  :character 


# QUESTION 2
 boxplot(elastic~formule) # Pour afficher une variable numérique (elactic) et une catégorique (formule)
# Lecture graphique de la distribution/ écart interqurtile et la médiane
boxplot(elastic~formule) # formule 2 est mieux
> boxplot(hydrat~formule) # formules équivalentes
> boxplot(rides~formule) # formule 1 est mieux 
> boxplot(satisfaction~formule) # formule 1 est mieux

# Avec boxplot de satisfaction on voit que c'est la formule 1 qui l'emporte et 
#avec les autres boxplot on voit quelle formule est la meilleure pour chaque critère cutané


# Question 3 
# Permet de faire un test student sur les moyennes entre la moyenne d'elasticité de la formule 1 et 2
# H0 les 2 échantillons de formules différentes viennent de la meme distribution
t.test(elastic~formule)

        Welch Two Sample t-test

data:  elastic by formule
t = -1.0792, df = 27.917, p-value = 0.2897   # > 0.05 donc pas significatif
alternative hypothesis: true difference in means between group 1 and group 2 is not equal to 0
95 percent confidence interval:
 -0.4507771  0.1397182
sample estimates:
mean in group 1 mean in group 2 
       2.546471        2.702000 

# Pour vérifier les valeurs voir si cest cohérents
> boxplot(elastic~formule)


# Faire pareil pour toutes les variables
# satisfaction
> t.test(satisfaction~formule)

        Welch Two Sample t-test

data:  satisfaction by formule
t = 1.3354, df = 29.995, p-value = 0.1918  # > 0.05 donc pas significatif
alternative hypothesis: true difference in means between group 1 and group 2 is not equal to 0
95 percent confidence interval:
 -0.2491097  1.1902862
sample estimates:
mean in group 1 mean in group 2 
       5.470588        5.000000 

> boxplot(satisfaction~formule)

# HYDRAT
> t.test(hydrat~formule)

        Welch Two Sample t-test

data:  hydrat by formule
t = -0.16158, df = 28.583, p-value = 0.8728  # > 0.05 donc pas significatif
alternative hypothesis: true difference in means between group 1 and group 2 is not equal to 0
95 percent confidence interval:
 -0.1484461  0.1267206
sample estimates:
mean in group 1 mean in group 2 
       1.336471        1.347333 

> boxplot(hydrat~formule)

# RIDES
> t.test(rides~formule)

        Welch Two Sample t-test

data:  rides by formule
t = -2.0515, df = 28.932, p-value = 0.04936  # < 0.05 donc significatif 
alternative hypothesis: true difference in means between group 1 and group 2 is not equal to 0
95 percent confidence interval:
 -2.441075e-02 -3.631172e-05
sample estimates:
mean in group 1 mean in group 2 
     0.08017647      0.09240000 

> boxplot(rides~formule)


# On a fait un test de WELCH 
# si on veut faire un test de student  : t.test(rides~formule, var.equal = TRUE)


# Question 4 
# Test de Fisher pour comparaison 2 variances
# Il faut vérifier que les variables soient distribuées suivant une loi normale => shapiro.test
hydrat_1 = subset(hydrat, formule == 1)
shapiro.test(hydrat_1)

        Shapiro-Wilk normality test

data:  hydrat_1
W = 0.97861, p-value = 0.9434  # > 0.05 

hydrat_2 = subset(hydrat, formule == 2)
shapiro.test(hydrat_2)

        Shapiro-Wilk normality test

data:  hydrat_2
W = 0.96205, p-value = 0.7279 # > 0.05


# Une fois la normalité vérifiée, on peut faire le test de fisher
var.test(hydrat_1, hydrat_2)

        F test to compare two variances

data:  hydrat_1 and hydrat_2
F = 2.0539, num df = 16, denom df = 14, p-value = 0.183 #  0.05 on peut pas rejeter h0 
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 0.7025609 5.7857657
sample estimates:
ratio of variances 
          2.053862 


# Question 5
# calcul de la p-valeur pour le test de student 
# calcul de la p-valeur pour le test de fisher

# voir photo 28/02 et voir formule dans le cours sur le test de student pour avec k (S**2 dans le cours)



# Partie 2 : ANOVA (pour comparer plusieurs échantillons/ groupes)

data = read.table('députés.data')

hist(genre)
boxplot(age)
> summary(data)
     genre           groupe               age          experience   
 Min.   :0.0000   Length:565         Min.   :29.00   Min.   : 1.00  
 1st Qu.:0.0000   Class :character   1st Qu.:45.00   1st Qu.: 5.00  
 Median :0.0000   Mode  :character   Median :54.00   Median : 5.00  
 Mean   :0.4195                      Mean   :53.36   Mean   : 6.52  
 3rd Qu.:1.0000                      3rd Qu.:62.00   3rd Qu.: 5.00  
 Max.   :1.0000                      Max.   :83.00   Max.   :20.00  
 participation    participationSpecialite
 Min.   :0.0200   Min.   :0.0000         
 1st Qu.:0.1200   1st Qu.:0.2000         
 Median :0.1800   Median :0.3500         
 Mean   :0.1896   Mean   :0.3624         
 3rd Qu.:0.2400   3rd Qu.:0.5200         
 Max.   :0.6300   Max.   :0.9700 



boxplot(age~groupe)
table = table(groupe, genre)
assocplot(table)

# On voit que la république en marche favorise les femmes

# Question 2 
boxplot(experience~groupe)

boxplot(age~groupe)

# Question 3
boxplot(participation~groupe) 

# on voit larem la république en marche et GDR

# Question 4 
boxplot(experience~genre) # on voit que les femmes ont toutes 5 ans d'expérience
boxplot(age~genre) # les hommes sont plus agé que les femmes général 


# Question 5 
anova(lm(participation~groupe))
