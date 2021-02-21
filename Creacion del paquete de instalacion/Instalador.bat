@echo off
echo Bienvenido al programa de instalación
mkdir "%ProgramFiles%\MiGestion"

REM Mover los ficheros
copy "%CD%\*" "%ProgramFiles%\MiGestion"

cd "%ProgramFiles%\MiGestion"

REM Montar la BD
mysql -u ClaseStudium --password=Studium2020; <fichero.sql

REM Crear acceso directo
ECHO Set objShell = WScript.CreateObject("WScript.Shell") >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO ficheroAccesoDirecto = "%USERPROFILE%\Desktop\Tiendecita.lnk" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO Set objAccesoDirecto = objShell.CreateShortcut(ficheroAccesoDirecto) >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.TargetPath = "%ProgramFiles%\MiGestion\Tiendecita.exe" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.Arguments = "" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.Description = "Tiendecita" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.HotKey = "" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.IconLocation = "%ProgramFiles%\MiGestion\Tiendecita.exe, 0">>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.WindowStyle = "1" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.WorkingDirectory = "%ProgramFiles%\MiGestion" >>%USERPROFILE%\Desktop\accsdirecto.vbs
ECHO objAccesoDirecto.Save >>%USERPROFILE%\Desktop\accsdirecto.vbs
ATTRIB +h +s "%USERPROFILE%\Desktop\accsdirecto.vbs"
START /B /WAIT %USERPROFILE%\Desktop\accsdirecto.vbs
erase /Q /AHS "%USERPROFILE%\Desktop\accsdirecto.vbs"
msg * Acesso directo Creado en el Escritorio

REM Iniciar
Tiendecita.exe
