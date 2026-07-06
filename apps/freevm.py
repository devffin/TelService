# -*- coding: utf-8 -*-
from clear import clear
import os
import sys
import urllib.request
import webbrowser

def return_to_main():
    """Retourne au menu principal de manière sécurisée."""
    # Ne pas relancer main.py en subprocess - c'est le parent qui gère.
    # On sort simplement de cette application.
    sys.exit(0)

def vms():
    """Affiche les VMs disponibles."""
    clear()
    print("VMs disponibles:")
    print("")
    print("1. Ubuntu 20.04 - Pour développement web")
    print("2. Windows 10 - Pour applications Windows")
    print("3. Zorin OS - Pour utilisateurs Linux débutants")
    print("4. Fedora 35 - Pour développeurs et testeurs")
    print("")
    print("Toutes les VMs sont gratuites et légales.")
    input("Appuyez sur Entrée pour revenir au menu...")

def rent():
    """Ouvre le formulaire de location."""
    clear()
    print("Ouverture du formulaire de location...")
    try:
        webbrowser.open("https://forms.gle/7kd8NjzYbafvQRyM9")
        print("Lien ouvert dans votre navigateur par défaut.")
    except Exception as e:
        print(f"Erreur lors de l'ouverture du navigateur : {e}")
    input("Appuyez sur Entrée pour revenir au menu...")

def my_rentals():
    """Affiche les locations actives de l'utilisateur."""
    clear()
    print("Vos locations actives:")
    print("")
    username = input("Entrez votre nom d'utilisateur: ").strip()
    if not username:
        print("Erreur : veuillez entrer un nom d'utilisateur valide.")
        input("Appuyez sur Entrée pour revenir au menu...")
        return
    url = f"https://devffin.github.io/dl/locs/{username}.txt"
    try:
        with urllib.request.urlopen(url, timeout=5) as response:
            content = response.read().decode("utf-8")
            print(content)
    except urllib.error.URLError:
        print(f"Erreur réseau : vérifiez votre connexion internet.")
    except Exception as e:
        print(f"Aucune location trouvée pour {username}. ({e})")
    print("")
    input("Appuyez sur Entrée pour revenir au menu...")

def menu():
    """Menu principal de LSE FreeVM."""
    while True:
        clear()
        print("============================================")
        print("                LSE FreeVM")
        print("    Location de VMs légales et gratuites")
        print("============================================")
        print("")
        print("1. Voir les VMs disponibles")
        print("2. Louer une VM")
        print("3. Mes locations actives")
        print("0. Quitter")
        print("")
        choice = input("Choisissez une option: ")
        if choice == "1":
            vms()
        elif choice == "2":
            rent()
        elif choice == "3":
            my_rentals()
        elif choice == "0":
            return_to_main()
        else:
            print("Option invalide. Veuillez réessayer.")
            input("Appuyez sur Entrée pour continuer...")

if __name__ == "__main__":
    menu()