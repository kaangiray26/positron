#!/bin/sh
# This script installs Positron on Linux.

# Get the latest release from GitHub
# Repo: https://github.com/kaangiray26/positron
url=$(curl -s https://api.github.com/repos/kaangiray26/positron/releases/latest | grep "browser_download_url" | cut -d '"' -f 4)

# Download the release
wget -O positron.tar.gz $url

# Open the tar archive
tar -xzf positron.tar.gz

# Remove the tar archive
rm positron.tar.gz

# Make the script executable
chmod +x build

echo "Positron has been installed."
echo "Run ./build to build your projectb