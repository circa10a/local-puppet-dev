#!/usr/bin/env bash

# Run puppet agent every 15 seconds
INTERVAL=15
CONTAINER_NAME=puppet
MODULE_DIR=/etc/puppetlabs/code/environments/production/modules
PUPPETFILE=/etc/puppetlabs/code/environments/production/Puppetfile

# Check that container is running
if [[ $(docker ps --filter "name=^/$CONTAINER_NAME$" --format '{{.Names}}') == $CONTAINER_NAME ]]; then
  # Update package sources
  # Install deps
  docker exec -it $CONTAINER_NAME bash -c "r10k puppetfile install --verbose --puppetfile=$PUPPETFILE --moduledir=$MODULE_DIR"
  while true;
    do
      docker exec -it $CONTAINER_NAME puppet agent -t
      sleep $INTERVAL
    done
fi