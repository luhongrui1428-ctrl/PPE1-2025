#!/usr/bin/bash

echo "Nombre de Locations en 2016:"
count2016=$(grep "Location" ann/2016/2016*.ann | wc -l)
echo "$count2016"

echo "Nombre de Locations en 2017:"
count2017=$(grep "Location" ann/2017/2017*.ann | wc -l)
echo "$count2017"

echo "Nombre de Locations en 2018:"
count2018=$(grep "Location" ann/2018/2018*.ann | wc -l)
echo "$count2018"
