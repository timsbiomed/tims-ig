#!/usr/bin/env bash

set -x
set -e
set -u
set -o pipefail
set -o noclobber
shopt -s nullglob

# stack overflow #59895
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"

cd "${DIR}/.."

CONTAINER_NAME=tims_ig_local
TODAY=$(date +%Y-%m-%d)

# delete if older
if [[ "$(docker ps -a -q -f name=${CONTAINER_NAME})" ]]; then
  CONTAINER_DATE=$(docker inspect -f '{{ .Created }}' ${CONTAINER_NAME})
  CONTAINER_DATE=${CONTAINER_DATE%%T*}
  docker stop ${CONTAINER_NAME}
  if [[ ! $TODAY = ${CONTAINER_DATE}  ]]; then
    docker rm -f ${CONTAINER_NAME}
  fi
fi

# if not exists, create it
if [[ ! "$(docker ps -a -q -f name=${CONTAINER_NAME})" ]]; then
  docker pull sessaid/ig-publisher:latest
  docker create --name ${CONTAINER_NAME} --volume "$(pwd)/tims-ig:/ig"  sessaid/ig-publisher:latest -ig ig.ini
fi

docker start -a ${CONTAINER_NAME}
