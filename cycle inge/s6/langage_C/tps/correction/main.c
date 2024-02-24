#include "Automate.h"

int main() {
    FILE *fp = fopen("fichier.html", "rt");
    if (!fp) {
        perror("Erreur lors de l'ouverture du fichier");
        return 1;
    }

    int resultat = automate(fp);
    fclose(fp);

    if (resultat == 0) {
        printf("Le fichier HTML est correctement formé.\n");
    } else {
        printf("Le fichier HTML n'est pas correctement formé.\n");
    }

    return 0;
}
