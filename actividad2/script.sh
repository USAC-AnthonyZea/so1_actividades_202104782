#!/bin/bash
# Se define el intérprete (shebang)

# Si existe un error detener el script
set -o errexit
# Variables que no hayan sido definidas
set -o nounset
# Si alguna parte de un pipe ( | ) falla, todos los pipes deben fallar
set -o pipefail

# -----------------------------< COMANDOS > -------------------------------------
# Leemos la variable GITHUB_USER como variable de entorno
export GITHUB_USER=USAC-AnthonyZea

# Definimos variables y rutas donde se guardara la salida siguiente
fecha=$(date)
ruta="/tmp/$fecha"
# Crea el directorio con la fecha actual
mkdir -p "$ruta"

# Hacemos una peticion a 'https://api.github.com/users/<GITHUB_USER>' para imprimir el siguiente mensaje
# “Hola <github_user>. User ID: <id>. Cuenta fue creada el: <created_at>.”

echo "Hola $GITHUB_USER. User ID:\
    $(curl -s https://api.github.com/users/$GITHUB_USER | jq -r '.id').\
    Cuenta fue creada el: $(curl -s https://api.github.com/users/$GITHUB_USER | jq -r '.created_at')."\
    > "$ruta/saludos.log"
    

# --------------------------------< DESCRIPCION COMANDOS Y PARAMETROS ANTERIORES >----------------------------------
#   - jq: Filtra y mapea los datos de la respuesta JSON, utilizando las banderas -s y -r, para obtener unicamente el dato
#         (sudo apt-get install jq)
#   - curl: Hace la peticion hacia la api
#   - echo: Ejecuta y muestra en pantalla el resultado

# -----------------------------------< DEFINIR PERMISOS >-----------------------------------------------------------
# Para que el script pueda ser ejecutado debemos asignarle permisos al archivo 'script.sh'
#       chmod 777 script.sh ó chmod 750 script.sh

# ------------------------------------< CRONJOB >-------------------------------------------------------------------
# Para definir un cronjob para que el script se ejecute cada 5 minutos, debemos ejecutar lo siguiente:
#       crontab -e
#       Agregamos en el archivo crontab:   */5 * * * * /tmp/<date>/script.sh

# - Guardamos el archivo crontab despues de agregar la linea anterior

