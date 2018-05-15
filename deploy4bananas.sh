#!/usr/bin/env bash

NAME=$1
NAMESPACE=$2
PACKAGE=$3

echo name : ${NAME}
echo namespace : ${NAMESPACE}
echo package : ${PACKAGE}

HOSTNAME=${PACKAGE}.${NAMESPACE}.bananaspliff.org

echo eval hostname : ${HOSTNAME}

helm install ${PACKAGE} --name ${NAME}-${NAMESPACE} --namespace  ${NAMESPACE} \
    --set ingress.enabled=true,ingress.hosts[0]=${HOSTNAME},ingress.tls[0].hosts[0]=${HOSTNAME},ingress.tls[0].secretName=${PACKAGE}-${NAMESPACE}-bananaspliff.org

