#!/bin/bash
# 

read -p "Please give the list of jiva volume to be upgraded: " list

for name in $list; do
   echo "$name"
   sed "s|@vol_name@|$name|g" template/example-jiva-vol-upgrade-cr.yaml | kubectl apply -f -
done

sed "s|@label@|resource=jivaVolume|g" template/upgrade-job.yaml | sed "s|@job_name@|jiva-volume-upgrade|g" | kubectl apply -f -
