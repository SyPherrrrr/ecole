#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t child_pid;

    // Fork pour créer un nouveau processus
    child_pid = fork();
    printf("Je suis le processus père (PID : %d) du processus enfant (PID : %d)\n", getpid(), child_pid);

    while (1) {
        if (child_pid == -1) {
            // Gestion de l'erreur en cas d'échec de fork
            perror("Erreur lors de fork");
            return 1;
        }

        if (child_pid == 0) {
            // Code exécuté par le processus enfant
            printf("Je suis le processus enfant (PID : %d)\n", getpid());
        } else {
            // Code exécuté par le processus père
            printf("Je suis le processus père (PID : %d) du processus enfant (PID : %d)\n", getpid(), child_pid);
        }
    }
    return 0;
}
