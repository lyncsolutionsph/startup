# Startup Commands Service

A systemd service that runs custom startup commands on system boot, designed for Raspberry Pi and other Linux systems.

## Version

Current version: **1.0.2**

## Overview

This service automatically executes startup commands when the system boots, with logging capabilities to track execution status. It's configured to run after the network is online.

## Features

- Automatic execution on system startup
- Network-aware (waits for network-online.target)
- Comprehensive logging to `/var/log/startup-commands.log`
- Easy to customize with your own startup commands

## Components

### Files

- **`startup/startup-commands.service`** - Systemd service unit file
- **`startup/startup-commands.sh`** - Shell script containing startup commands
- **`install.sh`** - Installation script
- **`version.txt`** - Current version number

### Default Commands

The service currently restarts the following services on boot:
- NetworkManager
- nftables
- dnsmasq

## Installation

### Prerequisites

- Linux system with systemd
- Root or sudo privileges

### Steps

1. Clone or download this repository:
   ```bash
   git clone <repository-url>
   cd startup
   ```

2. Run the installation script with sudo:
   ```bash
   sudo ./install.sh
   ```

   The install script will:
   - Copy `startup-commands.service` to `/etc/systemd/system/`
   - Copy `startup-commands.sh` to `/usr/local/bin/` and make it executable
   - Reload the systemd daemon
   - Remove the `.git` folder

3. Enable the service to run at startup:
   ```bash
   sudo systemctl enable startup-commands.service
   ```

4. (Optional) Start the service immediately without rebooting:
   ```bash
   sudo systemctl start startup-commands.service
   ```

## Customization

To customize the startup commands:

1. Edit `/usr/local/bin/startup-commands.sh` after installation
2. Add or modify commands using the `run_cmd` function:
   ```bash
   run_cmd "your-command-here" "Description of what it does"
   ```
3. Reload and restart the service:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl restart startup-commands.service
   ```

## Usage

### Check Service Status
```bash
sudo systemctl status startup-commands.service
```

### View Logs
```bash
sudo cat /var/log/startup-commands.log
```

### Enable/Disable Service
```bash
# Enable (run at startup)
sudo systemctl enable startup-commands.service

# Disable (don't run at startup)
sudo systemctl disable startup-commands.service
```

### Manually Start/Stop Service
```bash
# Start
sudo systemctl start startup-commands.service

# Stop
sudo systemctl stop startup-commands.service
```

## Troubleshooting

### Service fails to start
Check the system journal for errors:
```bash
sudo journalctl -u startup-commands.service -n 50
```

### Commands not executing
1. Verify the script has execute permissions:
   ```bash
   ls -l /usr/local/bin/startup-commands.sh
   ```
2. Check the log file for errors:
   ```bash
   sudo tail -f /var/log/startup-commands.log
   ```

### Service not running at boot
Ensure the service is enabled:
```bash
sudo systemctl is-enabled startup-commands.service
```

## Uninstallation

To remove the service:

```bash
# Stop and disable the service
sudo systemctl stop startup-commands.service
sudo systemctl disable startup-commands.service

# Remove the files
sudo rm /etc/systemd/system/startup-commands.service
sudo rm /usr/local/bin/startup-commands.sh

# Reload systemd
sudo systemctl daemon-reload
```

## License

This project is provided as-is for use and modification.

## Contributing

Feel free to modify and adapt this service for your specific needs.
