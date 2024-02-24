#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "pile.h"

// Définition des états possibles
typedef enum {
    EtatDebut,
    EtatBaliseOuvrante,
    EtatNomBalise,
    EtatBaliseFermante,
    EtatErreur
} Etat;

// Fonction pour vérifier si un caractère est alphanumérique
bool estAlphanumerique(char c) {
    return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

// Fonction principale de l'automate
int automate(FILE *fp) {
    Etat etat = EtatDebut;
    Pile pile;
    initPile(&pile);
    char c, nomBalise[MAX_TAG_LENGTH];
    int indexNomBalise = 0;
    bool erreur = false;

    while ((c = fgetc(fp)) != EOF && !erreur) {
        switch (etat) {
            case EtatDebut:
                printf("Etat Debut\n\n");
                if (c == '<') {
                    etat = EtatBaliseOuvrante;
                    indexNomBalise = 0;
                }
                break;
            case EtatBaliseOuvrante:
                printf("Etat Bal Ouvrante\n\n");
                if (estAlphanumerique(c)) {
                    etat = EtatNomBalise;
                    nomBalise[indexNomBalise++] = c;
                } else if (c == '/') {
                    etat = EtatBaliseFermante;
                    indexNomBalise = 0;
                }
                break;
            case EtatNomBalise:
                printf("Etat nom Bal\n\n");
                if (c == '>') {
                    nomBalise[indexNomBalise] = '\0';
                    push(&pile, nomBalise);
                    etat = EtatDebut;
                } else if (estAlphanumerique(c)) {
                    nomBalise[indexNomBalise++] = c;
                }
                break;
            case EtatBaliseFermante:
                printf("Etat fermante\n\n");
                if (c == '>') {
                    nomBalise[indexNomBalise] = '\0';
                    if (!pop(&pile, nomBalise)) {
                        printf("Balise fermante sans correspondance.\n");
                        erreur = true;
                    }
                    etat = EtatDebut;
                } else if (estAlphanumerique(c)) {
                    nomBalise[indexNomBalise++] = c;
                }
                break;
            case EtatErreur:
                // Gestion d'une erreur
                printf("Erreur détectée.\n");
                erreur = true;
                break;
        }
    }

    if (!estPileVide(&pile)) {
        printf("Il reste des balises ouvertes.\n");
        erreur = true;
    }

    return erreur ? 1 : 0;
}

