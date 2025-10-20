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
2.a - Penser à vérifier les chemins des fichiers .ann\
2.b - Au début, grep ../../Exercice1/ann/$ANNEE/$ANNEE_$MOIS*.ann ne trouvait pas les fichiers. J’ai corrige les chemins des fichiers corrigés avec ${ANNEE}_$MOIS*.ann pour correspondre au nom réel des fichiers. Ajout des accolades ${ANNEE} pour éviter toute ambiguïté lors de la concaténation avec _. \
En plus, j’ai mis "..." \ | cut ... et ça faisait une erreur unexpected EOF. J’ai compris qu’il ne faut pas mettre de backslash après les guillemets.

**Revision**：
- grep : recherche des motifs dans l’entrée ou dans des fichiers (-h supprime le nom du fichier dans la sortie, -w recherche le mot exact)
- sort : trie les lignes (-n numérique, -r inverse l’ordre pour du plus grand au plus petit)
- uniq : supprime les lignes répétées (-c compte le nombre d’occurrences consécutives)
- echo : affiche un texte, utile pour formater les résultats
- cut : sélectionne des colonnes d’un fichier tabulaire (-f pour choisir le(s) champ(s), séparateur par défaut \t)
- tail : garde seulement les dernières lignes d’un flux ou fichier (-n pour le nombre de lignes)
- head : garde seulement les premières lignes d’un flux ou fichier (-n pour le nombre de lignes)

## 15/10
### 1. Revision - git
**CONFIGURATION**\
git config --global user.name "Votre Nom" → Définir votre nom\
git config --global user.email "votre@email.com" → Définir votre email\
**DÉMARRAGE**\
git init → Initialiser un nouveau dépôt\
git clone <url> → Cloner un dépôt distant\
**TRAVAIL QUOTIDIEN**\
git status → Voir les fichiers modifiés\
git add <fichier> → Ajouter un fichier spécifique\
git add . → Ajouter tous les fichiers\
git commit -m "Message" → Sauvegarder avec message\
git restore <fichier> → Annuler modifications\
**BRANCHES**\
git branch → Lister les branches\
git checkout <branche> → Changer de branche\
git merge <branche> → Fusionner une branche\
**SYNCHRONISATION**\
git fetch → Télécharger les changements sans fusionner (plus stable que "git pull" et ne fusionne pas le fichier)\
git pull → Récupérer et fusionner les modifications\
git push → Envoyer les commits\
git remote -v → Voir les dépôts distants\
**ANNULATION**\
git rm <FILE...> → Retirer du suivi (remove) un fichier\
**UTILITAIRES**\
git log → Voir l'historique\
git diff → Voir les différences\
git tag <nom> → Créer un tag\

depot local comme une boite, add - ajouter qch. dans ce depot, commit - fermer la boite avec le note de modification, push - envoyer le depot local au depot en ligne - pull - obtenir le depot en ligne.\

### 2.Condition if
if [ condition ]; then
echo " la condition est valide "
else
echo " la condition n ’ est pas valide "
fi

Sur les chemins
-f fichier vrai si le fichier existe
-s fichier vrai si le fichier existe et n’est pas vide

Sur des chaînes de caractères
-n chaine vrai si la chaîne n’est pas vide
-z vrai si la chaîne est vide (ex: argument non fourni)

Sur les entiers
a -eq b equal(=)
a -ne b not equal(!=)
a -lt b less than(<)
a -gt b greater than(>)
a -le b less than or equal(<=)
a -ge b greater than or equal(>=)

Avec des doubles crochets"[[]]", il est possible d’utiliser des expressions régulières pour tester des chaînes.(equal: =~)

### 3.Les Boucles for et while

**For**
N=0
for ELEMENTin a b c d e
do
   N=$(expr $N+1)
   echo "le $N ieme element est $Element"
done

expr: compter - différents types de calculs

**While**
while [ condition ];
do
echo " je continue à boucler " ;
done

attention aux boucles infinies ! (**CTRL-C** pour arrêter brutalement le programme).

**EXERCICE**
#!/usr/bin/bash

#Vérifier le nombre d'arguments
if [ $# -ne 1 ]  # Si le nombre d'arguments n'est pas égal à 1
then
  echo "Ce programme demande un argument"
  exit
fi

FICHIER_URLS=$1  # Définir FICHIER_URLS comme le premier argument
OK=0             # Initialiser OK à 0
NOK=0            # Initialiser NOK à 0

#Lire chaque ligne du fichier
while read -r LINE
do
  echo "La ligne: $LINE"

  # Vérifier si la ligne ressemble à une URL valide
  if [[ $LINE =~ ^https?:// ]] # Si la ligne correspond à "https?://"
  then
    echo "Ressemble à une URL valide"
    OK=$(expr $OK + 1)  # Ajouter 1 à OK
  else #sinon
    echo "Ne ressemble pas à une URL valide"
    NOK=$(expr $NOK + 1)  # Ajouter 1 à NOK
  fi
done < "$FICHIER_URLS"  # Lire depuis le fichier spécifié

#Afficher les résultats finaux
echo "$OK URLs et $NOK lignes douteuses"

## 20/10 Points dans les exercices
Il faut noter ces points importants en shell :
- Les espaces sont obligatoires autour des crochets `[` et `]` dans les conditions ;
- `&&` = ET (AND) - toutes les conditions doivent être vraies ;
- `||` = OU (OR) - au moins une condition doit être vraie;
- Pas d'espaces autour du `=` dans l'assignation des variables.(ex. datadir="ann")

