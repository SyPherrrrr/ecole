
int partition(int *tab, int pivot, int debut, int fin, int (*compare)(int, int));
void MyQuickSort(int *tab, int premier, int dernier, int (*compare)(int, int));
typedef int (*Compare)(int, int); // type de fonction qui choisi le type de tri à faire

