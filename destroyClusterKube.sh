#! /usr/bin/bash

vagrant destroy -f

kubectl config unset clusters.cce
kubectl config unset contexts.cce
kubectl config unset users.cce