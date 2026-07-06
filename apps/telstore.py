# -*- coding: utf-8 -*-
from clear import clear
import os
import subprocess
import sys

def return_to_main():
    """Retourne au menu principal."""
    try:
        main_path = os.path.join(os.path.dirname(__file__), "..", "main.py")
        subprocess.run([sys.executable, main_path], check=False)
    except Exception as e:
        print(f"Erreur : {e}")
    sys.exit(0)

def menu():
    """Menu TelStore."""
    clear()
    print("Erreur TSs: TelStore a fermé temporairement.")
    input("Appuyez sur Entrée pour revenir au menu principal...")
    return_to_main()

if __name__ == "__main__":
    menu()