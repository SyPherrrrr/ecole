#include "Liste.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>

#define size 4

struct SCell {
    Data Value;
    SCell *NextCell;
    SCell *PreviousCell;
};

struct SList {
    SCell *Head;
    SCell *End;
    STab *HeadBlocs;
    SCell *HeadRecycled;
    int nbItems;
};

struct STab {
    SCell *tab;
    STab *NextTab;
};²²

SList* CreateList() {
    SList *list = malloc(sizeof(SList));
    list->HeadBlocs = malloc(sizeof(STab));

    list->nbItems = 0;

    list->HeadBlocs->tab = malloc(size * sizeof(SCell));

    list->HeadRecycled = NULL;
    list->Head = NULL;
    list->End = NULL;

    return list;
};


void DeleteList(SList *list) {
    free(list);
};


SCell* AddElementBegin(SList *list, Data elem) {
    SCell *item = CreateCell(list, elem);

    if (list->Head != NULL) {
        item->NextCell = list->Head;
        list->Head->PreviousCell = item;
    } else list->End = item;
    
    list->Head = item;

    return item;
};


SCell* AddElementEnd(SList *list, Data elem) {
    SCell *item = CreateCell(list, elem);

    if (list->End != NULL) {
        item->PreviousCell = list->End;
        list->End->NextCell = item;
    } else list->Head = item;
   
    list->End = item;

    return item;
};


SCell* AddElementAfter(SList *list,SCell *cell,Data elem) {
    SCell *item = CreateCell(list, elem);

    item->PreviousCell = cell;
    item->NextCell = cell->NextCell;

    cell->NextCell->PreviousCell = item;
    cell->NextCell = item;
    

    return item;
};

SCell* CreateCell(SList *list, Data elem) {
    SCell *item;
    
    // On priviligie les cases supprimées
    if (list->HeadRecycled == NULL) {
        // On récupère juste l'adresse d'une case vide du tableau
        if (list->nbItems < size) item = &list->HeadBlocs->tab[list->nbItems];
        else {
            // Création d'un nouveau tableau pour contenir le nouveau element et les suivants (Dépassement de la taille initiale)
            STab *newtab = malloc(sizeof(STab));
            newtab->tab = malloc(size * sizeof(SCell));
            list->nbItems = 0;


            newtab->NextTab = list->HeadBlocs;
            list->HeadBlocs = newtab;        

            item = &newtab->tab[list->nbItems];
            
        }
    }
    else {
        // On récupère la dernière case supprimé 
        item = list->HeadRecycled;
        if (item->NextCell != NULL) list->HeadRecycled = item->NextCell;
        else list->HeadRecycled = NULL;
    };

    item->Value = elem;

    list->nbItems++;

    return item;
}


void DeleteCell(SList *list,SCell *cell) {

    cell->NextCell->PreviousCell = cell->PreviousCell;
    cell->PreviousCell->NextCell = cell->NextCell;

    if (list->HeadRecycled != NULL) {
        list->HeadRecycled->PreviousCell = cell;
        cell->NextCell = list->HeadRecycled;
    }
    else {
        cell->NextCell = NULL;
        cell->PreviousCell = NULL;
    }

    list->HeadRecycled = cell;
};


SCell* GetFirstElement(SList *list) {
    return list->Head;
};

SCell* GetLastElement(SList *list) {
    return list->End;
};

SCell* GetPrevElement(SCell *cell) {
    return cell->PreviousCell;
};

SCell* GetNextElement(SCell *cell) {
    return cell->NextCell;
};

Data GetData(SCell *cell) {
    return cell->Value;
};