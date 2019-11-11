#!/bin/bash

read -rp "Enter from-version and to-version: " from to

read -p "Please give the namespace of application for which volumes are to be upgraded: " ns

list=$(kubectl get pvc -n $ns -o jsonpath='{range .items[*]}{@.spec.volumeName}:{end}')

for name in `echo $list | tr ":" " "`; do
   castype=$(kubectl get pv $name -o jsonpath="{.metadata.annotations.openebs\.io/cas-type}")
   echo $castype"/"$name
   if [[ $castype == "cstor" ]]; then
   		sed "s|@vol_name@|$name|g" template/example-cstor-volume-upgrade-cr.yaml | 
  		sed "s|@from@|$from|g" | sed "s|@to@|$to|g" |
   		sed "s|@label@|$ns|g" | kubectl apply -f -
   elif [[ $castype == "jiva" ]]; then
   		sed "s|@vol_name@|$name|g" template/example-jiva-volume-upgrade-cr.yaml | 
   		sed "s|@from@|$from|g" | sed "s|@to@|$to|g" |
   		sed "s|@label@|$ns|g" | kubectl apply -f -
   fi
done

job_name=$(echo "volume-upgrade-"$ns)

sed "s|@label@|resource=$ns|g" template/upgrade-job.yaml | sed "s|@job_name@|$job_name|g" | kubectl create -f -
