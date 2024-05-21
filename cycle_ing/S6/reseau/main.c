#include "client.c"
#include <stdio.h>

int main(int argc, char * argv[])
{

    printf("%s \n", "Start");

    char *ip = "127.120.0.1";

    // atoi permet de convertir une chaine en un int
    printf("%i %i %s %i \n", atoi(argv[1]), atoi(argv[2]), ip, atoi(argv[3]));

    createSocket(atoi(argv[1]), atoi(argv[2]), ip, atoi(argv[3]));

    return 0;
}

// Pour compiler et executer
//gcc -Wall -o executable main.c
// Ouvrir un autre terminal et mettre : ./executable 8001 8000 0
// Dans le premier terminal mettre : ./executable 80 00 8001 1
