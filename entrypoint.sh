#!/bin/bash

set -eu


if [ -z "$INPUT_HOST" ] || [ -z "$INPUT_PORT" ] || [ -z "$INPUT_USERNAME" ] || [ -z "$INPUT_SCRIPT" ]; then
  echo "Missing required arguments"
  exit 1
fi

if [ -n "$INPUT_PRIVATE_KEY" ] && [ -n "$INPUT_PASSWORD" ]; then
  echo "Since you have entered Private Key and Password, Private Key will be used"
fi


if [ -n "$INPUT_PRIVATE_KEY" ]; then
  echo "$INPUT_PRIVATE_KEY" > /root/action/server_key
  chmod 600 /root/action/server_key

  ssh \
    -o ConnectTimeout=$INPUT_TIMEOUT \
    -o StrictHostKeyChecking=no \
    -i /root/action/server_key \
    -p $INPUT_PORT \
    $INPUT_USERNAME@$INPUT_HOST \
    "$INPUT_SCRIPT"
else
  sshpass -p "$INPUT_PASSWORD" ssh \
    -o ConnectTimeout=$INPUT_TIMEOUT \
    -o StrictHostKeyChecking=no \
    -p $INPUT_PORT \
    $INPUT_USERNAME@$INPUT_HOST \
    "$INPUT_SCRIPT"
fi


echo "Done!"
