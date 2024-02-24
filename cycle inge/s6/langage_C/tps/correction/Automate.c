#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "pile.h"

// Définition des états possibles
typedef enum {
    EtatDebut,
    EtatBaliseOuvrante,
    EtatNomBalise,
    EtatAttributNom,
    EtatAttributValeurDebut,
    EtatAttributValeur,
    EtatBaliseFermante,
    EtatErreur
} Etat;

// Fonction pour vérifier si un caractère est alphanumérique
bool estAlphanumerique(char c) {
    return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == ' ' || c == '\n';
}

// Fonction principale de l'automate
int automate(FILE *fp) {
    Etat etat = EtatDebut;
    Pile pile;
    initPile(&pile);
    char c, nomBalise[MAX_TAG_LENGTH], attributNom[MAX_TAG_LENGTH], attributValeur[MAX_TAG_LENGTH];
    int indexNomBalise = 0, indexAttributNom = 0, indexAttributValeur = 0;
    bool erreur = false;

    while ((c = fgetc(fp)) != EOF && !erreur) {
        switch (etat) {
            case EtatDebut:
                // printf("Etat Debut \n");
                if (c == '<') {
                    etat = EtatBaliseOuvrante;
                    indexNomBalise = 0;
                }
                break;
            case EtatBaliseOuvrante:
                if (estAlphanumerique(c)) {
                    etat = EtatNomBalise;
                    nomBalise[indexNomBalise++] = c;
                    
                } else if (c == '/') {
                    etat = EtatBaliseFermante;
                    indexNomBalise = 0;
                }
                break;
            case EtatNomBalise:
                // printf("Etat Nom Bal\n");
                if (c == '>') {
                    nomBalise[indexNomBalise] = '\0';
                    printf("Empile : %s\n", nomBalise);
                    if (!push(&pile, nomBalise)) {
                        // printf("Erreur: Pile pleine.\n");
                        erreur = true;
                    }
                    etat = EtatDebut;
                } else if (c == ' ') {
                    etat = EtatAttributNom;
                    indexAttributNom = 0;
                } else if (estAlphanumerique(c)) {
                    nomBalise[indexNomBalise++] = c;
                }
                break;
            case EtatAttributNom:
                if (c == '=') {
                    attributNom[indexAttributNom] = '\0';
                    etat = EtatAttributValeurDebut;
                } else if (estAlphanumerique(c)) {
                    attributNom[indexAttributNom++] = c;
                }
                break;
            case EtatAttributValeurDebut:
                if (c == '"') {
                    etat = EtatAttributValeur;
                    indexAttributValeur = 0;
                }
                break;
            case EtatAttributValeur:
                if (c == '"') {
                    attributValeur[indexAttributValeur] = '\0';
                    etat = EtatNomBalise; // Retour à l'état de lecture du nom de balise ou d'attributs supplémentaires
                } else {
                    attributValeur[indexAttributValeur++] = c;
                }
                break;
            case EtatBaliseFermante:
                if (c == '>') {
                    nomBalise[indexNomBalise] = '\0';
                    printf("Depile : %s\n", nomBalise);
                    char baliseOuvrante[MAX_TAG_LENGTH];

                    if (!pop(&pile, baliseOuvrante) || strcmp(baliseOuvrante, nomBalise) != 0) {
                        printf("Erreur syntaxique: balise ouvrante et fermante ne correspondent pas.\n");
                        erreur = true;
                    }
                    etat = EtatDebut;
                } else if (estAlphanumerique(c)) {
                    nomBalise[indexNomBalise++] = c;
                }
                break;
            case EtatErreur:
                printf("Erreur détectée dans le fichier HTML.\n");
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
