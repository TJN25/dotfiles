#!/bin/bash

set -euo pipefail

CONFIG="/Users/nicth99p/bin/dotfiles/aerospace/aerospace.toml"
AEROSPACE="/opt/homebrew/bin/aerospace"

NORMAL_LINE="    outer.right =      [{ monitor.main = 12 }, 12]"
AGGRESSIVE_LINE="    outer.right =      [{ monitor.main = 900 }, 12]"

if grep -Fxq "$AGGRESSIVE_LINE" "$CONFIG"; then
    FROM_LINE="$AGGRESSIVE_LINE"
    TO_LINE="$NORMAL_LINE"
elif grep -Fxq "$NORMAL_LINE" "$CONFIG"; then
    FROM_LINE="$NORMAL_LINE"
    TO_LINE="$AGGRESSIVE_LINE"
else
    echo "Expected right padding line not found in $CONFIG:" >&2
    echo "$NORMAL_LINE" >&2
    echo "$AGGRESSIVE_LINE" >&2
    exit 1
fi

TMP_FILE="$(mktemp)"
awk -v from="$FROM_LINE" -v to="$TO_LINE" '{ print ($0 == from) ? to : $0 }' "$CONFIG" > "$TMP_FILE"

mv "$TMP_FILE" "$CONFIG"
"$AEROSPACE" reload-config
