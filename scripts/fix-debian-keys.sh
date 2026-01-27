#!/bin/bash
# fix-debian-keys.sh
# Patches pi-gen's stage0/00-configure-apt/00-run.sh to download and install
# the Debian archive keyring into the rootfs before apt-get update runs.
# Required because the arm64 branch expects trixie but we build bookworm,
# and the Ubuntu host doesn't have Debian's signing keys.

SCRIPT="pi-gen/stage0/00-configure-apt/00-run.sh"

if [ ! -f "$SCRIPT" ]; then
    echo "Warning: $SCRIPT not found, skipping keyring fix"
    exit 0
fi

# Create a patched version that installs the Debian keyring before anything else
TMPFILE=$(mktemp)
head -1 "$SCRIPT" > "$TMPFILE"
cat >> "$TMPFILE" << 'KEYFIX'

# Fix: download and install Debian archive keyring into rootfs for bookworm
echo "=== Installing Debian archive keyring into rootfs ==="
KEYRING_DEB="/tmp/debian-archive-keyring.deb"
wget -q -O "$KEYRING_DEB" "http://ftp.us.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2023.3+deb12u2_all.deb" || \
wget -q -O "$KEYRING_DEB" "http://deb.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2023.3+deb12u2_all.deb" || \
wget -q -O "$KEYRING_DEB" "http://deb.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2023.4_all.deb" || true
if [ -f "$KEYRING_DEB" ] && [ -s "$KEYRING_DEB" ]; then
    dpkg-deb -x "$KEYRING_DEB" "${ROOTFS_DIR}/"
    # The arm64 branch sources use .pgp extension but the bookworm keyring ships .gpg
    if [ -f "${ROOTFS_DIR}/usr/share/keyrings/debian-archive-keyring.gpg" ] && \
       [ ! -f "${ROOTFS_DIR}/usr/share/keyrings/debian-archive-keyring.pgp" ]; then
        cp "${ROOTFS_DIR}/usr/share/keyrings/debian-archive-keyring.gpg" \
           "${ROOTFS_DIR}/usr/share/keyrings/debian-archive-keyring.pgp"
    fi
    echo "Installed Debian archive keyring into rootfs"
    ls -la "${ROOTFS_DIR}/usr/share/keyrings/" | grep debian || true
    rm -f "$KEYRING_DEB"
else
    echo "ERROR: Could not download Debian archive keyring"
fi
KEYFIX
tail -n +2 "$SCRIPT" >> "$TMPFILE"
mv "$TMPFILE" "$SCRIPT"
chmod +x "$SCRIPT"

echo "Patched $SCRIPT with keyring fix"
echo "=== First 25 lines of patched script ==="
head -25 "$SCRIPT"
