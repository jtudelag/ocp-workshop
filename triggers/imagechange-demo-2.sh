#!/bin/bash

set -x

MYREGISTRY="docker-registry-default.apps.madrid-b108.openshiftworkshop.com"
MYPROJECT="hello-openshift"


podman pull docker.io/kubernetes/guestbook:latest
podman tag docker.io/kubernetes/guestbook:latest "$MYREGISTRY/$MYPROJECT/hello-openshift:latest"
podman push --tls-verify=false "$MYREGISTRY/$MYPROJECT/hello-openshift:latest"

oc get is -n "$MYPROJECT"
oc get istag -n "$MYPROJECT"

oc get rc  -n "$MYPROJECT"
oc get dc  -n "$MYPROJECT"
oc get pod  -n "$MYPROJECT"