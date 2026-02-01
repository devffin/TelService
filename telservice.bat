@echo off
setlocal enabledelayedexpansion
title TelService Menu
chcp 65001 >nul

:menu
cls
echo ==================================================
echo              TelService Menu
echo ==================================================
echo.
echo Applications:
echo.

set "app_count=0"

REM Vérifier FreeVM
if exist "apps\freeVM.version.txt" (
    set /a app_count=!app_count!+1
    for /f "delims=" %%v in ('type "apps\freeVM.version.txt"') do (
        echo !app_count!. LSE FreeVM [v%%v] ^(Installee^)
    )
) else (
    set /a app_count=!app_count!+1
    echo !app_count!. LSE FreeVM [A telecharger]
)

REM Vérifier myAIRBENZ
if exist "apps\myAIRBENZ.version.txt" (
    set /a app_count=!app_count!+1
    for /f "delims=" %%v in ('type "apps\myAIRBENZ.version.txt"') do (
        echo !app_count!. myAIRBENZ [v%%v] ^(Installee^)
    )
) else (
    set /a app_count=!app_count!+1
    echo !app_count!. myAIRBENZ [A telecharger]
)

REM Vérifier Météo
if exist "apps\meteo.version.txt" (
    set /a app_count=!app_count!+1
    for /f "delims=" %%v in ('type "apps\meteo.version.txt"') do (
        echo !app_count!. Meteorologie [v%%v] ^(Installee^)
    )
) else (
    set /a app_count=!app_count!+1
    echo !app_count!. Meteorologie [A telecharger]
)

REM TelStore toujours disponible
set /a app_count=!app_count!+1
if exist "apps\telstore.version.txt" (
    for /f "delims=" %%v in ('type "apps\telstore.version.txt"') do (
        echo !app_count!. TelStore [v%%v]
    )
) else (
    echo !app_count!. TelStore
)

echo.
echo 9. Parametres
echo 0. Quitter
echo.
set /p choice="Selectionnez une option (0-!app_count!/9): "

