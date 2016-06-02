[1mdiff --git a/tarea.bat b/tarea.bat[m
[1mindex b5e41d9..0976f2a 100644[m
[1m--- a/tarea.bat[m
[1m+++ b/tarea.bat[m
[36m@@ -7,8 +7,8 @@[m [mwinscp.com /script=tarea.txt >> tarea.log[m
 if %ERRORLEVEL% neq 0 goto error[m
  [m
 echo %date% %time% - Carga correcta, moviendo ficheros locales >> tarea.log[m
[31m-echo dir /S /P e:\ftplogista\tempValladolid\*.* >> regitro_valladolid.log[m
[31m-move e:\ftplogista\tempValladolid\*.* e:\ftplogista\backup\valladolid >> tarea.log[m
[32m+[m[32mecho dir /S /P e:\directorio\temp\*.* >> tarea.log[m
[32m+[m[32mmove e:\directorio\temp\*.* e:\directorio\backup\ >> tarea.log[m
 echo %date% %time% - Enviando email de notificacion...[m
 @ECHO OFF[m
 REM send email from command line via IIS[m
[1mdiff --git a/tarea.txt b/tarea.txt[m
[1mindex a00a638..b090e4a 100644[m
[1m--- a/tarea.txt[m
[1m+++ b/tarea.txt[m
[36m@@ -8,8 +8,8 @@[m [mopen ftp://usuario:contrase[m
 cd /flog[m
 # Force binary mode transfer[m
 option transfer binary[m
[31m-# Download file to the local directory e:\ftplogista[m
[31m-get *.* e:\ftplogista\tempValladolid\[m
[32m+[m[32m# Download file to the local directory e:\directorio[m
[32m+[m[32mget *.* e:\directorio\temp\[m
 #Delete remote files[m
 rm *.*[m
 # Disconnect[m
[36m@@ -19,7 +19,7 @@[m [mopen ftp://usuario:contrase[m
 # Change the remote directory[m
 cd /papiro/valladolid/interface[m
 # Upload the file to current working directory[m
[31m-put e:\ftplogista\tempValladolid\*.* /papiro/valladolid/interface/[m
[32m+[m[32mput e:\directorio\temp\*.* /directorio/destino/[m
 # Disconnect[m
 close[m
 # Exit WinSCP[m
