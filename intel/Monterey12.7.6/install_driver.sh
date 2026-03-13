#!/bin/bash
# Install Dell 964 printer with Gutenprint driver.
# To run: double-click "Install Dell 964 Printer.command" (recommended),
# or in Terminal: chmod +x install_driver.sh && ./install_driver.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PPD="${SCRIPT_DIR}/dell964.ppd"
PRINTER_NAME="Dell_964"
echo "Installing Dell 964 driver for Intel Mac..."

# 1. Check Gutenprint filter (macOS path)
GUTENPRINT_FILTER="/usr/libexec/cups/filter/rastertogutenprint.5.3"
if [[ ! -x "$GUTENPRINT_FILTER" ]]; then
  echo "The Gutenprint driver was not found."
  echo "Please install it first (e.g. search for \"Gutenprint for Mac\" or install via MacPorts: sudo port install gutenprint)."
  exit 1
fi

# 2. Check PPD exists
if [[ ! -r "$PPD" ]]; then
  echo "The driver file dell964.ppd was not found next to this script."
  echo "Please keep the installer folder intact and try again."
  exit 1
fi

# 3. Find Dell 964 via USB (lpinfo -v)
# Match usb:// lines that suggest Dell 964 / Lexmark P4300 / Machine Type 4419
URI=""
while IFS= read -r line; do
  if [[ "$line" == usb://* ]]; then
    # Prefer lines that mention Dell, 964, 4419, Lexmark, or P4300
    if [[ "$line" =~ (Dell|964|4419|Lexmark|P4300) ]]; then
      URI="$line"
      break
    fi
    # If no match yet, take first USB printer (fallback for generic USB IDs)
    if [[ -z "$URI" ]]; then
      URI="$line"
    fi
  fi
done < <(lpinfo -v 2>/dev/null || true)

# lpinfo may print "URI description"; use only the URI for lpadmin
[[ -n "$URI" ]] && URI="${URI%% *}"

# If we only had a fallback, clear it unless it's the only USB device and we have no other hint
if [[ -n "$URI" && ! "$URI" =~ (Dell|964|4419|Lexmark|P4300) ]]; then
  # Keep as fallback if there's only one USB printer
  count=$(lpinfo -v 2>/dev/null | grep -c "usb://" || true)
  if [[ "$count" -gt 1 ]]; then
    URI=""
  fi
fi

if [[ -z "$URI" ]]; then
  echo "Dell 964 was not found."
  echo "Please connect the printer with a USB cable, turn it on, and run this installer again."
  exit 1
fi

# 4. Add printer (elevation required on macOS)
echo "Your Mac will ask for your password to add the printer."
if ! sudo lpadmin -p "$PRINTER_NAME" -v "$URI" -P "$PPD" -E 2>&1; then
  echo "Could not add the printer. If you cancelled the password, run the installer again and enter your password when asked."
  exit 1
fi

echo ""
echo "Dell 964 is installed and ready. You can print from any app."
