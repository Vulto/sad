#!/bin/bash

# Check if file exists
if [ ! -e "$1" ]; then
  echo "Error: File not found"
  exit 1
fi

# Get the mime type of the file
mime=$(xdg-mime query filetype "$1")

# List all programs in /usr/local/bin and /usr/bin
ProgList=$(find /usr/local/bin /usr/bin -type f -perm -u+x | xargs -n1 basename)

# Use fzf to present a list of programs to the user
Prog=$(echo "$Prog" | fzf --height=40%)

# Check if the selected program has a .desktop file
if [ ! -f "/usr/share/applications/${program}.desktop" ]; then
  # Create a .desktop file for the selected program
  echo "[Desktop Entry]
Name=${Prog}
Exec=${Prog} %U
Type=Application
Terminal=false
Categories=Utility;
" > "/usr/share/applications/${Prog}.desktop"
fi

# Set the selected program as the default for the mime type
xdg-mime default "${Prog}.desktop" $mime
echo "Default application for $mime set to $Prog"
