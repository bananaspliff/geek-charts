#!/usr/bin/env bash

NAME=$1
NAMESPACE=$2
PACKAGE=$3

echo name : ${NAME}
echo package : ${PACKAGE}
echo namespace : ${NAMESPACE}

HOSTNAME=${NAME}.${NAMESPACE}.bananaspliff.org

echo eval hostname : ${HOSTNAME}

helm install ${PACKAGE} --name ${PACKAGE} --namespace  ${NAMESPACE} \
    --set ingress.enabled=true,ingress.hosts[0]=${HOSTNAME},ingress.tls[0].hosts[0]=${HOSTNAME},ingress.tls[0].secretName=${NAME}-${NAMESPACE}-bananaspliff.org

