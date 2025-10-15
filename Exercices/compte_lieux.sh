#!/usr/bin/bash

ANNEE=$1
MOIS=$2
Nbr=$3
grep -h -w "Location" ../../Exercice1/ann/$ANNEE/${ANNEE}_$MOIS*.ann \
| cut -f3- | sort | uniq -c | sort -nr | head -n $Nbr
