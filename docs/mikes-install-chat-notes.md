### Step 2: Install Dependencies
```

sudo apt update
sudo apt install -y \
    git \
    build-essential \
    coreutils \
    quilt \
    parted \
    qemu-user-static \
    debootstrap \
    zerofree \
    zip \
    dosfstools \
    libarchive-tools \
    libcap2-bin \
    grep \
    rsync \
    xz-utils \
    file \
    curl \
    bc \
    binfmt-support \
    ca-certificates \
    debian-archive-keyring \
    gnupg \
    lsb-release
```
### Step 2.5: Add Raspberry Pi Repositories and Architecture Support
```
# Add armhf architecture support (needed for RPi packages)
sudo dpkg --add-architecture armhf

# Add Raspberry Pi Foundation's GPG key
wget -qO- https://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/raspberrypi-archive-keyring.gpg

# Add the Raspberry Pi repository
echo "deb https://archive.raspberrypi.org/debian/ bookworm main" | sudo tee /etc/apt/sources.list.d/raspberrypi.list

# Update package lists to include RPi packages
sudo apt update

# Install Raspberry Pi specific packages
sudo apt install -y \
    raspberrypi-archive-keyring \
    rpi-eeprom \
    rpi-update \
    rpi-swap:armhf \
    rpi-loop-utils:armhf
```

### Step 3: Fix the GPG Key Issues
```

# Update the Debian keyring
sudo apt install -y debian-archive-keyring

# Import the missing keys manually
sudo gpg --homedir /etc/apt/trusted.gpg.d --no-default-keyring --keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131 78DBA3BC47EF2265 F8D2585B8783D481 54404762BBB6E853 BDE6D2B9216EC7A8

# Alternative method if the above doesn't work
wget -qO- https://ftp-master.debian.org/keys/archive-key-12.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian-archive-key-12.gpg
wget -qO- https://ftp-master.debian.org/keys/archive-key-12-security.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian-archive-key-12-security.gpg

# Update package lists
sudo apt update
```

### Step 4: Create a Working Directory
```
cd ~
mkdir aryaos-build
cd aryaos-build
```

### Step 5: Clone the Repositories
```
# Clone your fork of AryaOS
git clone https://github.com/[YOUR-USERNAME]/aryaos.git
cd aryaos

# Clone the standard pi-gen tool
git clone https://github.com/RPi-Distro/pi-gen.git
```

### Step 6: Examine the AryaOS Structure
```
# Look at the AryaOS structure
ls -la
```

Tell me what directories you see. We're looking for:

Custom stage directories (like stage4, stage5, etc.)
Configuration files
Any stages/ directory
Any scripts or documentation about the build process

### Step 7: Set up QEMU for ARM Emulation
```
# Look for configuration files
find . -name "*.yml" -o -name "*.yaml" -o -name "config*" -o -name "build*" -type f
```














