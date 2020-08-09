#!/usr/bin/env bash

# Run puppet agent every 15 seconds
INTERVAL=15
CONTAINER_NAME=puppet

# Check that container is running
if [[ $(docker ps --filter "name=^/$CONTAINER_NAME$" --format '{{.Names}}') == $CONTAINER_NAME ]]; then
  # Install stdlib
  docker exec -it $CONTAINER_NAME puppet module install puppetlabs-stdlib
  while true;
    do
      docker exec -it $CONTAINER_NAME puppet agent -t
      sleep $INTERVAL
    done
fi