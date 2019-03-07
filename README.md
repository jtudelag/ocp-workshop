# ocp-workshop

## Build hello-openshift image, built using multi-stage
sudo podman build -t ms:latest .

### Squashing layers

sudo podman build --squash -t ms:sq .

## Run the image
sudo podman run -d -P localhost/ms:latest
