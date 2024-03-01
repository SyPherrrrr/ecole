
// de
void horloge(int (*tab_fonctions[])(int *tab,int premier, int dernier, int (*compare)(int, int)),
                 unsigned int nb_fonctions, int (*compare)(int, int), int size);



// Tableau de fonctions

int (*tab_fonctions[])(int *tab,int premier, int dernier, int (*compare)(int, int));
// Int : ce que retourne chaque fonction
// *tab_fonctions[3] : tableau de 3 pointeurs de fonctions
// (*tab, size) : les paramètres que les fonctions vont prendre

