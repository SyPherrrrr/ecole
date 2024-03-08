#include <stdio.h>
#include "MyQuickSort.h"
#include "util.h"



int partition(int *tab, int pivot, int premier, int dernier, int (*compare)(int, int)) {

    swap(&tab[pivot], &tab[dernier]);

    int j = premier;
    for (int i = premier; i < dernier; i++) {
        if (compare(tab[i], tab[dernier]) <= 0 ) {
            swap(&tab[i], &tab[j]);
            j++;
        }
    }
    swap(&tab[dernier], &tab[j]);
    return (j);
}

void MyQuickSort(int *tab, int premier, int dernier, int (*compare)(int, int)) {

    if (premier < dernier) {
        int pivot = premier;
        pivot = partition(tab, pivot, premier, dernier, compare);
        MyQuickSort(tab, premier, pivot - 1, compare);
        MyQuickSort(tab, pivot + 1, dernier, compare);
    }
}
