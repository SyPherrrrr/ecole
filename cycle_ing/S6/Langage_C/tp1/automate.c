#include <stdio.h>
#include "sgml.h"
#include <stdlib.h>

// Fonction qui vérifie si le caractère courant est bien alpha numérique ( lettres + chiffres )
// En C retourner 0 correspond à faux et 1 à vrai
int isalpha10( char currentChar) {
    if ((currentChar >= 65 && currentChar <= 90) || (currentChar >= 97 && currentChar <= 122) || (currentChar >= 48 && currentChar <= 57) ){
        return 1;
    }
    return 0;
}



int main() {

    FILE *pFile;
    pFile=fopen("./tp1/fichier.html","rt");
    char currentChar;
    enum Etats currentState = SEtatDebut;
    
    
    while(!feof(pFile)) {
       currentChar = fgetc(pFile);
        switch (currentState) {
            case SEtatDebut :
                if (currentChar == '<') {
                    currentState = SEtatTag;
                }
                break;

            case SEtatTag : // Savoir si on est dans une balise ouvrante ou fermante
                if (currentChar == '/') {
                    currentState = SEtatTagFDeb;
                } else if (isalpha10(currentChar)) {
                    currentState = SEtatTagOpen;
                } else {
                    printf("Erreur syntaxique 1.a");
                    exit(0);
                }
                break;

            case SEtatTagOpen : // Pour vérifier le nom de la balise ouvrante
                if (currentChar == '>') {
                    currentState = SEtatFin;
                } else if (isalpha10(currentChar)) {  // Continuer d'écrire le nom
                    currentState = SEtatTagOpen;
                } else if (currentChar != '-' || currentChar != '_') {
                    printf("Erreur syntaxique 1");  // Erreur dans le nom de la balise ouvrante
                    exit(0);
                }
                break;

            case SEtatTagFDeb :  // Pour vérifier le nom de la balise fermante
                if (isalpha10(currentChar)) {
                    currentState = SEtatTagF;
                } else {
                    printf("Erreur syntaxique 2");  // Erreur dans le nom de la balise fermante
                    exit(0);
                }
                break;

            case SEtatTagF :
                if (currentChar =='>') {
                    currentState = SEtatFin;
                } else if (isalpha10(currentChar) || currentChar == '-' || currentChar == '_' ) {
                    currentState = SEtatTagF;
                } else {
                    printf("Erreur syntaxique 3");
                    exit(0);
                }

            case SEtatFin :
                break;
        }
    }
}