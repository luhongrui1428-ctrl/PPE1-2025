# Journal de bord du projet encadré
## Cours1 et 2
### 1.Le Système de fichier
|No.|Mot clef|definition|Symbol|
|:---|:-----|:-----------:|:---:|
|01|fichier|un élément enregistré dans un dossier|---|
|02|dossier(ou repertoire)|un espace qui contient des fichiers|---|
|03|dossier «parent»|le dossier qui contient d’autres dossiers ou fichiers|`../`|
|04|arborescence|la structure organisée des dossiers et fichiers, comme un arbre.|---|
|05|racine|le dossier qui contient tous les autres dossiers dans l'ordi|`/`|
|06|dossier personnel("HOME")|le dossier de l'utilisateur|`~/`|
|07|dossier courant ou «de travail»|le dossier ou on est en train d'effectuer des operations|`./`|
|08|chemin absolu|le chemin complet vers un dossier ou un fichier, à partir de la racine|ex.`/home/pierre/PPE1`|
|09|chemin relatif|le chemin vers un dossier ou un fichier, à partir du dossier courant |ex: `../../dev/input/mouse3`|
|10|caractères de remplacement(jokers)|des caractères spéciaux qui remplacent une ou plusieurs parties d’un nom ou d’un chemin | `?` (un seul caractère) / `*` (n’importe quelle suite de caractères) |

### 2. Les Commandes
`nom [-options...] [arguments...]`
Le système découpe la ligne de commande avant d’exécuter.
- nom → le nom de la commande (ex : ls, cd, echo, curl)
- options → modifient le comportement de la commande
forme courte : -o (un seul tiret)
forme longue : --option (deux tirets)
- arguments → les éléments sur lesquels la commande agit
souvent des chemins ou des fichiers, mais pas toujours.

| Commande | Définition |
|:----------|:------------|
| `pwd` | *print working directory* → affiche le dossier courant |
| `ls` | lister le contenu d’un dossier |
| `cd` | *change directory* → changer de dossier |
| `cp` | copier un fichier ou un dossier |
| `mv` | *move* → déplacer ou renommer un fichier/dossier |
| `rm` | *remove* → supprimer un fichier ou un dossier |
| `mkdir` | *make directory* → créer un dossier |
| `touch` | créer un fichier vide ou mettre à jour la date de modification |
| `zip` | compresser dans une archive `.zip` |
| `unzip` | décompresser une archive `.zip` |
| `tar` | manipuler des archives `.tar` |
| `file` | donner des informations sur le type d’un fichier |
| `cat` | afficher le contenu d’un ou plusieurs fichiers |
| `head` | afficher le début d’un fichier |
| `tail` | afficher la fin d’un fichier |
| `cut` | sélectionner une ou plusieurs colonnes d’un fichier tabulé |
| `less` | afficher le contenu d’un fichier page par page (lecteur interactif) |

**man** : `man commande`
→ affiche la page de manuel de la commande.
Ces pages sont très détaillées, donc il est parfois difficile de retenir tous les usages.

Je n’avais pas l’archive dans le tableau, alors j’ai téléchargé l’archive 60 de ma camarade.

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
- git push origin gitintro

Une fenêtre d'authentification est apparue me demandant un nom d'utilisateur et un mot de passe. Cependant, mes identifiants GitHub normaux n'ont pas fonctionné et la fenêtre n'utilisait pas le protocole SSH que j'avais configuré.

En analysant le problème, je réalise que la difficulté vient probablement du fait que **j'ai initialement cloné le dépôt avec une URL HTTPS plutôt qu'SSH**. Sur la page GitHub, l'URL HTTPS est affichée par défaut - il faut activement sélectionner l'onglet "SSH" pour obtenir l'URL correcte. 

## Cours 3
### 1. Flux principaux
- **stdin (0)** : entrée standard (clavier)
- **stdout (1)** : sortie standard (écran)
- **stderr (2)** : erreurs (écran)
*Ctrl +D sert à indiquer la fin de l’entrée (EOF)*

