#!/bin/bash
# aryaos-heartbeat.sh - Sends periodic position CoT to TAK server.
#
# Copyright Sensors & Signals LLC https://www.snstac.com/
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

AOS_CONFIG="/etc/aryaos/aryaos-config.txt"
if [ -f "$AOS_CONFIG" ]; then
    # shellcheck source=aryaos-config.txt
    . "$AOS_CONFIG"
fi

# Require COT_URL and TLS cert to be configured
if [ -z "$COT_URL" ] || [ -z "$PYTAK_TLS_CLIENT_CERT" ]; then
    echo "COT_URL or PYTAK_TLS_CLIENT_CERT not configured, exiting."
    exit 1
fi

# Extract host:port from tls://host:port
TAK_HOST_PORT="${COT_URL#tls://}"

# Default static position if not configured
STATIC_LAT="${STATIC_LAT:-0.0}"
STATIC_LON="${STATIC_LON:-0.0}"

while true; do
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    STALE=$(date -u -d "+5 minutes" +"%Y-%m-%dT%H:%M:%SZ")

    cat << COTEOF | timeout 10 openssl s_client -connect "$TAK_HOST_PORT" \
        -cert "$PYTAK_TLS_CLIENT_CERT" \
        -key "$PYTAK_TLS_CLIENT_CERT" -quiet 2>/dev/null &
<?xml version="1.0" encoding="UTF-8"?>
<event version="2.0" uid="${NODE_ID}" type="a-f-G-U-C" time="${TIMESTAMP}" start="${TIMESTAMP}" stale="${STALE}" how="m-g">
  <point lat="${STATIC_LAT}" lon="${STATIC_LON}" hae="0" ce="9999999" le="9999999"/>
  <detail>
    <contact callsign="AryaOS-${NODE_ID:(-4)}"/>
    <__group name="Cyan" role="Team Member"/>
    <takv device="Raspberry Pi" platform="AryaOS" os="Linux" version="1.0"/>
  </detail>
</event>
COTEOF
    wait
    sleep 30
done
