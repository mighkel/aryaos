#!/bin/bash -e
# AryaOS 01-run-chroot.sh
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

# Install downloaded .deb packages
if [ -d /tmp/pytak-debs ] && [ "$(ls -A /tmp/pytak-debs/*.deb 2>/dev/null)" ]; then
    echo "Installing pytak .deb packages..."
    dpkg -i /tmp/pytak-debs/*.deb || apt-get install -f -y
    rm -rf /tmp/pytak-debs
else
    echo "Warning: No pytak .deb files found in /tmp/pytak-debs"
fi

# Add EnvironmentFile to service files and enable services
for service in adsbcot aiscot dronecot lincot; do
    if [ -f "/lib/systemd/system/${service}.service" ]; then
        grep -qxF "EnvironmentFile=/etc/aryaos/aryaos-config.txt" "/lib/systemd/system/${service}.service" || \
            sed --follow-symlinks -i -E -e "/\[Service\]/a EnvironmentFile=/etc/aryaos/aryaos-config.txt" "/lib/systemd/system/${service}.service"
        systemctl enable "${service}" || true
    fi
done
