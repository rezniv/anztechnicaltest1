# This is a submission for ANZ technical Test 1 

# Notes

* The Dockerfile has been converted to a multistage build docker file keeping the final stage image as small as possible
* Updated the apk update and apk git scripts to go mod download which should download all required dependencies and use caching where possible
* One issue that I found with the original solution is that the web endpoint was bound to 127.0.0.1 which does not work when connecting from outside the container (e.g. from Host machine). I've updated this to 0.0.0.0 which should bind to all incoming traffic to the container as long as the port has been exposed

# Instructions

# build the image
docker build -t anztest1:1.0 . 

# run the image with web endpoint running inside container
docker run -p 8000:8000 anztest:1.0

# Use a browser on the host machine and browse to 127.0.0.1:8000/go