Remarque personnelle :
Pendant le cours, je n’avais pas bien compris cette partie sur les flux principaux (stdin = 0, stdout = 1, stderr = 2).
Je confondais leur rôle et je ne retenais pas la signification des numéros.
Mais après avoir relu le diapos et fait les exercices, j’ai finalement compris le fonctionnement des trois flux d’entrées-sorties.

### 2. Redirections
- `< fichier` : lire depuis un fichier
- `> fichier` : écrire dans un fichier (le simple chevron va écraser le fichier exsit.)
- `>> fichier` : (le double chevrons) ajouter à la fin
- `2> fichier` : rediriger les erreurs
- `|` : connecter deux commandes (pipeline)

### 3. Scripts Bash
- Fichier texte contenant des commandes
- Commence par `#!/usr/bin/bash`
- Rendre exécutable : chmod +x script.sh
- Arguments : `$1`, `$2`, `$#`...
- Variables : `NOM=valeur`, utiliser `$NOM`

## 12/10 Exercices
### Exercice 1
Au début, j’ai essayé de téléverser un fichier sur GitHub depuis un autre dossier, mais ça ne marchait pas bien ; après l’avoir déplacé dans mon dépôt local, tout est devenu plus simple.
### Exercice 2
2.a - Penser à **vérifier les chemins des fichiers** .ann\
2.b - Au début, grep ../../Exercice1/ann/$ANNEE/$ANNEE_$MOIS*.ann ne trouvait pas les fichiers. J’ai corrigé les chemins des fichiers avec ${ANNEE}_$MOIS*.ann pour correspondre au nom réel des fichiers. Ajout des accolades ${ANNEE} pour éviter toute ambiguïté lors de la concaténation avec _.

En plus, j’avais mis un `\`après les guillemets pour couper la ligne, mais ça donnait une erreur unexpected EOF.
J’ai compris qu’**il ne faut pas mettre de backslash `\` juste après les guillemets**, sinon Bash pense que la chaîne de caractères n’est pas terminée.

**Revision**：
- `grep` : recherche des motifs dans l’entrée ou dans des fichiers (`-h` supprime le nom du fichier dans la sortie, `-w` recherche le mot exact)
- `sort` : trie les lignes (`-n` numérique, `-r` inverse l’ordre pour du plus grand au plus petit)
- `uniq` : supprime les lignes répétées (`-c` compte le nombre d’occurrences consécutives)
- `echo` : affiche un texte, utile pour formater les résultats
- `cut` : sélectionne des colonnes d’un fichier tabulaire (`-f` pour choisir le(s) champ(s), séparateur par défaut `\t`)
- `tail` : garde seulement les dernières lignes d’un flux ou fichier (`-n` pour le nombre de lignes)
- `head` : garde seulement les premières lignes d’un flux ou fichier (`-n` pour le nombre de lignes)

## 15/10 Cours 4
### 1. Revision - git
- CONFIGURATION\
git config --global user.name "Votre Nom" → Définir votre nom\
git config --global user.email "votre@email.com" → Définir votre email
- DÉMARRAGE\
`git init` → Initialiser un nouveau dépôt\
`git clone <url>` → Cloner un dépôt distant
- TRAVAIL QUOTIDIEN\
`git status` → Voir les fichiers modifiés\
`git add <fichier>` → Ajouter un fichier spécifique\
`git add .` → Ajouter tous les fichiers\
`git commit -m "Message"` → Sauvegarder avec message\
`git restore <fichier>` → Annuler modifications
- BRANCHES\
`git branch` → Lister les branches\
`git checkout <branche>` → Changer de branche\
`git merge <branche>` → Fusionner une branche
- SYNCHRONISATION\
`git fetch` → Télécharger les changements sans fusionner (plus stable que "git pull" et ne fusionne pas le fichier)\
`git pull` → Récupérer et fusionner les modifications\
`git push` → Envoyer les commits\
`git remote -v` → Voir les dépôts distants
- ANNULATION\
`git rm <FILE...>` → Retirer du suivi (remove) un fichier
- UTILITAIRES\
`git log` → Voir l'historique\
`git diff` → Voir les différences\
`git tag <nom>` → Créer un tag

Un dépôt local est comme une boîte :\
`add` → mettre quelque chose dans la boîte\
`commit` → fermer la boîte avec une note de modification\
`push` → envoyer la boîte (le dépôt local) vers le dépôt en ligne
`pull` → récupérer la boîte du dépôt en ligne

### 2.Condition if
```bash
if [ condition ]; then
echo " la condition est valide "
else
echo " la condition n ’ est pas valide "
fi
```
Sur les chemins
`-f` fichier vrai si le fichier existe
`-s` fichier vrai si le fichier existe et n’est pas vide
`-d` dossier vrai si le dossier existe

Sur des chaînes de caractères
`= ou !=` tester si deux chaînes sont identiques (=) ou différentes (!=)
`< ou >` pour déterminer si in chaîne est avant ou après une autre dans l’ordre alphabétique
`-n` chaine vrai si la chaîne n’est pas vide
`-z` vrai si la chaîne est vide (ex: argument non fourni)

Sur les entiers
a `-eq` b equal(=)
a `-ne` b not equal(!=)
a `-lt` b less than(<)
a `-gt` b greater than(>)
a `-le` b less than or equal(<=)
a `-ge` b greater than or equal(>=)

*Avec des doubles crochets"[[]]", il est possible d’utiliser des expressions régulières pour tester des chaînes.(equal: =~)*

### 3.Les Boucles for et while

**For**
```bash
N=0
for ELEMENTin a b c d e
do
   N=$(expr $N+1)
   echo "le $N ieme element est $Element"
