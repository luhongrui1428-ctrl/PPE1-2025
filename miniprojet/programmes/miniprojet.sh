#!/usr/bin/bash

#Quand on utilise cat avant while dans une commande, la boucle while s’exécute dans un sous-processus. Les variables modifiées à l’intérieur (par exemple un compteur N) sont perdues à la fin de la boucle. Par contre, avec "done < "urls/fr.txt"", le fichier est lu par le processus principal(boucle WHILE), donc les variables gardent leurs valeurs après la boucle.

# Vérifier le nombre d'arguments
if [ $# -ne 1 ]; then
	echo "Erreur! Ce script a besoin d'un fichier des URLS."
	exit 1 #on quitte le script avec un code d'erreur. (!=0)
	fi

Fichier_URLS=$1

#Afficher le debut du fichier HTML.
#Il faut mettre \ qui permet d’afficher des guillemets dans le code HTML tout en conservant une chaîne de caractères valide pour Bash.

echo -e "
<head>
  <meta charset=\"UTF-8\">
  <title>Résultats du mini-projet</title>
  <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/versions/bulma-no-dark-mode.min.css\">
  <link rel=\"stylesheet\" href=\"../cheatsheet.css\">
</head>

<body>
<section class=\"hero is-primary\">
  <div class=\"hero-body\">
    <div class=\"container\">
      <h1 class=\"title\">Tableau du mini-projet</h1>
    </div>
  </div>
</section>

<section class=\"section\">
<div class=\"container\">
<table class=\"table is-striped is-fullwidth\">

<tr>
  <th>Numero</th>
  <th>URL</th>
  <th>Code_http</th>
  <th>Encodage</th>
  <th>Nombre de mots</th>
</tr>
"

# Vérifier la validité du fichier des URLS
if [ ! -f $Fichier_URLS ]; then
	echo "Erreur! $Fichier_URLS n'est pas le bon fichier!"
	exit 1
fi

N=0
while read -r line;
do
	N=$(expr $N + 1) #le compteur de lignes
	code_et_encodage=$(curl -s -i -L -w "%{http_code}\n%{content_type}\n" -o ./.data.tmp "$line")
	# Récupérer le code HTTP et le content-type, et enregistrer le corps de la réponse dans un fichier temporaire.

	code=$(echo "$code_et_encodage" | head -n 1)  #le code HTTP de la page
	#les variables doivent être entourées de guillemets ("$code_et_encodage")， sinon les retours à la ligne deviendra l'espace.

	if [ -z "$code" ]; then # Si le code est vide (URL inaccessible), on lui attribue 000
		code=000
	fi

	encodage=$(echo "$code_et_encodage"| tail -n 1 | grep -E -o "charset=\S+" | cut -d= -f2 ) #Content_type
	#"charset=.*" va s'accorder a tous les contenues apres "=", mais le \S+ ne correspnd au'a le contenue suivant sans espace

	if [ -z "$encodage" ]; then
        encodage="inconnu"
    fi

	nbr_mot=$(cat ./.data.tmp | lynx -dump -nolist $line -stdin | wc -w)
	# Compter le nombre de mots dans la page avec Lynx，on demande à Lynx de lire le HTML depuis le fichier temporaire(seul fois).

# inserer les donnees dans le tableau en html
	echo -e "
	<tr>
		<td>$N</td>
		<td>$line</td>
		<td>$code</td>
		<td>$encodage</td>
		<td>$nbr_mot</td>
	</tr>"


done <$Fichier_URLS

# Nettoyage du fichier temporaire
rm -f ./.data.tmp

# Balises de fermeture HTML (à mettre en dehors de la boucle)
echo "
</table>
</body>
</html>
"

