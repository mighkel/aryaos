#!/bin/bash
# fix-debian-keys.sh
# Patches pi-gen's stage0/00-configure-apt/00-run.sh to copy Debian archive
# keyring into the rootfs before apt-get update runs.
# Required because the arm64 branch expects trixie but we build bookworm.

SCRIPT="pi-gen/stage0/00-configure-apt/00-run.sh"

if [ ! -f "$SCRIPT" ]; then
    echo "Warning: $SCRIPT not found, skipping keyring fix"
    exit 0
fi

# Create a patched version that copies the keyring before anything else
TMPFILE=$(mktemp)
head -1 "$SCRIPT" > "$TMPFILE"
cat >> "$TMPFILE" << 'KEYFIX'

# Fix: copy Debian archive keyring into rootfs for bookworm
if [ -f /usr/share/keyrings/debian-archive-keyring.gpg ]; then
    install -m 0755 -d "${ROOTFS_DIR}/usr/share/keyrings/"
    install -m 0755 -d "${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"
    cp /usr/share/keyrings/debian-archive-keyring.gpg "${ROOTFS_DIR}/usr/share/keyrings/"
    cp /usr/share/keyrings/debian-archive-keyring.gpg "${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"
    echo "Copied Debian archive keyring into rootfs"
fi
KEYFIX
tail -n +2 "$SCRIPT" >> "$TMPFILE"
mv "$TMPFILE" "$SCRIPT"
chmod +x "$SCRIPT"

echo "Patched $SCRIPT with keyring fix"
echo "=== First 20 lines of patched script ==="
head -20 "$SCRIPT"
