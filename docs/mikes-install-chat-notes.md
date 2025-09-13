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
```
### Inline Result/Errors

```
ham@nd-eggs:~$ sudo apt update
Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://security.ubuntu.com/ubuntu jammy-security InRelease               
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease              
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease            
Ign:5 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages            
Ign:6 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:7 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:8 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:5 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:6 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:7 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Ign:8 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:5 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages 
Ign:6 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:10 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:11 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:12 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Ign:10 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:11 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Get:13 https://archive.raspberrypi.org/debian bookworm InRelease [55.0 kB]
Ign:12 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages       
Ign:10 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:7 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages     
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages 
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:8 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages        
Ign:5 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:11 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:12 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages       
Ign:6 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages        
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Ign:7 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages  
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:8 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages         
Ign:10 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages 
Ign:11 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:12 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:5 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:6 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Ign:7 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Ign:10 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:11 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:8 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Err:5 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
  404  Not Found [IP: 91.189.91.82 80]
Ign:6 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Get:20 https://archive.raspberrypi.org/debian bookworm/main amd64 Packages [282 kB]
Ign:12 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Err:9 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages      
  404  Not Found [IP: 91.189.91.83 80]
Ign:10 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:7 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages         
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:11 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages 
Ign:12 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:8 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Err:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
  404  Not Found [IP: 91.189.91.82 80]
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Get:21 https://archive.raspberrypi.org/debian bookworm/main i386 Packages [284 kB]
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Err:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
  404  Not Found [IP: 91.189.91.82 80]
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Get:22 https://archive.raspberrypi.org/debian bookworm/main armhf Packages [557 kB]
Fetched 1,177 kB in 2s (568 kB/s)                          
Reading package lists... Done
E: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/jammy/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.82 80]
E: Failed to fetch http://security.ubuntu.com/ubuntu/dists/jammy-security/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.83 80]
E: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/jammy-updates/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.82 80]
E: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/jammy-backports/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.82 80]
E: Some index files failed to download. They have been ignored, or old ones used instead.
ham@nd-eggs:~$
```

### Step 2.5 Continued: Install Available Packages
```
# Install Raspberry Pi specific packages (skip the armhf ones for now)
sudo apt install -y \
    raspberrypi-archive-keyring \
    rpi-eeprom \
    rpi-update

# Try to install the armhf packages - if they fail, that's okay
sudo apt install -y rpi-swap:armhf rpi-loop-utils:armhf || echo "armhf packages not available, will handle during build"
```

### Results
```
ham@nd-eggs:~$ sudo apt install -y \
    raspberrypi-archive-keyring \
    rpi-eeprom \
    rpi-update \
    rpi-swap:armhf \
    rpi-loop-utils:armhf
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package rpi-swap:armhf
E: Unable to locate package rpi-loop-utils:armhf
ham@nd-eggs:~$
```


### Step 3: Fix the GPG Key Issues
```

# Update the Debian keyring
sudo apt install -y debian-archive-keyring

# Import the missing keys manually
sudo gpg --homedir /etc/apt/trusted.gpg.d --no-default-keyring --keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131 78DBA3BC47EF2265 F8D2585B8783D481 54404762BBB6E853 BDE6D2B9216EC7A8
```

### Result
```
ham@nd-eggs:~$ sudo gpg --homedir /etc/apt/trusted.gpg.d --no-default-keyring --keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131 78DBA3BC47EF2265 F8D2585B8783D481 54404762BBB6E853 BDE6D2B9216EC7A8
gpg: WARNING: unsafe permissions on homedir '/etc/apt/trusted.gpg.d'
gpg: keybox '/etc/apt/trusted.gpg.d/debian-archive-keyring.gpg' created
gpg: /etc/apt/trusted.gpg.d/trustdb.gpg: trustdb created
gpg: key 254CF3B5AEC0A8F0: public key "Debian Security Archive Automatic Signing Key (12/bookworm) <ftpmaster@debian.org>" imported
gpg: key A48449044AAD5C5D: public key "Debian Security Archive Automatic Signing Key (11/bullseye) <ftpmaster@debian.org>" imported
gpg: key F8D2585B8783D481: public key "Debian Stable Release Key (12/bookworm) <debian-release@lists.debian.org>" imported
gpg: key 225629DF75B188BD: public key "Debian Archive Automatic Signing Key (13/trixie) <ftpmaster@debian.org>" imported
gpg: key B7C5D7D6350947F8: public key "Debian Archive Automatic Signing Key (12/bookworm) <ftpmaster@debian.org>" imported
gpg: Total number processed: 5
gpg:               imported: 5
ham@nd-eggs:~$
```

```
# Alternative method if the above doesn't work
wget -qO- https://ftp-master.debian.org/keys/archive-key-12.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian-archive-key-12.gpg
wget -qO- https://ftp-master.debian.org/keys/archive-key-12-security.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian-archive-key-12-security.gpg

