#!/bin/bash

if [ ! -e "$1" ]; then
  echo "Error: File not found"
  exit 1
fi

mime=$(xdg-mime query filetype "$1")
ProgList=$(find /usr/local/bin /usr/bin -type f -perm -u+x | xargs -n1 basename)

Prog=$(echo "$Prog" | fzf --height=40%)
if [ ! -f "/usr/share/applications/${program}.desktop" ]; then
echo "[Desktop Entry]
Name=${Prog}
Exec=${Prog} %U
Type=Application
Terminal=false
Categories=Utility;
" > "/usr/share/applications/${Prog}.desktop"
fi
xdg-mime default "${Prog}.desktop" $mime
echo "Default application for $mime set to $Prog"
