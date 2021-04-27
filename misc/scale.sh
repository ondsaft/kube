#!/bin/bash

F=$1
D=$2
U=$3

kubectl apply -f $F

while (true)
do
    kubectl scale --replicas=$U -f $F
    echo -n "scaling up" 
    while [ $(kubectl get pods | grep Runn | wc -l) -lt $U ]
    do
        echo -n .
        sleep 10
    done
    date
    sleep 20

    kubectl scale --replicas=$D -f $F
    echo -n "scaling down" 
    while [ $(kubectl get pods | grep Term | wc -l) -gt $D ]
    do
        echo -n .
        sleep 10
    done
    date
    sleep 20
    
done