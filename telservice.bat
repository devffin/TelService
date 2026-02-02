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
echo 1. LSE FreeVM
echo 2. myAIRBENZ
echo 3. Meteorologie
echo 4. Musique
echo 5. TelStore
echo.
echo 9. Mise a jour de TelService
echo 0. Quitter
echo.
set /p choice="Selectionnez une option (0/9): "

if "%choice%"=="1" (
    if exist "apps\freeVM.bat" (
        call "apps\freeVM.bat"
    ) else (
        echo LSE FreeVM n'est pas installe. Veuillez l'installer via TelStore.
        pause
        goto
    )
    goto menu
) else if "%choice%"=="2" (
    if exist "apps\myAIRBENZ.bat" (
        call "apps\myAIRBENZ.bat"
    ) else (
        echo myAIRBENZ n'est pas installe. Veuillez l'installer via TelStore.
        pause
        goto menu
    )
    goto menu
) else if "%choice%"=="3" (
    if exist "apps\meteo.bat" (
        call "apps\meteo.bat"
    ) else (
        echo Meteorologie n'est pas installe. Veuillez l'installer via TelStore.
        pause
        goto menu
    )
    goto menu
) else if "%choice%"=="4" (
    if exist "apps\musique.bat" (
        call "apps\musique.bat"
    ) else (
        echo Musique n'est pas installe. Veuillez l'installer via TelStore.
        pause
        goto menu
    )
    goto menu
) else if "%choice%"=="5" (
    call telstore.bat
    goto menu
) else if "%choice%"=="9" (
    call update.bat
    goto menu
) else if "%choice%"=="0" (
    echo Merci d'avoir utilise TelService. Au revoir!
    exit
) else (
    echo Choix invalide. Veuillez reessayer.
    pause
    goto menu
)