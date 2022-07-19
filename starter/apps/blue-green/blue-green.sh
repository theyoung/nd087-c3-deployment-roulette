#!/bin/bash

DEPLOY=3

function green_deploy {
  NUM_OF_GREEN_PODS=$(kubectl get pods -n udacity | grep -c green)
  sleep 1
  echo "Green deployment of $NUM_OF_GREEN_PODS deploy successful!"
}

# Initialize Green pods
kubectl apply -f index_green_html.yml
kubectl apply -f green.yml

sleep 1
# Begin deploy wait
while [ $(kubectl get pods -n udacity | grep -c green) -lt 3 ]
do
  green_deploy
done

echo "Green $DEPLOY deployment successful"


