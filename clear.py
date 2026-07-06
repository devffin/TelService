"""
Simple module to clear the console screen.
Works on Windows, Linux, and macOS.
"""
import os
import platform

def clear():
    """Clear the terminal/console screen."""
    try:
        system = platform.system()
        if system == "Windows":
            result = os.system("cls")
        else:  # Linux and macOS
            result = os.system("clear")
        if result != 0:
            print("Avertissement : impossible de clear l'écran.")
    except Exception as e:
        print(f"Avertissement : erreur lors du clear. ({e})")
