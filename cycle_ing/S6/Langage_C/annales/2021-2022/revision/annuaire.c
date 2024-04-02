#include "annuaire.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


// Question 1 : Créer une structure mémoire permettant de stocker les informations associées à un étudiant : une
//chaîne de caractères pour le nom, une chaîne de caractères pour le prénom, un entier pour l'âge, un
//entier pour l'année d'inscription. Cette structure ne devrait pas être connue du développeur utilisateur
//de votre annuaire.

struct SEtudiant {
    char nom[30];
    char prenom[30];
    unsigned int age;
    unsigned int annee_inscription;
};

// Question 2 : Créer une structure mémoire permettant de stocker les informations associées à un annuaire. Ce dernier
//doit contenir les données des étudiants ainsi que les index (à venir dans une prochaine question), et
//sera le point d'entrée de toutes les fonctions manipulant votre annuaire.
struct SAnnuaire{
    SEtudiant *Etudiants; // Tableau d'étudiants <=> pointeur vers le premier étudiant saisi
    unsigned int nombre_etudiants;
};

// Question 3 : Créer une fonction GenererAnnuaire permettant de créer un nouvel annuaire vide. Cette fonction ne
//prends pas de paramètre et doit retourner l'annuaire crée.
SAnnuaire* GenererAnnuaire() {
    // Allocation de la mémoire à l'annuaire
    SAnnuaire *annuaire=(SAnnuaire*)malloc(sizeof(SAnnuaire)); // pointeur vers l'espace mémoire

    annuaire->nombre_etudiants=0; // 0 étudiants à l'initialisation
    annuaire->Etudiants=NULL; // pointeur null à l'initialisation
    return (annuaire);
}


// Question 4 : Créer une fonction SupprimerAnnuaire permettant de supprimer correctement toutes les données en
//mémoire stockées dans l'annuaire passé en paramètre.
void SupprimerAnnuaire(SAnnuaire *annuaire) {
    annuaire->nombre_etudiants=0;
    annuaire->Etudiants=NULL;
    free(annuaire->Etudiants);
    printf("Annuaire supprimé\n");
}

// Question 5 : Créer une fonction SaisirAnnuaire permettant d'ajouter plusieurs entrées dans votre annuaire. Cette
//fonction prends donc en paramètre l'annuaire à compléter et demande à l'utilisateur de saisir au clavier
//les données à ajouter.
//Pour chaque entrée, vous devrez demander à l'utilisateur de remplir tous les champs nom, prénom, âge
//et année d'inscription. L'utilisateur doit pouvoir saisir plusieurs utilisateurs. Si des données sont déjà
//présentes dans l'annuaire, celles-ci doivent rester non modiées. La recherche de doublon n'est pas à
//considérer ici.
//Pour cet exercice, la saisie ne doit pas être robuste, et vous pouvez vous contenter de l'utilisation de
//scanf.

void SaisirAnnuaire(SAnnuaire *annuaire) {


    char end = 0;

    SEtudiant etudiant;
    // Tant que l'on veut ajouter des étudiants
    while(end == 0) {
        printf("Saisissez le nom d'un étudiant ou '$' pour terminer : \n");
        scanf("%s", etudiant.nom);

        // Si le nom est $ on arrête de saisir des étudiants
        if( strcmp(etudiant.nom,"$") == 0) end=1;  // Comparateur de chaine de charactère
        else {
            printf("Saisir le prénom : ");
            scanf("%s", etudiant.prenom); // pas besoins de & car tableau de charactères = pointeur vers premiere case

            printf("Saisir l'age : ");
            scanf("%u", &etudiant.age); // on doit mettre & car on veut un pointeur

            printf("Saisir l'annee d'inscription  : ");
            scanf("%u", &etudiant.annee_inscription);

            annuaire->nombre_etudiants++;


            // Gestion de la mémoire

            // On réalloue de la mémoire au tableau annuaire-Etudiants. Une nouvelle mémoire de
            // taille : annuaire->NbEtudiants*sizeof(SEtudiant)
            // et la fonction realloc renvoi un pointeur vers la premiere case de cette zone mémoire, que l'on
            // stock dans annuaire->Etudiants
            // (SEtudiant*) : type vers lequel est envoyé le pointeur
            annuaire->Etudiants = (SEtudiant*)realloc(annuaire->Etudiants, annuaire->nombre_etudiants*sizeof(SEtudiant));

            // On ajoute le nouvel étudiant à la fin du tableau
            annuaire->Etudiants[annuaire->nombre_etudiants-1] = etudiant;

            printf("étudiant enregistré. \n");
        }
    }
}

// utilisation lettre et type
// %d : Pour lire un entier (int).
// %f : Pour lire un nombre à virgule flottante (float).
// %lf : Pour lire un nombre à virgule flottante double précision (double).
// %c : Pour lire un caractère (char).
// %s : Pour lire une chaîne de caractères (char[] ou char*).
// %u : Pour lire un entier non signé (unsigned int).
// %lu : Pour lire un long entier non signé (unsigned long).
// %lld : Pour lire un long long entier (long long).
// %lf : Pour lire un double (double).
// %Lf : Pour lire un long double (long double).

// Question 6 : Créer une fonction AfficheAnnuaire permettant d'afficher sur la console les étudiants stockés dans un
//annuaire passé en paramètre.

void AfficheAnnuaire(SAnnuaire *annuaire) {

    for (unsigned int i = 0; i < annuaire->nombre_etudiants; i++) {
        printf("Nom : %s\t Prénom : %s\t Age : %d\t Année d'inscription : %d\n",annuaire->Etudiants[i].nom, annuaire->Etudiants[i].prenom,
               annuaire->Etudiants[i].age, annuaire->Etudiants[i].annee_inscription );
    }
}


// Question 7 : Créer une fonction EnregistrerAnnuaire permettant de sauvegarder les étudiants stockés dans un
//annuaire passé en paramètre. Le nom du chier sera également passé en paramètre. Le format du
//fichier est à votre discrétion.

void EnregistrerAnnuaire(SAnnuaire *annuaire, const char *fichier) { // const = objet qui ne peut pas être modifié

    FILE *fp = fopen(fichier, "w"); // pointeur vers un fichier. Ouverture en mode écriture ("w")

    // Vérification que le fichier s'est bien ouvert
    if (fp == NULL) {
        printf("Erreur d'ouverture fichier\n");
        return;
    } else {
        // fprintf permet d'écrire sur un fichier en mode écriture. Forme : fprintf(FILE *fichier, const char *format, ...);
        fprintf(fp, "Nombre d'étudiants : %u\n", annuaire->nombre_etudiants);
        for (unsigned int i = 0; i < annuaire->nombre_etudiants; i++) {
            fprintf(fp, "Nom : %s\t Prénom : %s\t Age : %u\t Anne d'inscription : %u\n",annuaire->Etudiants[i].nom,
                    annuaire->Etudiants[i].prenom, annuaire->Etudiants[i].age, annuaire->Etudiants[i].annee_inscription);
        }
        fclose(fp);
    }
}

// Question 8 : Créer une fonction LireAnnuaire prenant en paramètre un nom de fichier. Cette fonction crée un
//nouvel annuaire et l'initialise avec les données contenues dans le fichier (créé précédemment par la
//fonctionEnregistrerAnnuaire).


void LireAnnuaire(const char *fichier){
    for (int i=0)
}