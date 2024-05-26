
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <strings.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#define taille_file 5
#define BUFFER_SIZE 256


int createServeur(int port_A, int port_B, char *ip, int first) {
	// socket
    int socket_s, socket_c;
	struct sockaddr_in serv_addr, cli_addr;

	if ((socket_c = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
		perror("socket_c failed");
		exit(EXIT_FAILURE);
	}
	if ((socket_s = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
		perror("socket_s failed");
		exit(EXIT_FAILURE);
	}

	// Définir les options pour le socket
	// Structure d'@
	bzero((char*)&serv_addr, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = INADDR_ANY; // Accepte les connections de n'importe quelle interface
	serv_addr.sin_port = htons(port_A);
	if (bind(socket_s, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
		perror("bind failed");
		close(socket_s);
		exit(EXIT_FAILURE);
	}

	// Pour mettre en ecoute le socket, avec une file d'attente d'une certaine taille
	if (listen(socket_s, taille_file) < 0 ) {
		perror("listen");
		close(socket_s);
		exit(EXIT_FAILURE);
	}
	printf("Server is listening on port %d\n", port_A);

	// Connection du client au serveur
	if (connect(socket_c, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
		perror("Connection Failed");
		return -1;
	}

	socklen_t clilen = sizeof(cli_addr);
	// nouveau socket dédié à la connexion avec un client spécifique
	// new scoket file descriptor
	int newsockfd;
	if ((newsockfd = accept(socket_s, (struct sockaddr *)&cli_addr, &clilen) < 0)) {
		perror("accept");
		close(socket_s);
		exit(EXIT_FAILURE);
	}
	printf("Connection acceptée...\n");

	// Exemple de lecture et d'envoi de message
	// buffer = endroit ou est stock le message
	char buffer[BUFFER_SIZE];
	// memset permet de remplir avec des 0 une zone mémoire d'une certaine taille
	memset(buffer, 0, BUFFER_SIZE);
	int n = read(newsockfd, buffer, BUFFER_SIZE - 1);
	if (n < 0) {
		perror("Erreur de lecture depuis le socket");
		close(newsockfd);
		close(socket_s);
		exit(EXIT_FAILURE);
	}
	printf("Message reçu: %s\n", buffer);

	// Réponse au client
	const char *response = "Message reçu";
	n = write(newsockfd, response, strlen(response));
	if (n < 0) {
		perror("Erreur d'écriture dans le socket");
		close(newsockfd);
		close(socket_s);
		exit(EXIT_FAILURE);
	}


    close(socket_s);
    close(socket_c);
    exit(EXIT_SUCCESS);
    return 0;
}
