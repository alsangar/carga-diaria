# Scripts de carga diaria de ficheros
Este conjunto de scripts permiten mover ficheros entre servidores FTP utilizando [WinSCP](https://winscp.net/eng/download.php). 
La idea principal es que se realice de forma automática un proceso por el cual conectemos a un FTP de origen para descargar 
unos ficheros, de los cuales queda una copia de seguridad en local, para despues moverlos a un FTP destino diferente al origen.

Todo el proceso queda registrado en un fichero log para poder hacer un seguimiento de lo que ocurre. Además se envia un correo electrónico con el resultado de la operación.

Existen tres ficheros:
* tarea.bat: batch que incluye el conjunto de instrucciones que definen la lógica principal.
* tarea.txt: incluye los comandos FTP de navegación y transferencia de ficheros.
* ProgramarTareas.bat: comando para agregar al programador de tareas de Windows la ejecución automática de "tarea.bat"

## tarea.bat

Este batch es el que contiene la lógica del programa y realiza las siguientes ordenes:

1. Obtiene la fecha y hora para que quede registrado en el log
2. Se llama a winscp para ejecutar el script tarea.txt
3. Comprueba el resultado devuelto por WinSCP para saber si el proceso ha sido exitoso o fallido y enviar un correo electrónico en consecuencia.

## tarea.txt

Este script se pasa como argumento a WinSCP ya que define las instrucciones que se ejecutan en el proceso de conexión a los FTPs: abrir la conexión, navegar por los directorios, obtener los archivos, etc.
