# Toolbox

Boîte à outils rassemblant des programmes et scripts simples utiles au quotidien. Parmi ceux-ci, on trouve :

## 1. [Appmaker](/appmaker)

Application CLI écrite en Fortran qui permet de transformer un script en application Mac. Ceci est possible par un arrangement de fichiers et dossier. Voir le [README associé](/appmaker/README.md)

## 2. [MyServer](/myserver)

Simple script qui encapsule le serveur http proposé par Python (lancé avec la commande `python -m http.server`) en trouvant l'adresse IP de l'ordinateur sur lequel est lancé le script. Il est également possible
de spécifier le chemin d'accès dans lequel le serveur doit prendre racine. Ainsi, tout appareil connecté au réseau local peut avoir accès aux fichiers de la machone sur lequel le script est lancé, et les consulter soit en direct, soit les
télécharger.

## 3. [Profiler](/profiler)

Script donnant accès à un profileur de code Python, calculant le temps d'éxécution d'une fonction, ainsi que la mémoire totale instantanée utilisé par le programme.
