@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:MENU
cls
echo.
echo ===============================================
echo              TelService STORE
echo ===============================================
echo.

REM Charger et afficher les applications disponibles
echo Applications disponibles:
echo.

REM App 1: LSE FreeVM
echo [1] LSE FreeVM
if exist "..\apps\freeVM.version.txt" (
    for /f "delims=" %%v in ('type "..\apps\freeVM.version.txt"') do (
        echo     Version installee: %%v
    )
    echo     Statut: [INSTALLEE]
) else (
    echo     Statut: [A TELECHARGER]
)
echo.

REM App 2: myAIRBENZ
echo [2] myAIRBENZ
if exist "..\apps\myAIRBENZ.version.txt" (
    for /f "delims=" %%v in ('type "..\apps\myAIRBENZ.version.txt"') do (
        echo     Version installee: %%v
    )
    echo     Statut: [INSTALLEE]
) else (
    echo     Version: 1.0.0
    echo     Statut: [A TELECHARGER]
)
echo.

REM App 3: Meteorologie
echo [3] Meteorologie
if exist "..\apps\meteo.version.txt" (
    for /f "delims=" %%v in ('type "..\apps\meteo.version.txt"') do (
        echo     Version installee: %%v
    )
    echo     Statut: [INSTALLEE]
) else (
    echo     Version: 1.0.0
    echo     Statut: [A TELECHARGER]
)
echo.

echo [9] Gerer les applications instalees
echo [0] Retour au menu principal
echo.
set /p "CHOICE=Selectionnez une option: "

if "%CHOICE%"=="1" goto INSTALL_FREEVM
if "%CHOICE%"=="2" goto INSTALL_AIRBENZ
if "%CHOICE%"=="3" goto INSTALL_METEO
if "%CHOICE%"=="9" goto MANAGE_APPS
if "%CHOICE%"=="0" exit /b 0

echo.
echo Option invalide!
timeout /t 2 >nul
goto MENU

:INSTALL_FREEVM
cls
echo.
echo ===============================================
echo      Telecharger / Mettre a jour FreeVM
echo ===============================================
echo.
if exist "..\apps\freeVM.version.txt" (
    echo Application deja installee.
    echo Voulez-vous la mettre a jour?
    set /p "UPDATE=Oui (O) / Non (N): "
    if /i "!UPDATE!"=="O" (
        echo Telecharger FreeVM v1.2.0...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/freeVM.bat' -OutFile '..\apps\freeVM.bat'" 2>nul
        echo 1.2.0> "..\apps\freeVM.version.txt"
        echo Mise a jour complete!
    )
) else (
    echo Telechargement de FreeVM v1.0.0...
    powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/freeVM.bat' -OutFile '..\apps\freeVM.bat'" 2>nul
    echo 1.0.0> "..\apps\freeVM.version.txt"
    echo Installation complete!
)
timeout /t 3 >nul
goto MENU

:INSTALL_AIRBENZ
cls
echo.
echo ===============================================
echo      Telecharger / Mettre a jour myAIRBENZ
echo ===============================================
echo.
if exist "..\apps\myAIRBENZ.version.txt" (
    echo Application deja installee.
    echo Voulez-vous la mettre a jour?
    set /p "UPDATE=Oui (O) / Non (N): "
    if /i "!UPDATE!"=="O" (
        echo Telechargement de myAIRBENZ v1.1.0...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/myAIRBENZ.bat' -OutFile '..\apps\myAIRBENZ.bat'" 2>nul
        echo 1.1.0> "..\apps\myAIRBENZ.version.txt"
        echo Mise a jour complete!
    )
) else (
    echo Telechargement de myAIRBENZ v1.0.0...
    powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/myAIRBENZ.bat' -OutFile '..\apps\myAIRBENZ.bat'" 2>nul
    echo 1.0.0> "..\apps\myAIRBENZ.version.txt"
    echo Installation complete!
)
timeout /t 3 >nul
goto MENU

:INSTALL_METEO
cls
echo.
echo ===============================================
echo      Telecharger / Mettre a jour Meteorologie
echo ===============================================
echo.
if exist "..\apps\meteo.version.txt" (
    echo Application deja installee.
    echo Voulez-vous la mettre a jour?
    set /p "UPDATE=Oui (O) / Non (N): "
    if /i "!UPDATE!"=="O" (
        echo Telechargement de Meteorologie v1.1.0...
        powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/meteo.bat' -OutFile '..\apps\meteo.bat'" 2>nul
        echo 1.1.0> "..\apps\meteo.version.txt"
        echo Mise a jour complete!
    )
) else (
    echo Telechargement de Meteorologie v1.0.0...
    powershell -command "Invoke-WebRequest -Uri 'https://telservice.com/apps/meteo.bat' -OutFile '..\apps\meteo.bat'" 2>nul
    echo 1.0.0> "..\apps\meteo.version.txt"
    echo Installation complete!
)
timeout /t 3 >nul
goto MENU

:MANAGE_APPS
cls
echo.
echo ===============================================
echo      Gestion des applications instalees
echo ===============================================
echo.
echo Applications instalees:
echo.

set "count=0"

if exist "..\apps\freeVM.version.txt" (
    set /a count=!count!+1
    echo [!count!] LSE FreeVM
    for /f "delims=" %%v in ('type "..\apps\freeVM.version.txt"') do (
        echo     Version: %%v
    )
)

if exist "..\apps\myAIRBENZ.version.txt" (
    set /a count=!count!+1
    echo [!count!] myAIRBENZ
    for /f "delims=" %%v in ('type "..\apps\myAIRBENZ.version.txt"') do (
        echo     Version: %%v
    )
)

if exist "..\apps\meteo.version.txt" (
    set /a count=!count!+1
    echo [!count!] Meteorologie
    for /f "delims=" %%v in ('type "..\apps\meteo.version.txt"') do (
        echo     Version: %%v
    )
)

echo.
echo [0] Retour
echo.
set /p "CHOICE=Selectionnez une app a desinstaller (0 pour annuler): "

if "%CHOICE%"=="0" goto MENU
if "%CHOICE%"=="1" (
    if exist "..\apps\freeVM.version.txt" (
        del "..\apps\freeVM.version.txt"
        echo LSE FreeVM desinstallee!
    )
) else if "%CHOICE%"=="2" (
    if exist "..\apps\myAIRBENZ.version.txt" (
        del "..\apps\myAIRBENZ.version.txt"
        echo myAIRBENZ desinstallee!
    )
) else if "%CHOICE%"=="3" (
    if exist "..\apps\meteo.version.txt" (
        del "..\apps\meteo.version.txt"
        echo Meteorologie desinstallee!
    )
)
timeout /t 2 >nul
goto MENU
