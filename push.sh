#!/bin/bash -e
if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  set -x
  docker push sofwerx/nat:latest
  docker tag sofwerx/nat:latest sofwerx/nat:${TRAVIS_BUILD_NUMBER} 
  docker push sofwerx/nat:${TRAVIS_BUILD_NUMBER} 
fi
