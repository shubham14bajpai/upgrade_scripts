#!/bin/bash

read -p "Please give the list of csp to be upgraded: " list

for name in $list; do
   echo "$name"
   sed "s|@csp_name@|$name|g" template/example-cstor-csp-upgrade-cr.yaml | kubectl apply -f -
done

sed "s|@label@|resource=cstorCSP|g" template/upgrade-job.yaml | sed "s|@job_name@|cstor-csp-upgrade|g" | kubectl apply -f -
