#include "pile.h"
#include <string.h>

void initPile(Pile *pile) {
    pile->top = -1;
}

bool push(Pile *pile, const char *tag) {
    if (pile->top >= MAX_STACK_SIZE - 1) return false;
    strcpy(pile->tags[++pile->top], tag);
    return true;
}

bool pop(Pile *pile, char *tag) {
    if (pile->top == -1) return false;
    strcpy(tag, pile->tags[pile->top--]);
    return true;
}

bool estPileVide(const Pile *pile) {
    return pile->top == -1;
}
