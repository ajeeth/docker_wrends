#!/bin/bash

# Stop on error
#set -e

export OPENDJ_JAVA_HOME=/usr/java/jdk1.8.0_151

if [[ -e /first_run ]]; then
  /scripts/first_run.sh
echo firstrun
fi

echo "Starting slapd..."
/opt/wrends/bin/start-ds --nodetach

