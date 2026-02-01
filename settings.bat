@echo off
chcp 65001 >nul
title Mise à jour TelService

if not exist config.txt (
    echo updates=oui > config.txt
)

for /f "tokens=1,2 delims==" %%a in (config.txt) do (
    if "%%a"=="updates" set updates=%%b
)

if "%updates%"=="non" (
    echo Mises à jour désactivées.
    pause
    exit /b
)

echo Vérification des mises à jour pour TelService...
powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/version.txt' -OutFile 'temp_version.txt'" 2>nul

if exist "temp_version.txt" (
    set /p remote_ver=<temp_version.txt
    set /p local_ver=<version.txt
    if "!local_ver!" neq "!remote_ver!" (
        echo Mise à jour disponible. Version locale: !local_ver!, Version distante: !remote_ver!
        echo Téléchargement des mises à jour...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/telservice.bat' -OutFile 'telservice_new.bat'"
        if exist "telservice_new.bat" (
            move "telservice_new.bat" "telservice.bat"
            echo !remote_ver! > version.txt
            echo Mise à jour terminée.
        ) else (
            echo Erreur lors du téléchargement.
        )
    ) else (
        echo TelService est à jour (version !local_ver!).
    )
    del temp_version.txt
) else (
    echo Impossible de vérifier les mises à jour. Vérifiez votre connexion internet.
)

pause