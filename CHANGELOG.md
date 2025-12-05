# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] - 2025-12-05

### Added
- Installation script (`install.sh`) for automated deployment
- Version tracking file (`version.txt`)
- Comprehensive README documentation
- Automatic cleanup of repository files after installation

### Changed
- Installation process now automated with single script execution
- Repository files are automatically removed after successful installation

### Fixed
- N/A

## [1.0.1] - Previous Release

### Added
- Systemd service unit file for startup commands
- Shell script with logging functionality
- Support for NetworkManager, nftables, and dnsmasq service restarts

## [1.0.0] - Initial Release

### Added
- Basic startup commands service
- Logging to `/var/log/startup-commands.log`
- Network-aware service execution
