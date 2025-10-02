#!/bin/bash

DOCKER_IMAGE=nialljb/mini-local
docker run -it --entrypoint bash --rm --cpus="6" \
    -v /Users/nbourke/GD/atom/unity/fw-gears/local/local-minimorph/session:/app/input \
    -v /Users/nbourke/GD/atom/unity/fw-gears/local/local-minimorph/session:/app/output \
    -v /Users/nbourke/GD/atom/unity/fw-gears/local/local-minimorph/app:/app \
    -e AGE="3M" \
    $DOCKER_IMAGE

    