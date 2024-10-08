#!/bin/sh
# This script installs Positron on Linux.
echo "Installing Positron..."

# Get the latest release from GitHub
# Repo: https://github.com/kaangiray26/positron
url=$(curl -s https://api.github.com/repos/kaangiray26/positron/releases/latest | grep "browser_download_url" | cut -d '"' -f 4)
echo "Downloading from $url"

# Download the release
wget -q -O positron.tar.gz $url

# Open the tar archive
tar -xzf positron.tar.gz

# Remove the tar archive
rm -f positron.tar.gz

# Create virtual environment
python3 -m venv env

# Install dependencies
env/bin/python3 -m pip -q install --upgrade pip
env/bin/python3 -m pip -q install -r requirements.txt

echo "Positron installed successfully!"
echo "Run 'env/bin/positron --help' to get started."