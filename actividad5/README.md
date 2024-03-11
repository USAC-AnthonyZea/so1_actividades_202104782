# Preguntas

### - a) ¿Cuántos procesos únicos son creados?

En total, se crean 4 procesos únicos. El primer ```fork()``` crea un proceso hijo. Dentro del proceso hijo, se llama a ```fork()``` nuevamente, creando otro proceso hijo. Finalmente, después del bloque ```if```, hay otro ```fork()``` que crea un proceso hijo adicional.

### - b) ¿Cuántos hilos únicos son creados?

Se crea **1 hilo único** dentro del primer proceso hijo creado.