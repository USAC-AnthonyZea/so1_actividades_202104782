#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>

void *thread_function(void *arg) {
    printf("¡Hola desde el hilo!\n");
    return NULL;
}

void thread_create() {
    pthread_t thread_id;
    int result;

    result = pthread_create(&thread_id, NULL, thread_function, NULL);
    if (result != 0) {
        perror("Error al crear el hilo");
        exit(EXIT_FAILURE);
    }

    pthread_join(thread_id, NULL);
}

int main() {
    pid_t pid;

    pid = fork();
    
    if (pid == 0) { /* proceso hijo */
        fork();
        thread_create();
        exit(0); // Importante: Salir del proceso hijo para evitar más bifurcaciones
    }

    fork();

    return 0;
}