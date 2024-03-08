#include <stdio.h>
#include "Tableau.h"
#include "rand.h"


void InitTabRandom(int *tab, unsigned int size, int min, int max) {
    for (int i=0; i<size;i++) {
        tab[i] = RandInt(min,max);
    }
}

int CheckSortTabCroissant(int *tab, unsigned int size) {
    for (int i=0; i < (size - 1);i++) {
        if (tab[i] > tab[i+1]) return 0;
    }
    return 1;
}

int CheckSortTabDecroissant(int *tab, unsigned int size) {
    for (int i=0; i < (size - 1);i++) {
        if (tab[i] < tab[i+1]) return 0;
    }
    return 1;
}


void printCheckSortTab(int *tab, unsigned int size) {
    if (CheckSortTabCroissant(tab,size)) {
        printf("Le tableau est trié par ordre croissant.\n");
    } else {
        if (CheckSortTabDecroissant(tab,size)){
            printf("Le tableau est trié par ordre décroissant.\n");
        } else {
            printf("Le tableau n'est pas trié.\n");
        }
    }
}

void printTab(int *tab, unsigned int size) {
    for (int i=0; i < (size);i++) {
        printf("Position : %d   valeur : %d\n",i,tab[i]);
    }
}


void printTabTimer(double *tab_time, unsigned int size) {
    for (int i=0; i < (size);i++) {
        printf("Le tri n°%d met  %f secondes. \n",i +1,tab_time[i]);
    }
}