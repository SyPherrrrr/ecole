// Fichier avec la fonction TagSGML
#include "sgml.h"
#include <ctype.h>

int TagSGML(FILE *fp, char *tag, enum ETagETat) {
    int nb = 0;
    char currentChar;
    int erreur = 0;
    Etats currentState = SEtatDebut;
    *tagEtat = ETEnoTag;
    while (){
        char currentChar = fgetc(fp);
        switch (currentState) {
            case SEtatDebut:
                if (currentChar=='<') currentState = SEtatTag;
                break;
            case SEtatTag:
                if (currentChar=='/') {
                    *tagEtat = ETEclose;
                    currentState = SEtatTagFDeb;
                } else {
                    if (isalpha(currentState)) {
                        *tagEtat = ETEopen;
                        currentState = SEtatTagOpen;
                        tag[nb] = currentChar;
                        nb++;
                    }
                }
                break;
        }
    return 0;
    }
}