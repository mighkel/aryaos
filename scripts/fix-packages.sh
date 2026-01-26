#!/bin/bash
# Fix problematic packages across all stages

echo "=== Fixing package lists across all stages ==="

# Fix stage-base packages specifically
if [ -f "stages/stage-base/00-install/00-packages" ]; then
    echo "=== Fixing stage-base packages ==="
    
    # Fix typos and remove problematic packages
    sed -i 's/^arh-test$/arch-test/' stages/stage-base/00-install/00-packages
    sed -i '/^linux-headers-generic$/d' stages/stage-base/00-install/00-packages
    sed -i '/^raspberrypi-kernel-headers$/d' stages/stage-base/00-install/00-packages
    sed -i '/^raspberrypi-linux-headers$/d' stages/stage-base/00-install/00-packages
    sed -i '/^comitup$/d' stages/stage-base/00-install/00-packages
    
    # Remove duplicates and empty lines
    awk '!seen[$0]++' stages/stage-base/00-install/00-packages > /tmp/packages.tmp
    mv /tmp/packages.tmp stages/stage-base/00-install/00-packages
    sed -i '/^[[:space:]]*$/d' stages/stage-base/00-install/00-packages
    
    echo "=== Fixed stage-base package list ==="
    cat stages/stage-base/00-install/00-packages
fi

# Fix all other package files
echo "=== Fixing other stage package files ==="
find stages/ -name "*packages*" -type f -exec sed -i '/^rpi-swap$/d' {} \;
find stages/ -name "*packages*" -type f -exec sed -i '/^rpi-loop-utils$/d' {} \;
find stages/ -name "*packages*" -type f -exec sed -i '/^rpi-usb-gadget$/d' {} \;
find stages/ -name "*packages*" -type f -exec sed -i '/^linux-headers-.*$/d' {} \;
find stages/ -name "*packages*" -type f -exec sed -i '/^raspberrypi-kernel-headers$/d' {} \;
find stages/ -name "*packages*" -type f -exec sed -i '/^comitup$/d' {} \;

# Remove empty lines from all package files
find stages/ -name "*packages*" -type f -exec sed -i '/^[[:space:]]*$/d' {} \;

echo "=== Package fixes applied ==="
