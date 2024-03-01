#include "Liste.h"
#include <stdlib.h>
#include <stdio.h>


struct SCell {
    SCell *nextCell;
    SCell *previousCell;
    Data value;
};

struct SList {
    SCell *head;
    SCell *tail;
    int size;
};

SList* CreateList() {
    SList *newList = malloc(sizeof(SList));

    if(newList != NULL) {
        newList->head = NULL;
        newList->tail = NULL;
        newList->size = 0;
        printf("Liste créée\n");
    }
    return newList;
}


void DeleteList(SList *list) {
    free(list);
    printf("liste supprimée\n");
}


SCell* AddElementBegin(SList *list,Data elem){
    SCell *newCell = malloc(sizeof(SCell));
    newCell->value = elem;

    // Si la liste est vide on l'initialise avec la nouvelle cellule
    if (list->head == NULL){
        list->head = newCell;
        list->tail = newCell;
        newCell->nextCell = NULL;
        newCell->previousCell = NULL;
    // Sinon on la rajoute au début de la liste
    } else {
        list->head->previousCell = newCell;
        newCell->nextCell = list->head;
        newCell->previousCell = NULL;
        list->head = newCell;
    }
    return (newCell);
}

SCell* AddElementEnd(SList *list,Data elem){
    SCell *newCell = malloc(sizeof(SCell));
    newCell->value = elem;

    // Si la liste est vide on l'initialise avec la nouvelle cellule
    if (list->tail == NULL) {
        list->head = newCell;
        list->tail = newCell;
        newCell->nextCell = NULL;
        newCell->previousCell = NULL;
    } else {
        list->tail->nextCell = newCell;
        newCell->previousCell = list->tail;
        newCell->nextCell = NULL;
        list->tail = newCell;
    }
    return (newCell);
}

SCell* AddElementAfter(SList *list,SCell *cell,Data elem) {
    SCell *newCell = malloc(sizeof(SCell));
    newCell->value = elem;

    newCell->previousCell = cell;


    // S'il y a une cellule après cell on relis
    if (cell->nextCell != NULL) {
        newCell->nextCell = cell->nextCell;
        cell->nextCell->previousCell = newCell;
        cell->nextCell = newCell;
    } else { // Sinon il y a rien
        newCell->nextCell = NULL;
        cell->nextCell = newCell;
    }
    return (newCell);
}

void DeleteCell(SList *list,SCell *cell){

    // Si il n' a qu'une cellule : on supprime les head et tail
    if (cell == list->head && cell == list->tail) {
        list->tail = NULL;
        list->head = NULL;
    } else {
        // Si la cellule est la tete et a plusieurs cellules
        if (cell == list->head) {
            cell->nextCell->previousCell = NULL;
            list->head = cell->nextCell;
        } else {
            // Si la cellule est la queue et a plusieurs cellules
            if (cell == list->tail) {
                cell->previousCell->nextCell = NULL;
                list->tail = cell->previousCell;
            } else {
                // Si la cellule es ni la queue ni la tete
                cell->nextCell->previousCell = cell->previousCell;
                cell->previousCell->nextCell = cell->nextCell;
            }
        }
    }

    free(cell);
}


SCell* GetFirstElement(SList *list) {
    return (list->head);
}

SCell* GetLastElement(SList *list){
    return (list->tail);
}

SCell* GetPrevElement(SCell *cell) {
    return (cell->previousCell);
}


SCell* GetNextElement(SCell *cell) {
    return (cell->nextCell);
}

Data GetData(SCell *cell) {
    return (cell->value);
}