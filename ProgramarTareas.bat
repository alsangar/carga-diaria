#Se pone en hora el reloj del sistema
w32tm /config /manualpeerlist:1.europe.pool.ntp.org /syncfromflags:MANUAL
w32tm /config /update

#Se agregan las tareas especificadas para que se ejecuten cada hora
SchTasks /Create /SC HOURLY /TN nombre_tarea_programada /TR "c:\tarea\tarea.bat"
