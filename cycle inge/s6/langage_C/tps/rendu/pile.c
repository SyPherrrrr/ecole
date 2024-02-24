// Fichier qui contient les fonctions de la pile
#include <stdlib.h>
#include <stdio.h>
#include "pile.h"
#include <string.h>

void PileInit(struct SPile *pile){
    pile -> pos = 0;  // Pos est la prochaine position sur laquelle je peux mettre quelque chose
}

void PilePush(struct SPile *pile, char *elem){
    if (pile->pos < TAILLE_PILE) { // Pour ne pas dépasser la taille de la pile
        strcpy(pile->Tab[pile->pos],elem); // Allocation de la case mémoire à l'endroit pos pour mettre elem
        pile->pos += 1; // I
    }
}

char* PileTop(struct SPile *pile) {
    if (pile->pos>0) {  // Si la pile n'est pas vide
        return (pile->Tab[pile->pos - 1]); // retourner la dernière valeur ajoutée
    } else {
        printf("La pile est vide");
    }
}

char* PilePop(struct SPile *pile) {
    if (pile->pos > 0) { // Si la pile n'est pas vide
        pile->pos -= 1;  // On décrémente la position du prochain lieu de stockage
        return (pile->Tab[pile->pos]);
    } else {
        printf("La pile est vide");
        return (NULL);
    }
}

int PileTaille(struct SPile *pile) {
    return (pile->pos);
}


// Test des fonctions
int main() {
    struct SPile maPile;

    PileInit(&maPile);
    printf("Ma pile est initialisée à %d\n", maPile.pos);

    PilePush(&maPile, "element1");
    printf("Mon premier élément est : %s\n", maPile.Tab[maPile.pos - 1]);
    PilePush(&maPile, "element2");
    printf("Mon deuxième élément est : %s\n", maPile.Tab[maPile.pos - 1]);

    printf("Le dernier élément de la pile est : %s\n",PileTop(&maPile));

    printf("Je retire %s de la pile et maintenant le dernier élément est %s\n", PilePop(&maPile), PileTop(&maPile));

    printf("La taille de ma pile est de %d\n", PileTaille(&maPile));

    return 0;
}

