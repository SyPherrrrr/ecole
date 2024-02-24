#include "analyse_lexicale.h"

void Automate();
int availableForTagName(char currentChar);
int availableForTagName2(char currentChar);

void Automate()
{
    FILE *pfile;
    char currentChar;
    Etat currentState = S0;

    while(!feof(pfile)){
        currentChar = fgetc(pfile);
        switch(currentState) {
            case S0:
                if (currentChar == '<') {
                    currentState = S1; 
                } else {
                    //tout sauf '<'
                    currentState = S0;
                }
                break;

            case S1:
                if (currentChar == '/') { 
                    currentState = S2;
                } else if (availableForTagName(currentChar)) { 
                    currentState = S4;
                } else { 
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break; 

            case S2:
                if (availableForTagName(currentChar)) {
                    currentState = S3;
                } else {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break;

            case S3:
                if (availableForTagName2(currentChar)) {
                    currentState = S3;
                } else if (currentChar == '>') {
                    currentState = S5;
                } else {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break; 

            case S4:
                if ( currentChar == ' ') {
                    currentState = S6;
                } else if (currentChar == '>') {
                    currentState = S5;
                } else if (availableForTagName2(currentChar)) {
                    currentState = S4;
                } else {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break;

            case S5:
                //Etat final
                break;

            case S6:
                if (currentChar == ' ') {
                    currentState = S6;
                } else if (currentChar == '>') {
                    currentState = S5;
                } else if (availableForTagName(currentChar)) {
                    currentState = S7;
                } else {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break;

            case S7:
                if (currentChar == '=') {
                    currentState = S9;
                } else if (availableForTagName2(currentChar)) {
                    currentState = S7;
                } else  {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break; 

            case S8:
                if (currentChar == ' ') {
                    currentState = S6;
                } else if (currentChar == '>') {
                    currentState = S5;
                } else if (availableForTagName2(currentChar)) {
                    currentState = S8;
                } else {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break; 

            case S9:
                if (currentChar == '\"') {
                    currentState = S10;
                } else if (currentChar == '\'') {
                    currentState = S11;
                } else if (availableForTagName2(currentChar)) {
                    currentState = S8;
                } else {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break; 
                

            case S10:
                if (currentChar == '\"') {
                    currentState = S12;
                } else {
                    //tout sauf "
                    currentState = S10;
                }
                break; 

            case S11:
                if (currentChar == '\'') {
                    currentState = S12;
                } else {
                    //tout sauf '
                    currentState = S11;
                }
                break; 

            case S12:
                if (currentChar == ' ') {
                    currentState = S6;
                } else if (currentChar == '>') {
                    currentState = S5;
                } else {
                    printf("Erreur Lexicale") ;
                    exit(0) ;
                }
                break;
        }
    }
}


/*nom de la Balise   az AZ */
int availableForTagName (char currentChar) {
    if ( (currentChar >= 65 && currentChar <= 90) || (currentChar >= 97 && currentChar <= 122) ) {
        return 1;
    }
    return 0;
}

/*nom de la Balise   az AZ 09 _ */ 
int availableForTagName2(char currentChar){
    // à revoir
}