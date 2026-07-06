# -*- coding: utf-8 -*-
from clear import clear
import os
import sys
import tempfile
import yt_dlp

def return_to_main():
    """Retourne au menu principal."""
    # Ne pas relancer main.py en subprocess - c'est le parent qui gère.
    # On sort simplement de cette application.
    sys.exit(0)

def play_file(file_path):
    """Lit un fichier audio."""
    try:
        if not os.path.isfile(file_path):
            print(f"Erreur : le fichier {file_path} n'existe pas.")
            return
        
        if os.name == "nt":
            os.startfile(file_path)
        else:
            subprocess.run(["xdg-open", file_path], check=True, timeout=5)
    except subprocess.TimeoutExpired:
        print("Erreur : délai d'attente dépassé lors de l'ouverture du fichier.")
    except FileNotFoundError:
        print("Erreur : le lecteur audio par défaut n'est pas disponible.")
    except Exception as e:
        print(f"Erreur lors de la lecture du fichier : {e}")

def youtube_download_and_play(url):
    """Télécharge et joue une vidéo YouTube."""
    try:
        if not url.strip():
            print("Erreur : veuillez entrer une URL valide.")
            return
        
        temp_dir = tempfile.gettempdir()
        ydl_opts = {
            'format': 'bestaudio/best',
            'outtmpl': os.path.join(temp_dir, '%(title)s.%(ext)s'),
            'quiet': True
        }
        print("Téléchargement YouTube...")
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            info = ydl.extract_info(url, download=True)
            file_path = ydl.prepare_filename(info)
        
        if os.path.isfile(file_path):
            print("Lecture...")
            play_file(file_path)
        else:
            print("Erreur : le fichier téléchargé n'a pas pu être trouvé.")
    except yt_dlp.utils.DownloadError as e:
        print(f"Erreur YouTube : URL invalide ou vidéo inaccessible. ({e})")
    except Exception as e:
        print(f"Erreur YouTube : {e}")
    input("Appuyez sur Entrée pour revenir au menu principal...")

def menu():
    """Menu principal musique."""
    while True:
        clear()
        print("=== Musique ===")
        print("1. Jouer un fichier local")
        print("2. Télécharger et jouer une vidéo YouTube")
        print("3. Retour au menu principal")
        choice = input("Choisissez une option : ")
        
        if choice == "1":
            file_path = input("Entrez le chemin du fichier audio : ").strip()
            if file_path and os.path.isfile(file_path):
                play_file(file_path)
                input("Appuyez sur Entrée pour revenir au menu...")
            elif not file_path:
                print("Veuillez entrer un chemin valide.")
                input("Appuyez sur Entrée pour continuer...")
            else:
                print("Fichier introuvable.")
                input("Appuyez sur Entrée pour revenir au menu...")
        elif choice == "2":
            url = input("Entrez l'URL de la vidéo YouTube : ").strip()
            youtube_download_and_play(url)
        elif choice == "3":
            return_to_main()
        else:
            print("Option invalide.")
            input("Appuyez sur Entrée pour revenir au menu...")

if __name__ == "__main__":
    menu()