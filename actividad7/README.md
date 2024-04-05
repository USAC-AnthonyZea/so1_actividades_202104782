# Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es un algoritmo de planificación de CPU utilizado en el kernel de Linux a partir de la versión 2.6.23. Este algoritmo se diseñó para proporcionar una planificación justa y equitativa de la CPU para todos los procesos en el sistema, priorizando la equidad en la asignación del tiempo de CPU.

## Características Principales:

- **Justicia:** El CFS se esfuerza por ofrecer una planificación justa a todos los procesos en el sistema, independientemente de su prioridad o carga de trabajo. Todos los procesos reciben una parte igual del tiempo de CPU, lo que garantiza que ningún proceso monopolice los recursos de la CPU.

- **Tiempo de CPU virtual:** En lugar de utilizar un sistema de prioridades fijas, el CFS asigna un tiempo de CPU virtual a cada proceso. Este tiempo de CPU virtual se utiliza para determinar cuánto tiempo de CPU ha utilizado un proceso en relación con otros procesos en el sistema.

- **Planificación basada en prioridades dinámicas:** Aunque el CFS no utiliza prioridades estáticas como otros algoritmos de planificación, permite que los procesos ajusten dinámicamente su prioridad utilizando la llamada al sistema `nice()`. Los procesos con una prioridad más baja recibirán una mayor cuota de tiempo de CPU virtual.

- **No preempción basada en tiempo:** El CFS no se basa en la preempción basada en tiempo, lo que significa que los procesos no son interrumpidos de manera regular. En su lugar, los procesos se ejecutan durante un período de tiempo definido por el tiempo de CPU virtual asignado.

## Funcionamiento:

1. **Asignación inicial del tiempo de CPU:** Cuando un proceso se inicia o se despierta de un estado de espera, el CFS le asigna un tiempo de CPU virtual inicial. Este tiempo se basa en la cantidad de tiempo de CPU que el proceso ha recibido anteriormente y en su prioridad relativa en comparación con otros procesos en la cola de planificación.

2. **Selección del próximo proceso:** El CFS selecciona el próximo proceso a ejecutar comparando el tiempo de CPU virtual utilizado por cada proceso en la cola de planificación. El proceso con el menor tiempo de CPU virtual se selecciona para ejecutarse a continuación.

3. **Ejecución del proceso:** El proceso seleccionado se ejecuta durante un intervalo de tiempo definido por su tiempo de CPU virtual asignado. Durante este tiempo, el proceso puede utilizar la CPU sin ser interrumpido.

4. **Actualización del tiempo de CPU virtual:** Después de que un proceso ha sido ejecutado durante un período de tiempo, el CFS actualiza su tiempo de CPU virtual para reflejar el tiempo que ha utilizado. Este tiempo se utiliza en la próxima selección de proceso para garantizar una planificación justa y equitativa de la CPU.
