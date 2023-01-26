#! /usr/bin/bash

set -e
for namespace in $(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}'); do
    pods=$(kubectl get pods -n $namespace -o jsonpath='{.items[*].metadata.name}')
    for pod in $pods; do
      kubectl wait --for=jsonpath='{.status.phase}'=Running pod/$pod -n $namespace --timeout=0s 2> /dev/null || kubectl wait --for=jsonpath='{.status.phase}'=Succeeded pod/$pod -n $namespace --timeout=0s
    done
done