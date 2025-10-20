#!/usr/bin/bash
datadir="ann"

if [ $# -ne 2 ]; then
   echo "Erreur : Ce scripte a besoin 2 arguments."
   exit
fi

if [ ! -d $datadir ]; then
  echo "Erreur: $datadir n'est pas le bon dossier."
  exit
fi

ANNEE=$1
TYPE=$2
if [ $ANNEE != "2016" ] && [ $ANNEE != "2017" ] && [ $ANNEE != "2018" ] ; then #&& et; || ou
   echo "Erreur: ANNEE doit etre 2016/2017/2018."
   exit
fi

if [ -z $TYPE ]; then
  echo "Erreur: TYPE ne peut pas etre vide."
  exit
fi

cat "$datadir/$ANNEE/"* | grep -w "$TYPE" | wc -l

