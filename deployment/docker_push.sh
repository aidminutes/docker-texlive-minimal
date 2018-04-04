#!/bin/sh
# fail if any commands fails
set -e
# debug log
set -x

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
    -v `pwd`/deployment:/deployment \
    -e IMAGE_TAG=$(make version) \
    -e BX_IAM_API_KEY \
    --entrypoint bash reachlin/bluemix deployment/bluemix_deploy.sh