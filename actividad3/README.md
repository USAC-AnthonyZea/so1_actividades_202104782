# Actividad 3

### SCRIPT

Se realiza un script, en este caso nombrado como `"saludo.sh"`.

```sh
#!/bin/bash

while true; do
    echo "Hola, ¡bienvenido! La fecha y hora actual son: $(date)"
    sleep 1
done

```

- Una vez creado el archivo "saludo.sh", guardamos el script en alguna ubicacion de nuestra sistema. Por ejemplo:
  `/usr/local/bin/saludo.sh`

### SYSTEMD

Se realiza un archivo de unidad systemd, nombrado como `"saludo.service"`

```ini
[Unit]
Description=Servicio de saludo infinito
After=network.target

[Service]
ExecStart=/usr/local/bin/saludo.sh
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
```

- Guardamos el archivo en el directorio `/etc/systemd/system/`

### Explicación y Ejecución del proceso

- `Description`: proporciona una descripción del servicio.
- `After`: especifica que este servicio debe iniciarse después de que la red esté disponible.
- `ExecStart`: especifica el comando que systemd debe ejecutar para iniciar el servicio, que es nuestro script saludo.sh.
- `Restart y RestartSec`: configuran systemd para reiniciar automáticamente el servicio si falla, con un intervalo de 1 segundo entre intentos de reinicio.
- `WantedBy`: especifica el objetivo que deseamos que systemd habilite para iniciar este servicio, en este caso, multi-user.target.

Una vez hayamos guardado el archivo procedemos a ejecutar el archivo:

```sh
sudo systemctl enable saludo.service
```

Teniendo en cuenta que podemos Iniciar, detener o reiniciar el servicio con:

```sh
systemctl start
systemctl stop
systemctl restart
```

### CHEQUEAR LOGS

Para verificar los registros (logs) de un servicio systemd se utiliza el comando `journalctl`. De lo cual:

1. Para ver todos los logs relacionados con el servicio:

   ```sh
   sudo journalctl -u saludo.service
   ```

2. Para ver los logs desde el último reinicio del sistema:

   ```sh
   sudo journalctl -u saludo.service --since today
   ```

3. Para ver los logs en tiempo real:

   ```sh
   sudo journalctl -u saludo.service -f
   ```
