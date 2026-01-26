#!/bin/bash -e
# AryaOS 00-run.sh - Download pytak .deb packages
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

# Create directory for downloaded .deb files
mkdir -p "${ROOTFS_DIR}/tmp/pytak-debs"

# Download pytak and related .deb packages
DEB_URLS=(
    "https://github.com/snstac/pytak/releases/latest/download/pytak_latest_all.deb"
    "https://github.com/snstac/takproto/releases/latest/download/takproto_latest_all.deb"
    "https://github.com/snstac/asyncinotify/releases/download/v4.0.9-4/python3-asyncinotify_4.0.9-1_all.deb"
    "https://github.com/snstac/aircot/releases/latest/download/aircot_latest_all.deb"
    "https://github.com/snstac/adsbcot/releases/latest/download/adsbcot_latest_all.deb"
    "https://github.com/snstac/aiscot/releases/latest/download/aiscot_latest_all.deb"
    "https://github.com/snstac/dronecot/releases/latest/download/dronecot_latest_all.deb"
    "https://github.com/snstac/lincot/releases/latest/download/lincot_latest_all.deb"
)

for url in "${DEB_URLS[@]}"; do
    echo "Downloading: ${url}"
    wget -q -L -P "${ROOTFS_DIR}/tmp/pytak-debs" "${url}" || {
        echo "Warning: Failed to download ${url}"
    }
done

echo "Downloaded .deb files:"
ls -la "${ROOTFS_DIR}/tmp/pytak-debs/"
