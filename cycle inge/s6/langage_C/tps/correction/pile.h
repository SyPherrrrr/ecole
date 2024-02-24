#ifndef PILE_H
#define PILE_H

#include <stdbool.h>

#define MAX_STACK_SIZE 100
#define MAX_TAG_LENGTH 50

typedef struct {
    char tags[MAX_STACK_SIZE][MAX_TAG_LENGTH];
    int top;
} Pile;

void initPile(Pile *pile);
bool push(Pile *pile, const char *tag);
bool pop(Pile *pile, char *tag);
bool estPileVide(const Pile *pile);

#endif
