#!/bin/sh


# Usage: ci-build-helper.sh <SUFFIX>

set -eux

docker build --tag "${IMAGE}:${1}" \
    --build-arg FROM_IMAGE="${IMAGE}:${ODOO_VERSION}" \
    "${FROMREPO}#master:images/${1}"
docker push "${IMAGE}:${1}" &> /dev/null
