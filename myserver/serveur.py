import os
import sys
import socket
import subprocess
import contextlib
from pathlib import Path


no_output = False
@contextlib.contextmanager
def working_directory(path):
    """Changes working directory and returns to previous on exit."""
    prev_cwd = Path.cwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(prev_cwd)


PORT = 9999
current_path = Path().absolute()
print("[SERVEUR LOCAL] appuyer sur q pour quitter")
print("Récupération de l'adresse IP locale ...")
# on récupère l'adresse IP locale sur laquelle le serveur est lancée
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
ip_locale, port = s.getsockname()
print("Adresse récupérée :", ip_locale)
print("Port :", PORT)

commande = f"python3 -m http.server {PORT} --bind {ip_locale}"
print(commande)

if len(sys.argv) < 2:
    path = Path.home()
else:
    path = sys.argv[-1]
os.chdir(path)
print(f"Lancement du serveur à partir de {path}...")

url = f"http://{ip_locale}:{PORT}"
print("Le serveur est prêt. Appuyer sur Entrée pour commencer")

# while input().lower() != "q":
print(f"Fichiers accessibles à l'adresse {url}")
subprocess.run(commande.split(), capture_output=no_output)

