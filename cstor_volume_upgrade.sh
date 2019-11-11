#!/bin/bash

read -rp "Enter from-version and to-version: " from to

read -rp "Please give the list of cstor volume to be upgraded: " list

label="cstorVolume-"$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 5)

for name in $list; do
   echo "$name"
   sed "s|@vol_name@|$name|g" template/example-cstor-volume-upgrade-cr.yaml | 
   sed "s|@from@|$from|g" | sed "s|@to@|$to|g" |
   sed "s|@label@|$label|g" | kubectl apply -f -
done

sed "s|@label@|resource=$label|g" template/upgrade-job.yaml | 
sed "s|@job_name@|cstor-volume-upgrade|g" | 
sed "s|@to@|$to|g" | kubectl create -f -
