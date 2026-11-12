#!/usr/bin/env bash
# Installs the amber-crt theme into Herdr and (optionally) activates it.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
home="${HERDR_APP_HOME:-$HOME/.config/herdr-app}"
mkdir -p "$home/themes"
cp "$here/themes/amber-crt.json" "$home/themes/amber-crt.json"
echo "Installed: $home/themes/amber-crt.json"
if command -v herdr-app >/dev/null 2>&1 && herdr-app status >/dev/null 2>&1; then
  herdr-app do app.theme --name amber-crt >/dev/null && echo "Theme activated."
else
  echo "Herdr is not running; pick 'amber-crt' in Settings once it is."
fi
