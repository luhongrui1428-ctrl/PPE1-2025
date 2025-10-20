#!/usr/bin/bash
datadir="ann"

if [ $# -ne 3 ]; then
  echo "Erreur : Ce scripte a besoin 3 arguments."
  exit
fi

if [ ! -d $datadir ]; then
  echo "Erreur: $datadir n'est pas le bon dossier."
  exit
fi

ANNEE=$1
MOIS=$2
Nbr=$3

if [ $ANNEE != "2016" ] && [ $ANNEE != "2017" ] && [ $ANNEE != "2018" ] ; then
   echo "Erreur: ANNEE doit etre 2016/2017/2018."
   exit
fi

if [ "$MOIS" != "*" ] && ( [ "$MOIS" -lt 1 ] || [ "$MOIS" -gt 12 ] ); then
   echo "Erreur: MOIS doit être entre 1 et 12, ou *"
   exit
fi

if [ "$Nbr" -lt 1 ]; then
   echo "Erreur: NOMBRE doit être positif"
   exit
fi

grep -h -w "Location" $datadir/$ANNEE/$ANNEE_$MOIS*.ann \
| cut -f3- | sort | uniq -c | sort -nr | head -n $Nbr



