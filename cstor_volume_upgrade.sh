#!/bin/bash

read -p "Please give the list of cstor volume to be upgraded: " list

for name in $list; do
   echo "$name"
   sed "s|@vol_name@|$name|g" template/example-cstor-volume-upgrade-cr.yaml | kubectl apply -f -
done

sed "s|@label@|resource=cstorVolume|g" template/upgrade-job.yaml | sed "s|@job_name@|cstor-volume-upgrade|g" | kubectl apply -f -
