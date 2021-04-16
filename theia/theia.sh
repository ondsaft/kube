#!/bin/bash

user=`id -u`
group=`id -g`
port="31555"

template=`cat "theia.template.yaml" | sed "s/{{userid}}/$user/g" | sed "s/{{groupid}}/$group/g" | sed "s/{{port}}/$port/g"`
echo "$template" | kubectl apply -f -