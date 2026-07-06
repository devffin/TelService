# -*- coding: utf-8 -*-
from clear import clear
import subprocess
import sys

def launch(app):
    """Lance une application Python de manière sécurisée."""
    try:
        # Utiliser subprocess au lieu d'os.system pour éviter l'injection de commande
        subprocess.run([sys.executable, app], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors du lancement de {app}: {e}")
    except FileNotFoundError:
        print(f"Application non trouvée: {app}")

def menu():
    while True:
        clear()
        print("==================================================")
        print("             TelService Menu")
        print("==================================================")
        print("")
        print("Applications:")
        print("")
        print("1. LSE FreeVM")
        print("2. myAIRBENZ")
        print("3. Méteo")
        print("4. Musique")
        print("5. TelStore")
        print("6. ASCIImation")
        print("")
        print("0. Quitter")
        print("")
        choice = input("Sélectionnez une option (0-6): ")
        if choice == "1":
            launch("apps/freevm.py")
        elif choice == "2":
            launch("apps/myAIRBENZ.py")
        elif choice == "3":
            launch("apps/meteo.py")
        elif choice == "4":
            launch("apps/musique.py")
        elif choice == "5":
            launch("apps/telstore.py")
        elif choice == "6":
            launch("apps/ASCIImation.py")
        elif choice == "0":
            print("Au revoir!")
            break
        else:
            print("Option invalide. Veuillez réessayer.")
            input("Appuyez sur Entrée pour continuer...")

if __name__ == "__main__":
    menu()