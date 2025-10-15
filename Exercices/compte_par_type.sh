#!/usr/bin/bash

ANNEE=$1
TYPE=$2
grep -w "$TYPE" "../../Exercice1/ann/$ANNEE/"*.ann | wc -l

