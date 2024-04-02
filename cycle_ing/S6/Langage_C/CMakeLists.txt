cmake_minimum_required(VERSION 3.27)
project(Langage_C)

set(CMAKE_CXX_STANDARD 14)

include_directories(annales/2021-2022/Correction_2021-2022)
include_directories(annales/2021-2022/revision)
include_directories(annales/2022-2023/Correction_2022-2023/src)
include_directories(annales/2022-2023/revision)
include_directories(tp1)
include_directories(tp2)
include_directories(tp3)
include_directories("tp3 max")

add_executable(Langage_C
        annales/2021-2022/Correction_2021-2022/annuaire.c
        annales/2021-2022/Correction_2021-2022/annuaire.h
        annales/2021-2022/Correction_2021-2022/main.c
        annales/2021-2022/revision/annuaire.c
        annales/2021-2022/revision/annuaire.h
        annales/2021-2022/revision/main.c
        annales/2022-2023/Correction_2022-2023/src/agglobin.c
        annales/2022-2023/Correction_2022-2023/src/agglobin.h
        annales/2022-2023/Correction_2022-2023/src/deserialisation.c
        annales/2022-2023/Correction_2022-2023/src/deserialisation.h
        annales/2022-2023/Correction_2022-2023/src/main.c
        annales/2022-2023/Correction_2022-2023/src/statsfichier.c
        annales/2022-2023/Correction_2022-2023/src/statsfichier.h
        annales/2022-2023/revision/arbre.c
        annales/2022-2023/revision/arbre.h
        annales/2022-2023/revision/fonctionStats.c
        annales/2022-2023/revision/fonctionStats.h
        annales/2022-2023/revision/main.c
        tp0/ascii.c
        tp0/calcul.c
        tp0/chariot.c
        tp0/div.c
        tp0/draft.c
        tp0/main.c
        tp0/permute.c
        tp0/second_deg.c
        tp0/taille.c
        tp1/analyse_lexicale.c
        tp1/automate.c
        tp1/draft.C
        tp1/main.c
        tp1/pile.c
        tp1/pile.h
        tp1/sgml.c
        tp1/sgml.h
        tp2/fonctions_sort.c
        tp2/fonctions_sort.h
        tp2/horloge.c
        tp2/horloge.h
        tp2/main.c
        tp2/MyQuickSort.c
        tp2/MyQuickSort.h
        tp2/rand.c
        tp2/rand.h
        tp2/Tableau.c
        tp2/Tableau.h
        tp2/TriBulle.c
        tp2/TriBulle.h
        tp2/util.c
        tp2/util.h
        tp3/Liste.c
        tp3/Liste.h
        tp3/main.c
        "tp3 max/Liste.c"
        "tp3 max/Liste.h"
        "tp3 max/main.c")
