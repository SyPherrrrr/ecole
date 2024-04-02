#include "fonctionStats.h"
#include <stdio.h>

// On retourne un type struct  SStat
struct SStat fonctionStats(const char *path) {
    FILE *fp;

    // Initialiser la structure à 0 pour chaque charactère
    struct SStat stats;
    for (unsigned int i = 0 ; i < 256 ; ++i) {  // 256 car on peut coder les charactères sur 1 octet (256 possibilités)
        stats.Stat[i] = 0;                      // car en ascii on va jusqu'à 256
    }
    printf("oui");
    // Verification que le fichier s'ouvre correctement
    if ((fp = fopen(path, "r")) != NULL) {
        printf("jsuis passé");
        int c;
        // Parcours du fichier tant que cest pas le dernier
        while((c = fgetc(fp)) && !feof(fp)) {  // fgetc renvoi le code ascii du charactère
            stats.Stat[c]++;  // compteur pour chaque charactère
        }
        fclose(fp);
    }
    return (stats);
}