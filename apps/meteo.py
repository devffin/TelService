# -*- coding: utf-8 -*-
from clear import clear
import sys
import urllib.request
import urllib.parse
import json

def return_to_main():
    """Retourne au menu principal."""
    # Ne pas relancer main.py en subprocess - c'est le parent qui gère.
    # On sort simplement de cette application.
    sys.exit(0)

def meteo(ville):
    """Récupère et affiche la météo d'une ville."""
    clear()
    try:
        ville_encoded = urllib.parse.quote(ville)
        url = f"https://wttr.in/{ville_encoded}?format=j1"
        with urllib.request.urlopen(url, timeout=5) as response:
            data = json.loads(response.read().decode("utf-8"))
        
        if "current_condition" not in data or len(data["current_condition"]) == 0:
            print("Erreur : données météo invalides.")
            return
        
        current = data["current_condition"][0]
        print("\n=== Météo ===")
        print(f"Ville : {ville}")
        print(f"Température : {current.get('temp_C', 'N/A')}°C")
        print(f"Ressenti : {current.get('FeelsLikeC', 'N/A')}°C")
        
        if "weatherDesc" in current and len(current["weatherDesc"]) > 0:
            desc = current["weatherDesc"][0].get('value', 'N/A')
            print(f"Météo : {desc}")
        
        print(f"Humidité : {current.get('humidity', 'N/A')}%")
        print(f"Vent : {current.get('windspeedKmph', 'N/A')} km/h\n")
    except urllib.error.URLError:
        print("Erreur réseau : vérifiez votre connexion internet.")
    except json.JSONDecodeError:
        print("Erreur : impossible de traiter la réponse du serveur.")
    except Exception as e:
        print(f"Erreur : impossible de récupérer la météo. ({e})")
    input("Appuyez sur Entrée pour revenir au menu...")

def menu():
    """Menu principal météo."""
    while True:
        clear()
        print("Météo")
        print("=====================================")
        ville = input("Entrez le nom de votre ville (exit pour quitter): ").strip()
        if ville == "exit":
            return_to_main()
        elif ville:
            meteo(ville)
        else:
            print("Veuillez entrer un nom de ville valide.")
            input("Appuyez sur Entrée pour continuer...")

if __name__ == "__main__":
    menu()