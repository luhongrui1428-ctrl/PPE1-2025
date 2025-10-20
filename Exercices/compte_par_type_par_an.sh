#!/usr/bin/bash

TYPE=$1

if [ -z $TYPE ]; then
  echo "Erreur: TYPE ne peut pas etre vide."
  exit
fi

echo "2016 : $(./compte_par_type.sh 2016 $TYPE)"
echo "2017 : $(./compte_par_type.sh 2017 $TYPE)"
echo "2018 : $(./compte_par_type.sh 2018 $TYPE)"
