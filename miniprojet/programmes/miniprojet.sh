#!/usr/bin/bash

#Quand on utilise cat avant while dans une commande, la boucle while s’exécute dans un sous-processus. Les variables modifiées à l’intérieur (par exemple un compteur N) sont perdues à la fin de la boucle. Par contre, avec "done < "urls/fr.txt"", le fichier est lu par le processus principal(boucle WHILE), donc les variables gardent leurs valeurs après la boucle.

# Vérifier le nombre d'arguments
if [ $# -ne 1 ]; then
	echo "Erreur! Ce script a besoin d'un argument."
	exit
fi

urldir=$1
# Vérifier la validité du fichier
if [ ! -f $urldir ]; then
	echo "Erreur! $urldir n'est pas le bon fichier!"
	exit
fi

N=0
while read -r line;
do
	N=$(expr $N + 1) #le compteur de lignes
	code=$( curl -s -o /dev/null -w "%{http_code}" $line )  #le code HTTP de la page
	if [ -z "$code" ]; then # Si le code est vide (URL inaccessible), on lui attribue 000
		code=000
	fi
	encodage=$( curl -s -o /dev/null -w "%{content_type}" $line) #Content_type
	nbr_mot=$(lynx -dump -nolist $line 2>/dev/null| wc -w) # Compter le nombre de mots dans la page avec Lynx，`2>/dev/null` permet de cacher les messages d’erreur
	if [ "$code" -ne 200 ]; then
		echo -e "$N\t$line\tErreur: $code, il faudra faire qqch.\t$encodage\t$nbr_mot"
	else
		echo -e "$N\t$line\t$code\t$encodage\t$nbr_mot"
	fi

done <$urldir


