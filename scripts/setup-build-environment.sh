#!/bin/bash
# Setup script for build environment dependencies

set -e

echo "=== Setting up AryaOS build environment ==="

# Update Debian keyring
sudo apt-get update
sudo apt-get install -y debian-archive-keyring

# Import missing GPG keys
echo "=== Importing GPG keys ==="
sudo gpg --homedir /etc/apt/trusted.gpg.d --no-default-keyring \
    --keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg \
    --keyserver keyserver.ubuntu.com \
    --recv-keys 6ED0E7B82643E131 78DBA3BC47EF2265 F8D2585B8783D481 54404762BBB6E853 BDE6D2B9216EC7A8 || true

# Alternative method for additional keys
wget -qO- https://ftp-master.debian.org/keys/archive-key-12.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian-archive-key-12.gpg || true
wget -qO- https://ftp-master.debian.org/keys/archive-key-12-security.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian-archive-key-12-security.gpg || true

# Add armhf architecture support (for Raspberry Pi compatibility)
sudo dpkg --add-architecture armhf

# Add Raspberry Pi repository (optional, might help with some packages)
wget -qO- https://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/raspberrypi-archive-keyring.gpg || true
echo "deb https://archive.raspberrypi.org/debian/ bookworm main" | sudo tee /etc/apt/sources.list.d/raspberrypi.list || true

# Update package lists
sudo apt-get update

echo "=== Build environment setup complete ==="
