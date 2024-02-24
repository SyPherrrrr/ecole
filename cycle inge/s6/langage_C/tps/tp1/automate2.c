#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "pile.h"

int main () {
    FILE *fp;
    char *nomFichier="fichier.html";
    fp=fopen(nomFichier,"rt");

    automate (fp);
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
    enum Etats curEtat; // Etat courant de l'automate
    char c; // caractère courant analysé
	int compteur=0;

	while(!feof(fp)) //tant que le fichier n'est pas entierement lu on continue
	{
		c=fgetc(fp);
		compteur++;
		printf("%c\n c'est le %d eme caractere",c,compteur);


		if (c=='<')
		{
			curEtat=SEtattag;
			while (curEtat!=SEtatFin && curEtat!=SEtatErreur)
			{
			    // Récupérer le caractère une fois qu'on est dans la balise
    			c=fgetc(fp);
    			compteur++;
				printf("%c\n c'est le %d",c,compteur);

    			// Calcul des transitions
    			switch(curEtat)
    			{
        			case SEtatDebut: // Automate dans l'état initial
            			if (c=='<') curEtat=SEtattag; // Exemple de transition
            			break;

        			case SEtattag:
            			if (isalpha(c)) curEtat=SEtatTagOpen;
            			else if (c=='/') curEtat=SEtatTagClose;
            			else {
               				curEtat=SEtatErreur;
            				printf("le cara lu est %c ",c);
                			printf("errrrrrrrrrreeeeeeur c pas un fichier HTML askip1");
            			}
            			break;

        			case SEtatTagOpen: // Automate dans l'état 1
            			if (isalpha(c)||isalnum(c)||strchr("'=,/.-_ :;&éàèêù",c) != NULL);
            			else if (c=='\"') curEtat=SEtatParantheseOpen;
            			else if (c=='>') curEtat=SEtatFin;
            			else {
                			curEtat=SEtatErreur;
							printf("le cara lu est %c ",c);
                			printf("errrrrrrrrrreeeeeeur c pas un fichier HTML askip2");
            			}
            			break;

        			case SEtatTagClose: //Automate dans l'etat 2
            			if (isalpha(c)||isalnum(c)||strchr("'=,/.-_ :;&éàèêù",c) != NULL); // Si c'est un de ces caractères ont reste dans le meme etat
            			else if (c=='\"') curEtat=SEtatParantheseClose;
            			else if (c=='>') curEtat=SEtatFin;
            			else {
                			curEtat=SEtatErreur;
            				printf("le cara lu est %c ",c);
                			printf("errrrrrrrrrreeeeeeur c pas un fichier HTML askip3");
            			}
            			break;

            		case SEtatParantheseOpen:
            			if(c=='\"') curEtat=SEtatTagOpen;
            			break;

					case SEtatParantheseClose:
						if(c=='\"') curEtat=SEtatTagClose;
    					break;

				}
			}
    			// Vérification des erreurs dans l'automate
    			if (curEtat==SEtatErreur) return 1;
    	}
    }
	printf("\n gg a toi\n");
    return 0;
}