if "%choice%"=="1" ( 
    if exist "apps\freeVM.bat" (
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/freeVM.version.txt' -OutFile 'temp_version.txt'" 2>nul
        if exist "temp_version.txt" (
            set /p remote_ver=<temp_version.txt
            if exist "apps\freeVM.version.txt" (
                set /p local_ver=<apps\freeVM.version.txt
                if "!local_ver!" neq "!remote_ver!" (
                    echo Mise a jour de LSE FreeVM...
                    powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/freeVM.bat' -OutFile 'apps\freeVM.bat'"
                    copy temp_version.txt "apps\freeVM.version.txt" >nul
                )
            ) else (
                echo Telechargement de la version de LSE FreeVM...
                powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/freeVM.bat' -OutFile 'apps\freeVM.bat'"
                copy temp_version.txt "apps\freeVM.version.txt" >nul
            )
            del temp_version.txt
        )
        call "apps\freeVM.bat"
        goto menu
    ) else (
        echo Telechargement de LSE FreeVM...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/freeVM.bat' -OutFile 'apps\freeVM.bat'" 2>nul
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/freeVM.version.txt' -OutFile 'apps\freeVM.version.txt'" 2>nul
        if exist "apps\freeVM.bat" (
            call "apps\freeVM.bat"
        ) else (
            echo Erreur de telechargement!
            pause
        )
        goto menu
    )
) else if "%choice%"=="2" (
    if exist "apps\myAIRBENZ.bat" (
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/myAIRBENZ.version.txt' -OutFile 'temp_version.txt'" 2>nul
        if exist "temp_version.txt" (
            set /p remote_ver=<temp_version.txt
            if exist "apps\myAIRBENZ.version.txt" (
                set /p local_ver=<apps\myAIRBENZ.version.txt
                if "!local_ver!" neq "!remote_ver!" (
                    echo Mise a jour de myAIRBENZ...
                    powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/myAIRBENZ.bat' -OutFile 'apps\myAIRBENZ.bat'"
                    copy temp_version.txt "apps\myAIRBENZ.version.txt" >nul
                )
            ) else (
                echo Telechargement de la version de myAIRBENZ...
                powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/myAIRBENZ.bat' -OutFile 'apps\myAIRBENZ.bat'"
                copy temp_version.txt "apps\myAIRBENZ.version.txt" >nul
            )
            del temp_version.txt
        )
        call "apps\myAIRBENZ.bat"
        goto menu
    ) else (
        echo Telechargement de myAIRBENZ...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/myAIRBENZ.bat' -OutFile 'apps\myAIRBENZ.bat'" 2>nul
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/myAIRBENZ.version.txt' -OutFile 'apps\myAIRBENZ.version.txt'" 2>nul
        if exist "apps\myAIRBENZ.bat" (
            call "apps\myAIRBENZ.bat"
        ) else (
            echo Erreur de telechargement!
            pause
        )
        goto menu
    )
) else if "%choice%"=="3" (
    if exist "apps\meteo.bat" (
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/meteo.version.txt' -OutFile 'temp_version.txt'" 2>nul
        if exist "temp_version.txt" (
            set /p remote_ver=<temp_version.txt
            if exist "apps\meteo.version.txt" (
                set /p local_ver=<apps\meteo.version.txt
                if "!local_ver!" neq "!remote_ver!" (
                    echo Mise a jour de Meteorologie...
                    powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/meteo.bat' -OutFile 'apps\meteo.bat'"
                    copy temp_version.txt "apps\meteo.version.txt" >nul
                )
            ) else (
                echo Telechargement de la version de Meteorologie...
                powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/meteo.bat' -OutFile 'apps\meteo.bat'"
                copy temp_version.txt "apps\meteo.version.txt" >nul
            )
            del temp_version.txt
        )
        call "apps\meteo.bat"
        goto menu
    ) else (
        echo Telechargement de Meteorologie...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/meteo.bat' -OutFile 'apps\meteo.bat'" 2>nul
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/meteo.version.txt' -OutFile 'apps\meteo.version.txt'" 2>nul
        if exist "apps\meteo.bat" (
            call "apps\meteo.bat"
        ) else (
            echo Erreur de telechargement!
            pause
        )
        goto menu
    )
) else if "%choice%"=="4" (
    if exist "apps\telstore.bat" (
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/telstore.version.txt' -OutFile 'temp_version.txt'" 2>nul
        if exist "temp_version.txt" (
            set /p remote_ver=<temp_version.txt
            if exist "apps\telstore.version.txt" (
                set /p local_ver=<apps\telstore.version.txt
                if "!local_ver!" neq "!remote_ver!" (
                    echo Mise à jour de TelStore...
                    powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/telstore.bat' -OutFile 'apps\telstore.bat'"
                    copy temp_version.txt "apps\telstore.version.txt" >nul
                )
            ) else (
                echo Téléchargement de la version de TelStore...
                powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/telstore.bat' -OutFile 'apps\telstore.bat'"
                copy temp_version.txt "apps\telstore.version.txt" >nul
            )
            del temp_version.txt
        )
        call "apps\telstore.bat"
        goto menu
    ) else (
        echo Téléchargement de TelStore...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/telstore.bat' -OutFile 'apps\telstore.bat'"
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/telstore.version.txt' -OutFile 'apps\telstore.version.txt'"
        call "apps\telstore.bat"
        goto menu
    )
) else if "%choice%"=="9" (
    if exist "settings.bat" (
        call "settings.bat"
        goto menu
    ) else (
        echo Le fichier de paramètres est introuvable.
        pause
        goto menu
    )
) else if "%choice%"=="0" (
    echo Fermeture de TelService...
    timeout /t 2 /nobreak >nul
    exit
) else (
 echo Option invalide. Veuillez réessayer.
 pause
 goto menu
)