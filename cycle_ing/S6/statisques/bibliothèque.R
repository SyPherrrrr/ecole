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


calculate_p_value <- function(variable,h0) {

    sample_mean <- mean(variable)
    sample_size <- length(variable)
    population_mean <- h0
    sample_sd <- sd(variable)

    t_value <- (sample_mean - population_mean) / (sample_sd / sqrt(sample_size))
    df <- sample_size - 1
    p_value <- 2 * pt(abs(t_value), df = df, lower.tail = FALSE)

    return(p_value)

}