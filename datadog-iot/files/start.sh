#!/bin/bash
if [ -z ${DD_API_KEY+x} ]
then
  echo "ERROR: DD_API_KEY IS NOT SET"
  exit 1
fi

ln -sf /var/run/balena.sock /var/run/docker.sock

echo "api_key: $DD_API_KEY" | cat - files/datadog.yaml > temp && mv temp files/datadog.yaml

DD_HOSTNAME=`hostname` datadog-agent -c files/datadog.yaml run
