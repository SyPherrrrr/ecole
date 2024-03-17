#pragma once // Pour eviter  les inclusions multiples


typedef struct SEtudiant SEtudiant;

typedef struct SAnnuaire SAnnuaire;

SAnnuaire* GenererAnnuaire();

void SupprimerAnnuaire(SAnnuaire *annuaire);

void SaisirAnnuaire(SAnnuaire *annuaire);

void AfficheAnnuaire(SAnnuaire *annuaire);

void EnregistrerAnnuaire(SAnnuaire *annuaire, const char *fichier);