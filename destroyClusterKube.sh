#! /usr/bin/bash

cd src
vagrant destroy -f

kubectl config unset clusters.cce
kubectl config unset contexts.cce
kubectl config unset users.cce