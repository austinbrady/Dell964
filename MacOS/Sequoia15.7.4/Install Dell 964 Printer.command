#!/bin/bash
cd "$(dirname "$0")"

echo "Setting up Dell 964 printer..."
echo ""

./install_driver.sh

echo ""
echo "Press Enter to close this window."
read -r
