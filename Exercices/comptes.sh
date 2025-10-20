#!/usr/bin/bash

datadir="ann"
if [ $# -ne 0 ]; then
    echo "Erreur : Ce script ne nécessite aucun argument"
    exit
fi

for annee in 2016 2017 2018
do
    if [ -d "$datadir/$annee" ]; then
        count=$(cat "$datadir/$annee/"* | grep "Location" | wc -l)
        echo "Nombre de Locations en $annee: $count"
    else
        echo "$datadir/$annee n'est pas le bon dossier"
        exit
    fi
done