# Update package lists
sudo apt update
```

### Result
```
ham@nd-eggs:~$ sudo apt update
Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:2 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Ign:5 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Hit:6 https://archive.raspberrypi.org/debian bookworm InRelease
Ign:7 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:8 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:10 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:5 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Ign:11 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:12 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:7 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:8 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:13 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:10 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:11 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:12 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:5 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Ign:7 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:8 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:13 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Ign:10 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:11 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:5 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Ign:12 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:13 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Ign:10 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:7 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:8 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:11 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:5 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
Ign:12 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:13 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Ign:10 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:7 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:8 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:11 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:12 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:13 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Err:5 http://security.ubuntu.com/ubuntu jammy-security/main armhf Packages
  404  Not Found [IP: 91.189.91.83 80]
Ign:7 http://security.ubuntu.com/ubuntu jammy-security/restricted armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Err:10 http://us.archive.ubuntu.com/ubuntu jammy/main armhf Packages
  404  Not Found [IP: 91.189.91.81 80]
Ign:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:8 http://security.ubuntu.com/ubuntu jammy-security/universe armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Ign:11 http://us.archive.ubuntu.com/ubuntu jammy/restricted armhf Packages
Ign:12 http://us.archive.ubuntu.com/ubuntu jammy/universe armhf Packages
Ign:13 http://us.archive.ubuntu.com/ubuntu jammy/multiverse armhf Packages
Ign:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse armhf Packages
Ign:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Err:14 http://us.archive.ubuntu.com/ubuntu jammy-updates/main armhf Packages
  404  Not Found [IP: 91.189.91.81 80]
Ign:15 http://us.archive.ubuntu.com/ubuntu jammy-updates/restricted armhf Packages
Ign:16 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe armhf Packages
Ign:17 http://us.archive.ubuntu.com/ubuntu jammy-updates/multiverse armhf Packages
Err:18 http://us.archive.ubuntu.com/ubuntu jammy-backports/main armhf Packages
  404  Not Found [IP: 91.189.91.81 80]
Ign:19 http://us.archive.ubuntu.com/ubuntu jammy-backports/universe armhf Packages
Reading package lists... Done
W: http://security.ubuntu.com/ubuntu/dists/jammy-security/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg are ignored as the file has an unsupported filetype.
W: http://security.ubuntu.com/ubuntu/dists/jammy-security/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/trustdb.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: http://us.archive.ubuntu.com/ubuntu/dists/jammy/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg are ignored as the file has an unsupported filetype.
W: http://us.archive.ubuntu.com/ubuntu/dists/jammy/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/trustdb.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: http://us.archive.ubuntu.com/ubuntu/dists/jammy-updates/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg are ignored as the file has an unsupported filetype.
W: http://us.archive.ubuntu.com/ubuntu/dists/jammy-updates/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/trustdb.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: http://us.archive.ubuntu.com/ubuntu/dists/jammy-backports/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg are ignored as the file has an unsupported filetype.
W: http://us.archive.ubuntu.com/ubuntu/dists/jammy-backports/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/trustdb.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: https://archive.raspberrypi.org/debian/dists/bookworm/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg are ignored as the file has an unsupported filetype.
W: https://archive.raspberrypi.org/debian/dists/bookworm/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/trustdb.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
E: Failed to fetch http://security.ubuntu.com/ubuntu/dists/jammy-security/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.83 80]
E: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/jammy/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.81 80]
E: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/jammy-updates/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.81 80]
E: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/jammy-backports/main/binary-armhf/Packages  404  Not Found [IP: 91.189.91.81 80]
E: Some index files failed to download. They have been ignored, or old ones used instead.
ham@nd-eggs:~$ 
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

### Result
```
ham@nd-eggs:~/aryaos-build/aryaos$ ls -a
.                   config      .gitignore     pi-gen            site.yml
..                  Dockerfile  inventory.yml  pyproject.toml    stages
build.sh            docs        LICENSE        README.md         test.sh
CHANGELOG.md        .git        Makefile       .readthedocs.yml  vars.yml
CODE_OF_CONDUCT.md  .github     mkdocs.yml     shared_files
ham@nd-eggs:~/aryaos-build/aryaos$
```
### Before Step 7 - Let's Examine the Build Configuration
```
# Look at the build configuration
cat config

# Look at what custom stages AryaOS provides
ls -la stages/

# Check the main build script
head -20 build.sh
```

### Step 7: Set up QEMU for ARM Emulation
```
# Look for configuration files
find . -name "*.yml" -o -name "*.yaml" -o -name "config*" -o -name "build*" -type f
```

### Step 8: Check for AryaOS-specific Build Configuration (Updated)
```
# Look for configuration files (you've already done this but let's see the output)
find . -name "*.yml" -o -name "*.yaml" -o -name "config*" -o -name "build*" -type f
```













