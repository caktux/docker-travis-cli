#!/bin/bash

FINAL_IMAGE=jcfr/travis-cli

#
# If we are not running via boot2docker
#
if [ -z $DOCKER_HOST ]; then
    USER_IDS="-e BUILDER_UID=$( id -u ) -e BUILDER_GID=$( id -g ) -e BUILDER_USER=$( id -un ) -e BUILDER_GROUP=$( id -gn )"
fi

#
# Run the command in a container
#
tty -s && TTY_ARGS=-ti || TTY_ARGS=
docker run $TTY_ARGS --rm \
    -v ~/.travis:/travis \
    -v $PWD:/project \
    $USER_IDS \
    $FINAL_IMAGE "$@"

