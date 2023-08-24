# Appmaker

Simple CLI permettant de créer les dossiers et fichiers nécessaires pour tranformer un script ou un programme en application MacOS.

Pour créer une application :

``` bash
appmaker <appname>
```

**Note:** Il sera par la suite nécessaire de spécifier

``` bash
appmaker create <appname> <script-path>
```

Ceci créera l'arborescence suivante :

```bash
essai.app/
└── Contents
    ├── Info.plist
    ├── MacOS
    │   └── essai
    │       └── run.command
    ├── Resources
    │   └── Icon.icns
```

Ceci peut ensuite être déplacé manuellement dans le dossier `Applications/` de MacOS.

Alternativement, il sera possible d'automatiser cette installation avec la commmande :

```bash
appmaker install <appname> <script-path>
```

Si le dossier est déjà prêt et complet, cela copiera simplement le dossier dans `Applications/`, sinon  `appmaker` se chargera de créer l'application et de la placer dans `Applications/`.
