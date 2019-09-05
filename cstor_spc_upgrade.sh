#!/bin/bash

read -p "Please give the list of spc to be upgraded: " list

for name in $list; do
   echo "$name"
   sed "s|@spc_name@|$name|g" template/example-cstor-spc-upgrade-cr.yaml | kubectl apply -f -
done

sed "s|@label@|resource=cstorSPC|g" template/upgrade-job.yaml | sed "s|@job_name@|cstor-spc-upgrade|g" | kubectl apply -f -
