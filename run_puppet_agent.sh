#!/usr/bin/env bash

# Run puppet agent every 15 seconds
INTERVAL=15
CONTAINER_NAME=puppetserver
MODULE_DIR=/etc/puppetlabs/code/environments/production/modules
PUPPETFILE=/etc/puppetlabs/code/environments/production/Puppetfile

# Suppress 'What's New' messages
export DOCKER_CLI_HINTS=false

# Check that container is running
if docker container inspect "$CONTAINER_NAME" > /dev/null 2>&1; then
  # Update package sources
  # Install deps
  docker exec -it $CONTAINER_NAME bash -c "r10k puppetfile install --verbose --puppetfile=$PUPPETFILE --moduledir=$MODULE_DIR"
  while true;
    do
      docker exec -it $CONTAINER_NAME puppet agent -t
      sleep $INTERVAL
    done
else
  echo "'${CONTAINER_NAME}' container is not running. Run 'docker compose up' and try again"
  exit 1
fi
