#!/bin/bash

# Install script for startup-commands service

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root or with sudo"
    exit 1
fi

# Copy service file to systemd directory
echo "Installing startup-commands.service to /etc/systemd/system/..."
cp startup/startup-commands.service /etc/systemd/system/

# Copy shell script to /usr/local/bin and make it executable
echo "Installing startup-commands.sh to /usr/local/bin/..."
cp startup/startup-commands.sh /usr/local/bin/
chmod +x /usr/local/bin/startup-commands.sh

# Reload systemd daemon
echo "Reloading systemd daemon..."
systemctl daemon-reload

echo "Installation complete!"
echo "To enable the service at startup, run: systemctl enable startup-commands.service"
echo "To start the service now, run: systemctl start startup-commands.service"
