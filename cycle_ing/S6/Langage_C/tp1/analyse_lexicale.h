#ifndef ANALYSE_LEXICALE_H
#define ANALYSE_LEXICALE_H

#define MAX_SIZE 1024


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef enum etat_automate {
    S0 = 0, 
    S1 = 1, 
    S2 = 2, 
    S3 = 3, 
    S4 = 4, 
    S5 = 5, 
    S6 = 6, 
    S7 = 7, 
    S8 = 8, 
    S9 = 9, 
    S10 = 10, 
    S11 = 11, 
    S12 = 12, 
    S13 = 13, 
    S14 = 14
} Etat; 



void Automate();
int availableForTagName(char currentChar);
int availableForTagName2(char currentChar);

#endif 
