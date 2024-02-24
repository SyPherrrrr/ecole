#include <stdio.h>
#include "sgml.h"
#include <stdlib.h>
#include <string.h>

int automate(FILE *fp);

int main () {
    FILE *fp;
    char *nomFichier="fichier2.html";
    fp = fopen(nomFichier,"rt");
    automate(fp);
    return 0;
}


int automate (FILE *fp) {
    enum Etats
    {
        SEtatDebut = 0,
        SEtattag = 1,
        SEtatTagOpen = 2,
        SEtatTagClose = 3,
        SEtatFin = 4,
        SEtatErreur = 5,
        SEtatParantheseOpen = 6,
        SEtatParantheseClose = 7,
    };
    enum Etats currentState = SEtatDebut; // Etat courant
    char currentChar; // caractère courant


	while(!feof(fp)) //lire tout le fichier
	{
		currentChar=fgetc(fp);

		if (currentChar=='<')
		{
			currentState=SEtattag;
			while (currentState!=SEtatFin && currentState!=SEtatErreur)
			{
			    // Récupérer le prochain caractère une fois qu'on est dans la balise
    			currentChar=fgetc(fp);

    			// Calcul des transitions
    			switch(currentState)
    			{
        			case SEtatDebut: // Automate dans l'état initial
            			if (currentChar=='<') currentState=SEtattag; // Exemple de transition
            			break;

        			case SEtattag:
            			if (isalpha10(currentChar)) currentState=SEtatTagOpen;
            			else if (currentChar=='/') currentState=SEtatTagClose;
            			else {
               				currentState=SEtatErreur;
            			}
            			break;

        			case SEtatTagOpen: // Etat d'une balise ouvrante
            			if (isalpha10(currentChar)||strchr("'=,/.-_ :;&éàèêù",currentChar) != NULL);
            			else if (currentChar=='\"') currentState=SEtatParantheseOpen;
            			else if (currentChar=='>') currentState=SEtatFin;
            			else {
                			currentState=SEtatErreur;
            			}
            			break;

        			case SEtatTagClose: // Etat d'une balise fermante
            			if (isalpha10(currentChar)||strchr("'=,/.-_ :;&éàèêù",currentChar) != NULL); // Si c'est un de ces caractères ont reste dans le meme etat
            			else if (currentChar=='\"') currentState=SEtatParantheseClose;
            			else if (currentChar=='>') currentState=SEtatFin;
            			else {
                			currentState=SEtatErreur;
            			}
            			break;

            		case SEtatParantheseOpen:
            			if(currentChar=='\"') currentState=SEtatTagOpen;
            			break;

					case SEtatParantheseClose:
						if(currentChar=='\"') currentState=SEtatTagClose;
    					break;

    				case SEtatErreur: // Etat d'erreur
    					exit(0);

    				case SEtatFin: // Etat de fin
						break;
				}
			}
    			// Vérification des erreurs dans l'automate
    			if (currentState==SEtatErreur) return 1;
    	}
    }
    return 0;
}

// Fonction qui vérifie si le caractère courant est bien alpha numérique ( lettres + chiffres )
// En C retourner 0 correspond à faux et 1 à vrai
int isalpha10( char currentChar) {
	if ((currentChar >= 65 && currentChar <= 90) || (currentChar >= 97 && currentChar <= 122) || (currentChar >= 48 && currentChar <= 57) ){
		return 1;
	}
	return 0;
}