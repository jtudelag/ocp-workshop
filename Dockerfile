FROM golang:1.11 AS build-env
ADD . /
RUN cd /hello-openshift &&  go build -tags netgo 
RUN ls /hello-openshift

FROM scratch
MAINTAINER Jorge Tudela <jtudelag@redhat.com>

LABEL io.k8s.description="Sample App" \
      io.k8s.display-name="hello-openshift"

COPY --from=build-env /hello-openshift/hello-openshift /hello-openshift
EXPOSE 8080 8888
USER 1001
ENTRYPOINT ["/hello-openshift"]
