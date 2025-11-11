#!/usr/bin/bash

#Quand on utilise cat avant while dans une commande, la boucle while s’exécute dans un sous-processus. Les variables modifiées à l’intérieur (par exemple un compteur N) sont perdues à la fin de la boucle. Par contre, avec "done < "urls/fr.txt"", le fichier est lu par le processus principal(boucle WHILE), donc les variables gardent leurs valeurs après la boucle.

# Vérifier le nombre d'arguments
if [ $# -ne 2 ]; then
	echo "Erreur! Ce script a besoin deux arguments: un fichier des URLS et un fichier de sortie."
	exit
fi

Fichier_URLS=$1
Fichier_Sortie=$2

# Vérifier la validité du fichier des URLS
if [ ! -f $Fichier_URLS ]; then
	echo "Erreur! $Fichier_URLS n'est pas le bon fichier!"
	exit
fi

N=0
while read -r line;
do
	N=$(expr $N + 1) #le compteur de lignes
	code_et_encodage=$(curl -I -L -s -w "%{http_code}\n%{content_type}\n" -o /dev/null "$line")

	code=$(echo "$code_et_encodage" | head -n 1)  #le code HTTP de la page
	#les variables doivent être entourées de guillemets ("$code_et_encodage")， sinon les retours à la ligne deviendra l'espace.

	if [ -z "$code" ]; then # Si le code est vide (URL inaccessible), on lui attribue 000
		code=000
	fi

	encodage=$(echo "$code_et_encodage"| tail -n 1 | grep -E -o "charset=.*" | cut -d= -f2 ) #Content_type

	if [ -z "$encodage" ]; then
        encodage="inconnu"
    fi

	nbr_mot=$(lynx -dump -nolist $line 2>/dev/null| wc -w) # Compter le nombre de mots dans la page avec Lynx，`2>/dev/null` permet de cacher les messages d’erreur

	echo -e "$N\t$line\t$code\t$encodage\t$nbr_mot" >> "$Fichier_Sortie"


done <$Fichier_URLS


