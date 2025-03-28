#!/bin/bash

set -e

BUILDER_NAME="builder33"

if ! docker buildx inspect "$BUILDER_NAME" >/dev/null 2>&1; then
  docker buildx create --name "$BUILDER_NAME" --driver docker-container --use
fi

docker buildx inspect --bootstrap
docker buildx ls
