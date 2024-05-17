/* Socket - Client - Mode Datagramme */

#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <strings.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int createSocket(int port_A, int port_B, char *ip, int first)
{
	int sock_S, sock_C;

    /* creation socket Serveur */

    // SOCKET = point de communication dans la com en réseau
    // int socket(int domain, int type, int protocol);
	// PF_INET permet de choisir la famille ipv4 pour la création du socket
	// SOCK_DGRAM ce paramètre permet de définir le type de socket (sock_dgram utilisé  par le protocole udp )
	// Le 3e paramètre est pour définir le type de protocole à utuliser. Ici 0 définit le meilleur par default
	sock_S = socket(PF_INET, SOCK_DGRAM, 0);
	// Pour afficher une erreur en cas de défaillance de socket()
	perror("socket");

	// Création socket Client
	sock_C = socket(PF_INET, SOCK_DGRAM, 0);
	perror("socket");

	// Structure d'adresse du serveur, client et pour représenter une famille d'@, une @ip et un port
	struct sockaddr_in sa_S, sa_C, sa_R;
	
	unsigned int taille_sa_S, taille_sa_C;
	
	char message[10];



	/* @IP et n� port Server */

	// bzero() C'est une fonction qui initialise (met à zéro) une zone de mémoire.
	// (char*) &sa_S : @ de la structure
	// sizeof(sa_S) : taille de la structure
	bzero((char*) &sa_S, sizeof(sa_S));
	sa_S.sin_family      = AF_INET; // famille d'@ ( ici ipv4)
	sa_S.sin_addr.s_addr = inet_addr( ip ); // @IP / inet_addr() permet de convertir une chaine en un type 'in_addr_t' qui représente une ip en format reseau
	sa_S.sin_port        = htons( port_A ); // n° port / permet de convertir un int en un format entier réseau


    /* @IP et n� port Client */
	bzero((char*) &sa_C, sizeof(sa_C));
	sa_C.sin_family      = AF_INET;
	sa_C.sin_addr.s_addr = inet_addr( ip );
	sa_C.sin_port        = htons( port_B );



	// Bind permet de lier le socket à une adresse, un port et une famille.
	// En gros cest pour faire ecouter le socket sur un port
	bind(sock_S, (struct sockaddr *) &sa_S, sizeof(struct sockaddr));
	perror("bind ");

	/* emission vers le serveur (a partir du client) */
	taille_sa_S = sizeof( struct sockaddr );
    taille_sa_C = sizeof( struct sockaddr );
	
    while (1) {
    	// Si c'est le premier tour
        if (first) {
        	// sento(): permet d'envoyer des messages sur un socket
        		//(provenance, message, taille max message, 0 = option par default, @ de destination, taille struct d'@)
            sendto(sock_C, "1", 10 * sizeof(char), 0, (struct sockaddr*) &sa_C, taille_sa_C);
            first = 0;
        }
		//(celui qui lis le message, message, taille max message, 0 = option par default, stockage dans sa_R de l'@ expéditeur, taille struct d'@)
        recvfrom(sock_S, message, 10 * sizeof(char), 0, (struct sockaddr *) &sa_R, &taille_sa_S);
        printf("%s \n",message);

		char res[10];
		int num = atoi(message) + 1;
    	// Formate l'entier num en une chaîne de caractères et stocke cette chaîne dans res
		sprintf(res, "%d", num);

        sendto(sock_C, res, 10 * sizeof(char), 0, (struct sockaddr*) &sa_C, taille_sa_C);
    }

	close(sock_S);
	close(sock_C);
	exit(EXIT_SUCCESS);	
}

