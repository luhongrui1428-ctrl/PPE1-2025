# Journal de bord du projet encadré
## 06/10 Exercices

### 1. Création du dépôt "PPE1-2025"
Après avoir créé le dépôt "PPE1-2025" sur GitHub, j'ai utilisé `git clone` pour cloner le dépôt dans mon dossier personnel. Pour mieux organiser mes projets, j'ai créé un dossier de cours "ProjetEncadre1" avec `mkdir`, puis j'ai déplacer le dossier "PPE1-2025" dans ce nouveau dossier de cours en utilisant la commande `mv`.

### 2. Création du fichier `journal.md`
Après la création du fichier `journal.md` sur GitHub, le dépôt local n'était pas directement mis à jour. La commande `git status` affichait "up to date", mais la commande `ls` montrait que le dossier local n'était pas actualisé. J'ai ensuite utilisé `git pull` pour récupérer les mises à jour, puis j'ai vérifié à nouveau avec `ls` - cette fois avec succès. J'ai également consulté l'historique des commits avec `git log` pour confirmer la mise à jour.

**Note :** GitHub ne synchronise pas automatiquement les modifications vers le dépôt local. Il faut utiliser :
- `git fetch` pour voir les nouveaux contenus distants;
- `git pull` pour télécharger et fusionner les modifications dans le dépôt local.
  
### 3. Création du tag
Lorsque j'ai tenté de créer et pousser un tag avec les commandes :
- git tag -a gitintro -m "version finie intro git"
- git push origin gitintro\
Une fenêtre d'authentification est apparue me demandant un nom d'utilisateur et un mot de passe. Cependant, mes identifiants GitHub normaux n'ont pas fonctionné et la fenêtre n'utilisait pas le protocole SSH que j'avais configuré.

En analysant le problème, je réalise que la difficulté vient probablement du fait que **j'ai initialement cloné le dépôt avec une URL HTTPS plutôt qu'SSH**. Sur la page GitHub, l'URL HTTPS est affichée par défaut - il faut activement sélectionner l'onglet "SSH" pour obtenir l'URL correcte. 

## 12/10 Exercices
### Exercice 1
Au début, j’ai essayé de téléverser un fichier sur GitHub depuis un autre dossier, mais ça ne marchait pas bien ; après l’avoir déplacé dans mon dépôt local, tout est devenu plus simple.
### Exercice 2
2.a - Penser à vérifier les chemins des fichiers .ann
