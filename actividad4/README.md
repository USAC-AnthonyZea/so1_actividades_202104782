# Actividad 4

### Named Pipes

Para la creación de los named pipes hacemos uso del comando `mkfifo`, por lo cual para este caso de un chat básico, se ejecutaron los siguientes comandos:

- ```sh
    mkfifo participantA_input
    mkfifo participantB_input
  ```

Posterior a crear los named pipes, se crearon dos scripts, con los siguientes comandos:

### Script 1: `participantA.sh`

```sh
#!/bin/bash

while true; do
    # Leer mensaje del participante B
    read -r message < participantB_input
    echo "Participante B: $message"

    # Escribir mensaje
    echo -n "Participante A: "
    read message
    echo "$message" > participantA_input
done
```

### Script 2: `participantB.sh`

```sh
#!/bin/bash

while true; do
    # Leer mensaje del participante A
    read -r message < participantA_input
    echo "Participante A: $message"

    # Escribir mensaje
    echo -n "Participante B: "
    read message
    echo "$message" > participantB_input
done
```

Les asignamos permisos a ambos scripts para poder ser ejecutados:

```sh
chmod +x participantA.sh participantB.sh
```

### Ejecución

Una vez realizados ambos scripts, abrimos dos terminales y en la Terminal 1 ejecutamos lo siguiente:

```sh
./participantA.sh
```

y en la Terminal 2

```sh
./participantB.sh
```

De esta manera hemos creado un chat basico, y podremos escribir mensajes en un terminal y recibirlas en la terminal 2 y viceversa simulando un chat basico entre dos personas.
