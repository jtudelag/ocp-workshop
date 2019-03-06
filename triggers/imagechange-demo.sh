#!/bin/bash

set -x

MYREGISTRY="docker-registry-default.apps.madrid-b108.openshiftworkshop.com"
MYPROJECT="hello-openshift"

oc new-project "$MYPROJECT"

#podman login -p XXX -u XXX "$MYREGISTRY"

podman pull docker.io/openshift/hello-openshift:latest
podman tag docker.io/openshift/hello-openshift:latest "$MYREGISTRY/$MYPROJECT/hello-openshift:latest"
podman push --tls-verify=false "$MYREGISTRY/$MYPROJECT/hello-openshift:latest"

oc get is -n "$MYPROJECT"
oc get istag -n "$MYPROJECT"

oc create -f ./hello-openshift-imagechange.yaml

oc get rc  -n "$MYPROJECT"
oc get dc  -n "$MYPROJECT"
oc get pod  -n "$MYPROJECT"