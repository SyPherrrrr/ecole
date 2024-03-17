#include <stdio.h>
#include <string.h>
#include "annuaire.h"


int main() {


    SAnnuaire *annuaire = GenererAnnuaire();
    SaisirAnnuaire(annuaire);
    AfficheAnnuaire(annuaire);
    EnregistrerAnnuaire(annuaire, "fichier_sortie");



    return 0;
}