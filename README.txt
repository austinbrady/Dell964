Dell 964 Printer Installer
=========================

Quick start (three steps)
-------------------------
1. Choose your Mac type: Intel or Apple Silicon (M-Series). Don't know? Apple menu → About This Mac → look at "Chip": Apple M1/M2/M3 etc. = M-Series; Intel = Intel.
2. Choose your macOS version (same window: e.g. "macOS 14.x Sonoma").
3. Open the matching folder below (intel or mseries, then your version). Double-click "Install Dell 964 Printer.command" and follow the prompts.

Directory layout (pick one folder)
---------------------------------
  intel/
    Monterey12.7.6   — macOS 12 Monterey
    Ventura13.7.8    — macOS 13 Ventura
    Sonoma14.8.4     — macOS 14 Sonoma
    Sequoia15.7.4    — macOS 15 Sequoia
    Tahoe26.3.2      — macOS 26 Tahoe

  mseries/
    Monterey12.7.6   — macOS 12 Monterey (Apple Silicon)
    Ventura13.7.8    — macOS 13 Ventura (Apple Silicon)
    Sonoma14.8.4     — macOS 14 Sonoma (Apple Silicon)
    Sequoia15.7.4    — macOS 15 Sequoia (Apple Silicon)
    Tahoe26.3.2      — macOS 26 Tahoe (Apple Silicon)

Prerequisite (one-time)
----------------------
Install Gutenprint before running the installer. If the installer says the driver is missing, do this and run it again.

  • Apple Silicon (M-Series):  brew install --cask gutenprint
  • Intel / other:            Search "Gutenprint for Mac" or MacPorts:  sudo port install gutenprint

Steps (inside your chosen folder)
---------------------------------
1. Put that folder somewhere easy to find (e.g. Desktop or Applications).
2. Connect the Dell 964 via USB and turn the printer on.
3. Double-click "Install Dell 964 Printer.command". Enter your password when asked.
4. When you see "Dell 964 is installed and ready," press Enter to close the window. You can print from any app.

Troubleshooting
---------------
• "Printer not found" — Connect the printer with USB, turn it on, then run the installer again.
• "Gutenprint driver not found" — Install Gutenprint (see Prerequisite above), then run the installer again.

---
This driver is provided as-is for personal use (e.g. home setup). Not affiliated with Dell.