done
```
expr: compter - différents types de calculs

**While**
```bash
while [ condition ];
do
echo " je continue à boucler " ;
done
```
attention aux boucles infinies ! (**CTRL-C** pour arrêter brutalement le programme).

**EXERCICE**
```bash
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
while read -r LINE # lire qch standard, sinon faux
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
done < "$FICHIER_URLS"  # Lire depuis le fichier spécifié, si on met le $FICHIER_URLS au debut, le fichier serait rouvert à chaque itération et la lecture recommencerait au début, ce qui couvrirait les résultats.
#Afficher les résultats finaux
echo "$OK URLs et $NOK lignes douteuses"
```

## 20/10 Points dans les exercices
**Syntaxe Bash**
- Mettre des espaces autour des crochets `[ ]` dans les conditions.
- Utiliser `&&` pour “et” et `||` pour “ou”.
- Ne pas mettre d’espaces autour du `=` dans les variables.
**`git pull`**
- Echouer si le dépôt local et le dépôt distant ont tous les deux des nouveaux commits.
- Dans ce cas, il vaut mieux utiliser **`git fetch`** puis vérifier et fusionner manuellement les changements.
**`git tag`**
- Par défaut, le tag pointe sur le **dernier commit (HEAD)**.
- Si on veut marquer un **ancien commit**, il faut d’abord retrouver son ID avec `git log` puis créer le tag dessus.

## 22/10 Cours5
### 1.HTML
Le langage HTML utilise des « balises » pour annoter du texte, des images et d'autres contenus afin de les afficher dans un navigateur web.
Le balisage HTML comprend des éléments spéciaux tels que
`<head>`, `<title>`, `<body>`, `<header>`, `<footer>`, `<article>`, `<section>`, `<p>`, `<div>`, `<span>`, `<img>`, `<aside>`, `<audio>`, `<canvas>`, `<datalist>`, `<details>`, `<embed>`, `<nav>`, `<search>`, `<output>`, `<progress>`, `<video>`, `<ul>`, `<ol>`, `<li>` et bien d'autres.

Les balises ne sont **pas sensibles à la casse** (majuscules/minuscules possibles).

### 2.HTTP
HTTP est un protocole cree pour communiquer sur le WWW.

| Code | Signification |
|------|----------------|
| 1xx | Information |
| 200 | Réussite |
| 3xx | Redirection |
| 4xx | Erreur du client |
| 5xx | Erreur du serveur |

### 3.Lynx
un navigateur web en terminal  
installation: sudo apt install lynx  
Demonstration: lynx https://url  
`-dump` : afficher le contenu textuel  
`-nolist` : sans la liste des liens  

Si on n'utlise pas l'option `-nolist`,  
“lynx -dump  https://plurital.org | grep -v -P '\d+\. (http|mailto)'”
   - `grep` filtre le texte avec des expressions régulières
   - `-v` inverse la sélection (affiche les lignes qui NE correspondent PAS)
   - `-P` utilise les expressions régulières compatibles Perl
   - `\d+\. (http|mailto)` est le motif recherché :
     * `\d+` : un ou plusieurs chiffres
     * `\.` : un point littéral
     * `(http|mailto)` : soit "http" soit "mailto"

### 3.wget et cURL
wget : ecrit dans un fichier  
cURL : ecrit dans le terminal  
installation: sudo apt install curl  
lancer la commande: curl <url>  
`-i` : include headers  
`-L` : follow redirects  
`-o <fichier>` : output file  
`-I` : show headers only

```bash
curl https://www.github.com  # pas de résultat
curl -i https://www.github.com  # affiche le code 301 (redirection)
curl -L https://www.github.com  # suit la redirection
```
Les lignes les plus importantes à retenir sont:  
**Status HTTP**; **Content-Type**; **Location(s'il y en a)**  

```bash
curl -i https://www.perdu.com
HTTP/2 200 #Status
date: Wed, 22 Oct 2025 09:29:49 GMT
content-type: text/html #Content type
last-modified: Thu, 02 Jun 2016 06:01:08 GMT
```
note: recherche dans `man`: "/" +le contenus qu'on veut

## 27/10 Exercices
### Exercice1
1) Quand on utilise `cat` avant while dans une commande comme `cat fichier | while read ...`, la boucle while s’exécute dans un sous-processus.Les variables modifiées à l’intérieur (par exemple un compteur N) sont perdues à la fin de la boucle.
Par contre, avec `done < "urls/fr.txt"`, le fichier est lu par le processus principal(boucle WHILE), donc les variables gardent leurs valeurs après la boucle.
2) Ajouter un argument et utiliser la condition `if` pour le vérifier.

**Problemes et solutions**:  
1.
```bash
./programmes/miniprojet.sh: line 13: expr0+1: command not found
```
**La commande `expr` exige qu’il y ait des espaces autour des opérations.**

2. Comment séparer le résultat avec une tabulation :\
`man echo` :
```bash
-e enable interpretation of backslash escapes
If -e is in effect, the following sequences are recognized:
       \\     backslash
       \b     backspace
       \e     escape
       \f     form feed
       \n     new line
       \r     carriage return
       \t     horizontal tab
       \v     vertical tab
