#!/usr/bin/bash

if [ $# -ne 0 ]; then
    echo "Erreur : Ce script ne nécessite aucun argument"
    exit
fi

echo "Nombre de Locations en 2016:"
count2016=$(cat "ann/2016/"* | grep "Location" | wc -l)
echo "$count2016"

echo "Nombre de Locations en 2017:"
count2017=$(cat "ann/2017/"* | grep "Location" | wc -l)
echo "$count2017"

echo "Nombre de Locations en 2018:"
count2018=$(cat "ann/2018/"* | grep "Location" | wc -l)
echo "$count2018"
