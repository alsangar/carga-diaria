
@prompt set date=$d$_ set time=$t$h$h$h
echo %date% %time% - Iniciando conexión... >> tarea.log

winscp.com /script=tarea.txt >> tarea.log

if %ERRORLEVEL% neq 0 goto error
 
echo %date% %time% - Carga correcta, moviendo ficheros locales >> tarea.log
echo dir /S /P e:\ftplogista\tempValladolid\*.* >> regitro_valladolid.log
move e:\ftplogista\tempValladolid\*.* e:\ftplogista\backup\valladolid >> tarea.log
echo %date% %time% - Enviando email de notificacion...
@ECHO OFF
REM send email from command line via IIS

REM change this path to point to IIS's pickup directory
SET root=c:\InetPub\MailRoot\Pickup

REM set up temp and eml filenames
IF NOT EXIST %root%\temp MKDIR %root%\temp
:setTempFileName
SET tmp=%RANDOM%
IF EXIST %root%\temp\%tmp%.tmp GOTO setTempFileName
SET eml=%tmp%.eml
SET tmp=%root%\temp\%tmp%.tmp

REM build the email.  ^ is the escape character
ECHO From: envio_automatico@dominio.es> %tmp%
ECHO To: usuario@dominio.es, usuario2@dominio.es >> %tmp%
ECHO Subject: FANDE >> %tmp%
ECHO Content-Type: text/html>> %tmp%
ECHO.>> %tmp%
ECHO ^<h1^>%date% %time%: Se han cargado ^<b^>nuevos ficheros^</b^> en FTP.^</h1^>>> %tmp%

REM move the temp file into the pickup directory for delivery
RENAME %tmp% %eml%
MOVE %root%\temp\%eml% %root% >> tarea.log
echo %date% %time% - Email enviado... >> tarea.log
exit 0
 
:error
echo %date% %time% - Carga fallida, manteniendo ficheros locales >> tarea.log
echo %date% %time% - Enviando mail de notificacion....
@ECHO OFF
REM send email from command line via IIS

REM change this path to point to IIS's pickup directory
SET root=c:\InetPub\MailRoot\Pickup

REM set up temp and eml filenames
IF NOT EXIST %root%\temp MKDIR %root%\temp
:setTempFileName
SET tmp=%RANDOM%
IF EXIST %root%\temp\%tmp%.tmp GOTO setTempFileName
SET eml=%tmp%.eml
SET tmp=%root%\temp\%tmp%.tmp

REM build the email.  ^ is the escape character
ECHO From: envio_automatico@dominio.es> %tmp%
ECHO To: alberto@dominio.es>> %tmp%
ECHO Subject: FANDE Logista>> %tmp%
ECHO Content-Type: text/html>> %tmp%
ECHO.>> %tmp%
ECHO ^<h1^>%date% %time%: Existen nuevos ficheros en FTP pero ^<b^>el proceso automático ha fallado^</b^>.^</h1^>>> %tmp%

REM move the temp file into the pickup directory for delivery
RENAME %tmp% %eml%
MOVE %root%\temp\%eml% %root% >> tarea.log
echo %date% %time% - Email enviado.
exit 1
# Exit WinSCP
exit