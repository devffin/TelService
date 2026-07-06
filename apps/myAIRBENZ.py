# -*- coding: utf-8 -*-
import sys
import urllib.request
from clear import clear

def return_to_main():
    """Retourne au menu principal."""
    # Ne pas relancer main.py en subprocess - c'est le parent qui gère.
    # On sort simplement de cette application.
    sys.exit(0)

def menu():
    """Menu principal myAIRBENZ."""
    while True:
        clear()
        print("====================================================")
        print("Bienvenue sur myAIRBENZ!")
        print("L'appli de la communaute retro")
        print("====================================================")
        print("")
        print("====================================================")
        print("Actualites:")
        print("")
        url = "https://devffin.github.io/dl/ma-actus.txt"
        try:
            with urllib.request.urlopen(url, timeout=5) as response:
                content = response.read().decode("utf-8")
            if content.strip():
                print(content)
            else:
                print("Aucune actualité disponible.")
        except urllib.error.URLError:
            print("Erreur réseau : vérifiez votre connexion internet.")
        except Exception as e:
            print(f"Erreur lors du téléchargement des actualités. ({e})")
        print("")
        print("====================================================")
        print("")
        choice = input("Appuyez sur Entrée pour revenir au menu (0 pour quitter): ").strip()
        if choice == "0":
            return_to_main()
        # Sinon, continue la boucle pour réafficher les actualités

if __name__ == "__main__":
    menu()