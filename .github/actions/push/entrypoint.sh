#!/usr/bin/env bash

set -eux

DOCKER_TAG="latest"
if [[ "${GITHUB_REF}" == "refs/tags"* ]]
then
    DOCKER_TAG=$(echo ${GITHUB_REF} | rev | cut -d/ -f1 | rev)
else
    DOCKER_TAG=$(echo ${GITHUB_REF} | rev | cut -d/ -f1 | rev)-$(echo ${GITHUB_SHA} | head -c7)
fi

docker login --username ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD} ${DOCKER_REGISTRY_URL}
docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
