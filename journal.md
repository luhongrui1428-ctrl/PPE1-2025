# Journal de bord du projet encadré
## 06/10 Exercices

### 1. Création du dépôt "PPE1-2025"
Après avoir créé le dépôt "PPE1-2025" sur GitHub, j'ai utilisé `git clone` pour cloner le dépôt dans mon dossier personnel. Pour mieux organiser mes projets, j'ai créé un dossier de cours "ProjetEncadre1" avec `mkdir`, puis j'ai déplacer le dossier "PPE1-2025" dans ce nouveau dossier de cours en utilisant la commande `mv`.

### 2. Création du fichier `journal.md`
Après la création du fichier `journal.md` sur GitHub, le dépôt local n'était pas directement mis à jour. La commande `git status` affichait "up to date", mais la commande `ls` montrait que le dossier local n'était pas actualisé. J'ai ensuite utilisé `git pull` pour récupérer les mises à jour, puis j'ai vérifié à nouveau avec `ls` - cette fois avec succès. J'ai également consulté l'historique des commits avec `git log` pour confirmer la mise à jour.

**Note :** GitHub ne synchronise pas automatiquement les modifications vers le dépôt local. Il faut utiliser :
- `git fetch` pour voir les nouveaux contenus distants;
- `git pull` pour télécharger et fusionner les modifications dans le dépôt local.
  
