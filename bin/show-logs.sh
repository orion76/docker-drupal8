#!/usr/bin/env bash

set -e

# ---------------------------------------------------------------------------- #
#                                                                              #
# Show project services logs.                                                  #
#                                                                              #
# ---------------------------------------------------------------------------- #

WORKING_DIR="$(pwd)"

SCRIPT_PATH="$(dirname ${0})"
SCRIPT_PATH="$(cd ${SCRIPT_PATH} && pwd)"

PROJECT_ROOT="$(cd ${SCRIPT_PATH}/.. && pwd)"

hash docker-compose 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "docker-compose command not found."

  exit 1
fi

if [ ! -f "${PROJECT_ROOT}/.env" ]; then
  cp "${PROJECT_ROOT}/.env.sample" "${PROJECT_ROOT}/.env"
fi

cd "${PROJECT_ROOT}"

docker-compose -f docker-compose.yml logs

cd "${WORKING_DIR}"
