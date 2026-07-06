@echo off
title Python Installer

set "default_lang=en"

:lang1
cls
echo Do you want to keep the default language (English) or change it?
echo Y. Keep default language (English)
echo N. Change language
set /p "lang_choice=Enter your choice (Y/N): "
if /i "%lang_choice%"=="Y" (
    set "lang=%default_lang%"
    goto install
) else if /i "%lang_choice%"=="N" (
    goto lang2
) else (
    echo Invalid choice. Please enter Y or N.
    pause
    goto lang1
)

:lang2
cls
echo Please select your preferred language:
echo 1. English
echo 2. Spanish
echo 3. French
echo 4. German
set /p "lang_choice=Enter the number corresponding to your language: "
if "%lang_choice%"=="1" (
    set "lang=en"
    goto install
) else if "%lang_choice%"=="2" (
    set "lang=es"
    goto install
) else if "%lang_choice%"=="3" (
    set "lang=fr"
    goto install
) else if "%lang_choice%"=="4" (
    set "lang=de"
    goto install
) else (
    echo Invalid choice. Please enter a number between 1 and 4.
    pause
    goto lang2
)

:install
cls
if "%lang%"=="en" call setmsgs_EN
if "%lang%"=="es" call setmsgs_ES
if "%lang%"=="fr" call setmsgs_FR
if "%lang%"=="de" call setmsgs_DE
call isPythonInstalled
echo %download.msg%
curl -o PyInstaller.exe https://www.python.org/ftp/python/3.14.4/python-3.14.4-amd64.exe
if exist PyInstaller.exe (
    echo %downloaded.msg%
    echo %install.msg%
    start /wait PyInstaller.exe /quiet InstallAllUsers=1 PrependPath=1
    where python >nul 2>&1
    if %errorlevel% equ 0 (
        echo %success.msg%
    ) else (
        where py >nul 2>&1
        if %errorlevel% equ 0 (
            echo %success.msg%
        ) else (
            echo %failure.msg%
        )
    )
) else (
    echo %download_fail.msg%
)
pause
exit

:setmsgs_EN
set "download.msg=Downloading Python installer..."
set "downloaded.msg=Python installer downloaded successfully."
set "install.msg=Installing Python..."
set "success.msg=Python installed successfully and added to PATH."
set "failure.msg=Failed to install Python."
set "download_fail.msg=Failed to download Python installer."

:setmsgs_ES
set "download.msg=Descargando el instalador de Python..."
set "downloaded.msg=El instalador de Python se ha descargado correctamente."
set "install.msg=Instalando Python..."
set "success.msg=Python se ha instalado correctamente y se ha agregado a la variable de entorno PATH."
set "failure.msg=Error al instalar Python."
set "download_fail.msg=Error al descargar el instalador de Python."

:setmsgs_FR
set "download.msg=Téléchargement de l'installateur Python..."
set "downloaded.msg=Installeur Python téléchargé avec succès."
set "install.msg=Installation de Python..."
set "success.msg=Python installé avec succès et ajouté à la variable d'environnement PATH."
set "failure.msg=Échec de l'installation de Python."
set "download_fail.msg=Échec du téléchargement de l'installeur Python."

:setmsgs_DE
set "download.msg=Python-Installer wird heruntergeladen..."
set "downloaded.msg=Python-Installer erfolgreich heruntergeladen."
set "install.msg=Python wird installiert..."
set "success.msg=Python erfolgreich installiert und zur Umgebungsvariable PATH hinzugefügt."
set "failure.msg=Installation von Python fehlgeschlagen."
set "download_fail.msg=Download des Python-Installers fehlgeschlagen."

:isPythonInstalled
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo Python is already installed.
    pause
    exit
) else (
    where py >nul 2>&1
    if %errorlevel% equ 0 (
        echo Python is already installed.
        pause
        exit
    )
)