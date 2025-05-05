#!/bin/bash

# --- INSTALLATION SCRIPT ---
# Check if sudo is available
if ! command -v sudo &> /dev/null; then
    echo "Error: sudo is required but not available"
    exit 1
fi

# Check and install dependencies
if ! command -v jq &> /dev/null; then
    echo "Installing required dependency: jq"
    if ! sudo apt-get update; then
        echo "Error: Failed to update package list"
        exit 1
    fi

    if ! sudo apt-get install -y jq; then
        echo "Error: Failed to install jq"
        exit 1
    fi

    # Verify installation
    if ! command -v jq &> /dev/null; then
        echo "Error: jq installation failed"
        exit 1
    fi
    echo "Successfully installed jq"
fi

# No need to check for root, we'll use sudo for specific commands
# Copy the script to /usr/local/bin with sudo
if ! sudo cp gemini.sh /usr/local/bin/gemini; then
    echo "Error: Failed to copy file to /usr/local/bin"
    exit 1
fi

# Make it executable with sudo
if ! sudo chmod +x /usr/local/bin/gemini; then
    echo "Error: Failed to make file executable"
    exit 1
fi

echo "Installation complete! You can now run the gemini command from anywhere."
