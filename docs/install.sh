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

# Create virtual environment
python3 -m venv env

# Install dependencies
env/bin/python3 -m pip install --upgrade pip
env/bin/python3 -m pip install -r requirements.txt

echo "Positron installed successfully!"
echo "Run 'env/bin/positron --help' to get started."