```
### Exercice2
**Problemes et solutions**:
1. En essayant d’extraire le code HTTP avec `curl -s -I $line | grep -`, la commande a échoué parce que je ne savais pas quel motif grep utiliser pour extraire le bon élément.\
En consultant `man curl`, j’ai découvert l’option `-w "%{http_code}"` qui permet d’afficher directement le code HTTP.\
J’ai ensuite testé `curl -s -w "%{http_code}"`, mais cela affichait encore le contenu HTML, car `-s` ne supprime que les messages d’erreur, pas la sortie standard.\
Après avoir demandé à GPT, j’ai compris que l’option `-o /dev/null` permet de rediriger la sortie standard vers le “fichier noir”, donc ne garde que le code HTTP.\
Avec `curl -s -o /dev/null -w "%{http_code}"`·, j’ai enfin obtenu le résultat correct.

2. une autre erreur :\
`/programmes/miniprojet.sh: line 20: [: -ne: unary operator expected.`\
J’ai compris que cela se presente quand la variable comparée (par exemple $code) est vide.\
Il faut d’abord vérifier qu’elle n’est pas vide (-z) avant de faire la comparaison.


### `/dev/null`
`/dev/null` est un **fichier spécial** sous Linux qui sert de “poubelle” ou de “trou noir” pour les données.
Tout ce qu’on y envoie est **supprimé immédiatement** sans produire d’erreur.
#### Exemples :
- `command > /dev/null`
  → envoie la **sortie standard (stdout)** dans le vide.
- `command 2> /dev/null`
  → envoie la **sortie d’erreur (stderr)** dans le vide.
- `command &> /dev/null`
  → envoie **stdout et stderr** dans le vide.

On l’utilise pour **masquer les sorties inutiles**, par exemple avec `curl` :
```bash
curl -s -o /dev/null -w "%{http_code}" https://example.com
```

## 05/11 Cours 6
### 1.Corriger les exercices
1. `cat` affiche simplement le contenu du fichier, sans interpréter les lignes ni les mots.
Ensuite, c’est la commande `read` qui lit réellement ligne par ligne, en s’arrêtant au caractère de fin de ligne.
De son côté, la boucle `for` ne lit pas le fichier : elle parcourt les éléments d’une chaîne en les séparant selon IFS (par défaut, les espaces, tabulations et retours à la ligne).

2. Espaces dans les noms de fichiers (Bash)
En Bash, pour utiliser un nom avec espace, il faut utiliser `\`.
Avec \ :
mkdir un\ documents

3. curl -I
```curl -I -L -s -w "%{content_type}\n%{http_code}\n" -o /dev/null https://fr.wikipedia.org```

- -I : seulement l’en-tête HTTP
- -L : suivre les redirections
- -s : silencieux
- -w : formatage de sortie
- -o /dev/null : ignorer le corps

4. extraire l'encodage
```echo "text/html; charset=UTF-8" | grep -E -o "charset=.*" | cut -d= -f2```
Résultat : UTF-8.
Explication :
- grep -E -o : expression régulière + sortie du match
- cut -d= -f2 : découper sur = et prendre la deuxième partie.

5. code HTTP 429
En testant, j’ai fait trop de curl d’affilée sur Wikipédia, et alors il presente le résultat : HTTP 429 (Too Many Requests).
C’est un rate-limit : le serveur bloque quand on envoie trop de requêtes trop vite.
le code HTTP et le type de con a la fin

*Il vaut mieux créer deux variables,`$FICHIER_ENTREE` et `$FICHIER_SORTIE`,pour que l’utilisateur indique lui-même les chemins en lançant le programme.
Comme ça, le script reste réutilisable et propre, sans modifier le code à chaque fois.

### 2.HTML-balise
1. syntaxe

<balise/> autofermantes ou vides

les atribus d'une balise sont des couples cle/valeurs sur la balise ouvrantes et autofermantes.
<NP fct="SUJ">

head: l'entete du fichier
contient bcp d'information, le plus interessant: un metadonee:charset

Tableau en HTML:
table: racine
tr: table raw(laligne)
th: table jeader (la premiere ligne)
td: table data(toutes les lignes pas l'entete)

<table>
  <tr><th>livre</th><th>taille</th></tr>
  <tr>
    <td>Du cote chez SWAN</td><td>1.0Mo</td>
  </tr>
</table>

devoir: modifier le script-sortir un tableau en HTML

## 10/11 Exercices
1. Corriger mon script
Pour que le code HTTP et l’encodage soient corrects : les variables doivent être entourées de guillemets (echo "$code_et_encodage")， sinon les retours à la ligne deviendra l'espace.
2. Creer le tableau en html par script
```
echo -e "
<html>
<head>
<body>
<table>
	<tr>
		<th>numero</th>
		<th>URL</th>
		<th>code_http</th>
		<th>encodage</th>
		<th>nombre de mot</th>
	</tr>
"


#il faut mettre en dehor de la boucle
echo -e "
</table>
</body>
</head>
</html>
"
```

## Cours7
I. les balises
`Balise <a>` : Insérer un lien
```<a href="lien">cliquer ici</a> ```
`Balise <p>` : Paragraphe
`Balises <h1> à <h6>` : Titres
`<b>` gras
`<i>` italique

Listes
`<ol>` liste ordonnée
`<ul>` liste non ordonnée
`<li>` élément

Class
Ajouter une classe à un élément HTML
```<p class="nom">texte</p>`

II. CSS
Modifier le style d'une page HTML

Trois façons d’insérer du CSS
1. Dans une balise
```<p style="color:red;">texte</p>```
2. Dans l’entête d’un fichier HTML
```<style> p { color:red; } </style>```
3. Dans un fichier séparé .css
```<link rel="stylesheet" href="style.css">```

## 17/11 Exercices
1. Comparer mon script et la version correct
- Difference entre **exit** et **exit1**：
exit (ou exit 0) : le script s’est terminé correctement.
exit 1 (!=0) : il y a une erreur.
- Difference entre **/dev/null** et **./.data.tmp**
a) Si curl utilise **/dev/null**(un trou noir), le code HTML téléchargé n’est pas conservé.
Lynx doit alors refaire une requête HTTP pour récupérer la page.
Deux requêtes successives peuvent renvoyer des contenus différents (redirection, langue, cookies, contenu dynamique…).
➡️ Résultat : le nombre de mots peut changer.
b) Si on utilise **.data.tmp**, le HTML sera téléchargé par curl temporairement.
Lynx lit directement ce fichier avec -stdin, sans refaire de requête HTTP.
Le contenu analysé est strictement le même que celui obtenu par curl.
- Difference entre **charset = .** et **charset=\S+**
charset=.* : Capture tout ce qui suit charset= jusqu’à la fin de la ligne.
charset=\S+ : Capture la suite de caractères non-blancs, seulement la valeur du charset (ex. UTF-8).
2. CSS- Finir le miniprojet
Je n’ai pas utilisé le fichier CSS fourni dans le dépôt; à la place, j’ai testé un petit fichier CSS trouvé en ligne, mais son impact est resté très limité.
Dans la pratique, j'ai utiliser principalement les configurations de base de Bulma.
Les classes Bulma utilisées :
- Structure/Layout : `hero`, `hero-body`, `section`, `container`, `box`
- Typographie : `title`, `subtitle`, `title is-4`
- Couleurs : `is-primary` #main color
- Boutons : `button`, `is-link`, `is-medium`
- Tableaux (dans la page générée par Bash) : `table`, `is-striped`, `is-fullwidth`

