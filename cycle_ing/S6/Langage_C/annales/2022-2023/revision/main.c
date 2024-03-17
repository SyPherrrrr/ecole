#include <stdio.h>
#include <stdlib.h>
#include "fonctionStats.h"


void AfficherStats(struct SStat* stats)
{
    if (stats == NULL) return;

    for (unsigned int i = 0; i < 256; ++i)
    {
        printf("%d (%c):\t%d\n", i, i>32 ? i : ' ', stats->Stat[i]);
    }
}

int main() {
    struct SStat statistiques = fonctionStats("./fichier_test.txt"); // mettre le chemin par rapport au fichier
    AfficherStats(&statistiques);                                    // executable
    return 0;
}