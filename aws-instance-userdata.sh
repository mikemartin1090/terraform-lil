#!/bin/bash

set -e
sudo apt-get update
sudo apt-get install --assume-yes jq

###################################################################
## Cache Region
###################################################################
# Make it so we don't have to lookup REGION all the time
# by caching it here
AWS_AVAILABILITY_ZONE=$(curl -s 'http://169.254.169.254/latest/meta-data/placement/availability-zone')
AWS_REGION_TO_CACHE=$(echo $AWS_AVAILABILITY_ZONE | sed 's/[a-z]$//')

STARDOCK_AWS_REGION_FILE="/var/stardock/run/config/STARDOCK_AWS_REGION_FILE"
mkdir -p "$(dirname ${STARDOCK_AWS_REGION_FILE})"
cat << EOF > "${STARDOCK_AWS_REGION_FILE}"
export STARDOCK_AWS_REGION="${AWS_REGION_TO_CACHE}"
EOF

touch /var/log/mikeWasHere.txt