Note:
- Problème : caractères à échapper dans Bash
En générant du HTML depuis Bash, certains caractères doivent être échappés pour éviter des erreurs :
`\` doit devenir `\\`;`$` peut nécessiter `\$` si utilisé dans un echo

## Cours 8
1.REGEX
Cette semaine, j’ai révisé plusieurs notions essentielles du cours REGEX :
- Recherche d’URL
Trop large : capture aussi le mot suivant.
```
https?:\/\/.*\b
https?:\/\/.+
```
https?:\/\/[^ ]+ : elle capturait non seulement l’URL, mais également le premier mot qui la suit.

(https?:\/\/|www\.)[^\s]+[a-zA-Z0-9]\/?:\s correspond à tout caractère d’espacement
```
/
(https?:\/\/|www\.)[^\s]+[a-zA-Z0-9]\/?
/
gm
1st Capturing Group (https?:\/\/|www\.)
1st Alternative https?:\/\/
http
 matches the characters http literally (case sensitive)
s
 matches the character s with index 11510 (7316 or 1638) literally (case sensitive)
? matches the previous token between zero and one times, as many times as possible, giving back as needed (greedy)
: matches the character : with index 5810 (3A16 or 728) literally (case sensitive)
\/ matches the character / with index 4710 (2F16 or 578) literally (case sensitive)
2nd Alternative www\.
www
 matches the characters www literally (case sensitive)
