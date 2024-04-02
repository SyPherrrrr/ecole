#include "arbre.h"


struct SNoeudFils {
    struct SNoeud *FilsG;
    struct SNoeud *FilsD;
};

// Type de noeud de chaque noeud
enum ETypeNoeud {
    ETNfeuille,
    ETNinter
};

// Structure de noeud
struct SNoeud {
    int Valeur;
    enum ETypeNoeud Type;
    union
    {
        unsigned char Lettre;
        struct SFilsNoeud Fils;
    };
};


// Question 2 : Créer une fonction CreerFeuille permettant de créer une nouvelle instance de la structure SNoeud
//associant un caractère à une valeur entière. La création du n÷ud doit être faite sur le tas.
struct SNoeud CreerFeuille(unsigned char lettre, int valeur) {
    struct SNoeud *noeud = (struct SNoeud*)malloc(sizeof(struct SNoeud));

    if (noeud != NULL) {
        noeud.Valeur = valeur
        noeud.Type = ETNfeuille;
        noeud.Lettre = lettre;
    }
    return(noeud);
}


// Question 3 : Créer une fonction AssocierNoeud permettant de créer un noeud intermédiaire de l'arbre comme indiqué
//dans le préambule. La fonction prends en paramètre deux n÷uds (feuille ou intermédiaire) et en génère
//un nouveau initialisé avec les bonnes valeurs : la valeur entière correspondant à la somme des valeurs
//des deux noeuds, le ils gauche et le ils droit.
//De la manière similaire à la question précédente, le nouveau n÷ud devra être créé sur le tas.

struct SNoeud AssocierNoeud(struct SNoeud *filsg, struct SNoeud *filsd) {

    // Allocation de mémoire pour les structures créées
    struct SNoeud *noeud = (struct SNoeud*)malloc(sizeof(struct SNoeud));

    if (noeud != NULL && fils != NULL) {
        noeud->Fils->FilsG = filsg;
        noeud->Fils->FilsD = filsd;

        noeud->Type = ETNinter;
        noeud->Valeur = noeud.Fils.FilsG.Valeur + noeud.Fils.FilsD.Valeur;
    }
    return(noeud);
}


