#!/bin/sh
# fail if any commands fails
set -e
# debug log
set -x

bx login --apikey $BX_IAM_API_KEY -a https://api.eu-de.bluemix.net

bx cr namespace-add aidminutes

bx cr login

docker push registry.eu-de.bluemix.net/aidminutes/docker-texlive-minimal-amd64:$IMAGE_TAG