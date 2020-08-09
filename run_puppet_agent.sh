#!/usr/bin/env bash

# run puppet agent every 15 seconds
INTERVAL=15
CONTAINER_NAME=puppet

if [[ $(docker ps --filter "name=^/$CONTAINER_NAME$" --format '{{.Names}}') == $CONTAINER_NAME ]]; then
  while true;
    do
      docker exec -it $CONTAINER_NAME puppet agent -t
      sleep $INTERVAL
    done
fi