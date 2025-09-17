#!/bin/bash
# Local build test script

set -e

echo "=== Testing AryaOS build locally ==="

# Apply fixes
echo "=== Applying fixes ==="
sed -i 's|SHARED_FILES="$(pwd)/../shared_files"|SHARED_FILES="$(pwd)/shared_files"|' config
./scripts/fix-packages.sh

# Show configuration
echo "=== Build configuration ==="
cat config

echo "=== Starting build ==="
sudo ./build.sh

## Implementation Steps via GitHub Web Interface

### Step 1: Update the workflow file
1. Navigate to `.github/workflows/pi-gen.yml`
2. Click the edit (pencil) icon
3. Replace all content with the workflow code above
4. Commit the changes

### Step 2: Create the fix scripts
1. Click "Create new file" in your repo root
2. Type `scripts/fix-packages.sh` as the filename (GitHub will create the directory)
3. Paste the script content
4. Commit the file
5. Repeat for `scripts/setup-build-environment.sh`

### Step 3: Fix the config file
1. Navigate to `config` file
2. Click edit
3. Change the SHARED_FILES line as shown above
4. Commit the changes

### Step 4: Fix package files
1. Navigate to `stages/stage-base/00-install/00-packages`
2. Click edit
3. Fix any typos and remove problematic packages
4. Commit the changes

### Step 5: Test the build
1. After committing all changes, the workflow should trigger automatically
2. Check the Actions tab to monitor the build progress

## Summary of Changes

**Files Modified:**
- `.github/workflows/pi-gen.yml` - Updated build workflow
- `config` - Fixed SHARED_FILES path  
- `stages/stage-base/00-install/00-packages` - Fixed package names

**Files Created:**
- `scripts/fix-packages.sh` - Automated package fixing
- `scripts/setup-build-environment.sh` - Environment setup
- `test-build.sh` - Local testing script (optional)

The workflow will automatically:
- ✅ Set up the build environment with all required dependencies
- ✅ Apply all the package fixes you discovered
- ✅ Handle GPG keys and repository setup
- ✅ Build the AryaOS image
- ✅ Upload artifacts on success or failure

Once you've made these changes through the GitHub web interface, your build should work much more reliably!
