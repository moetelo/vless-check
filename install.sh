#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

echo "VLESS Checker Installer"
echo "======================="
echo

# Check dependencies
echo "Checking dependencies..."
missing_deps=()

if ! command -v xray &> /dev/null; then
    missing_deps+=("xray")
fi

if ! command -v jq &> /dev/null; then
    missing_deps+=("jq")
fi

if ! command -v curl &> /dev/null; then
    missing_deps+=("curl")
fi

if [ ${#missing_deps[@]} -gt 0 ]; then
    echo "Error: Missing required dependencies: ${missing_deps[*]}"
    echo
    echo "Please install them first:"
    for dep in "${missing_deps[@]}"; do
        echo "  - $dep"
    done
    exit 1
fi

echo "All dependencies found!"
echo

echo "Installing scripts to $INSTALL_DIR..."
install -D -m 755 vless-check vless-to-json -t "$INSTALL_DIR"

echo "Installation complete!"
echo

# Check if install dir is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "Warning: $INSTALL_DIR is not in your PATH"
    echo "Add this line to your ~/.bashrc or ~/.zshrc:"
    echo
    echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo
else
    echo "You can now use: vless-check 'vless://...'"
fi
