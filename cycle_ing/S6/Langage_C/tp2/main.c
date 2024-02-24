#include <stdio.h>
#include <stdlib.h>
#include "rand.h"
#include "Tableau.h"
#include "MyQuickSort.h"
#include "fonctions_sort.h"



int main() {



    printCheckSortTab(tab, size);

    MyQuickSort(tab, 0, size - 1, decroissant );

    printTab(tab, size);

    printCheckSortTab(tab, size);


    return 0;
}
