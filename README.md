# ocp-workshop

## Build hello-openshift image, built using multi-stage
sudo podman build -t ms:latest .

## Run the image
sudo podman run -d -P localhost/ms:latest
