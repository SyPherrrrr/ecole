addition <- function(x,y) { 
    z <- x+y
    print(z)
    return(z)
}

moyenne <- function(X) {
    somme = 0
    for (i in X) {
        somme = somme + i
    }
    moyenne = somme/length(X)
    return(moyenne)
}

moyenne_carre <- function(X) {
    somme = 0
    for (i in X) {
        somme = somme + i*i
    }
    moyenne = somme/length(X)
    return(moyenne)
}



varriance <- function(x) {
    var = moyenne_carre(x) - moyenne(x)*moyenne(x)
    return(var)
}

intervalle_confiance <- function(echantillon) {

    n = length(echantillon)  
    confiance = 0.95
    dl = n-2  # Degré de liberté
    alpha = 1 - confiance

    # Lecture dans la table de student
    valeur_critique = qt(alpha/2, dl)

    moyenne_echantillon = mean(echantillon, na.rm = TRUE)
    ecart_type_echantillon = sd(echantillon, na.rm=TRUE)

    erreur_standard_moyenne = ecart_type_echantillon/sqrt(n) 

    borne_inférieure = moyenne_echantillon - valeur_critique*erreur_standard_moyenne
    borne_supérieure = moyenne_echantillon + valeur_critique*erreur_standard_moyenne
    cat("borne_inférieure : ",borne_inférieure, "\n")
    cat("borne_supérieure : ",borne_supérieure, "\n")

}


# Question 1.2.4 tp 3

sort_cor <- function(df, min) {
    cor = cor(df)

    for (i in 1:ncol(cor)) {
        for (j in i:ncol(cor)) {
            if (i!=j) {
                if (abs(cor[i,j]) > min) {
                    cat(colnames(cor)[i]," en correlation avec ", colnames(cor)[j]," avec une valeur de ",cor[i,j], "\n")
                }
            }
        }
    }
}


# Question 4 TP4 


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


# Question 5 tp 4 

cramer <- function(f1, f2, K) {
    khi2 = X2_total(f1, f2, K)
    return (sqrt(khi2/(K*(min(nrow(table(f1,f2)), ncol(ncol(table(f1, f2)))) - 1))))
}