\. matches the character . with index 4610 (2E16 or 568) literally (case sensitive)
Match a single character not present in the list below [^\s]
+ matches the previous token between one and unlimited times, as many times as possible, giving back as needed (greedy)
\s matches any whitespace character (equivalent to [\r\n\t\f\v ])
Match a single character present in the list below [a-zA-Z0-9]
a-z matches a single character in the range between a (index 97) and z (index 122) (case sensitive)
A-Z matches a single character in the range between A (index 65) and Z (index 90) (case sensitive)
0-9 matches a single character in the range between 0 (index 48) and 9 (index 57) (case sensitive)
\/
 matches the character / with index 4710 (2F16 or 578) literally (case sensitive)
? matches the previous token between zero and one times, as many times as possible, giving back as needed (greedy)
Global pattern flags
g modifier: global. All matches (don't return after first match)
m modifier: multi line. Causes ^ and $ to match the begin/end of each line (not only begin/end of string)
```

Seulement “http…”：```https?:\/\/.*?\b```
2. Regex-Classes Unicode
Reconnaître des langues diverses:
`\p{L}`- correspond à toute lettre Unicode.
`\p{L}*`- zéro ou plusieurs lettres.
`\p{L}+`- une séquence de lettres d’une langue quelconque.

Catégories détaillées :
Lu = uppercase
Ll = lowercase
Lt = titlecase
Lm = modifier letters
Lo = other letters
(L = Lu + Ll + Lt + Lm + Lo)

`\p{Han}`- caractères chinois.
Ces classes permettent de créer des regex multilingues, y compris pour traiter du texte en français, anglais, latin, chinois, etc.

3. `sed`
`sed` signifie Stream EDitor qui fonctionne dans le terminal.
C’est un outil en ligne de commande qui permet de :
lire un texte flux par flux; modifier ce texte automatiquement;
remplacer, supprimer, insérer, ou transformer des chaînes sans ouvrir un éditeur graphique.

1) Remplacement simple et correct (majuscule)
```cat pg16066.txt | grep moulins | sed 's/moulins/Moulins/'```
2) Test avec groupe capturant (exemple volontairement erroné)
```sed 's/moulins\(...\)/\1 Moulins/'```
- Résultat incorrect : \(...\) capture exactement trois caractères, ce qui déforme les mots (“Moulinsvent”, “Moulinsfoulon”, etc.).

4. git
`git fetch` plus stable et safety, récupère uniquement les métadonnées du dépôt distant.
Conflit classique entre modifications locales et modifications distantes:
`git stash` permet de sauvegarder temporairement les modifications non commit.
Enregistre les modifications dans une pile : ```git stash push -m "message"```
listez : ```git stash list```
Voir le contenu d’un stash : ```git stash show -p stash@{0}```#0是序号
Appliquer les modifications sauvegardées：
- sans supprimer: ```git stash apply stash@{0}```
- supprimer en meme temps: ```git stash pop stash@{0}```

## 24/11 Exercices
1. `git checkout` - annule toutes les modifications non commit et remet le dossier dans un depot.
`git reset` sert à déplacer HEAD vers un commit plus ancien. Il modifie l’historique de la branche.
Trois modes `git reset`:
--soft : déplace HEAD mais conserve les fichiers dans l’index.
--mixed (par défaut) : déplace HEAD et enlève les ajouts, mais garde les modifications dans le dossier.
--hard : déplace HEAD et supprime toutes les modifications.

```Untracked files:
    cheatsheet.css
    tableau-fr.html
```
`git stash -u`:-u permet de comprendre les untracked files


