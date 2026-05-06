#!/bin/bash

TITLE="FLOATING_NOTES" # The window title we set in ../wezterm/floating_notes.lua
HIDDEN_WS="HIDDEN"

AEROSPACE="/opt/homebrew/bin/aerospace"

# Find the floating notes window by title
WINDOW_ID=$($AEROSPACE list-windows --all --format '%{window-id}%{tab}%{window-title}' \
    | grep "	${TITLE}$" \
    | cut -f1 \
    | head -1)

# Check if the floating notes window is opened up, if not, open it and exit
if [ -z "$WINDOW_ID" ]; then
    env PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH" \
    open -n /Applications/WezTerm.app --args --config-file "$HOME/.config/wezterm/floating_notes.lua"
    # open -n /Applications/WezTerm.app --args --config-file "$HOME/.config/wezterm/floating_notes.lua"
    for _ in {1..20}; do
        WINDOW_ID=$($AEROSPACE list-windows --all --format '%{window-id}%{tab}%{window-title}' \
            | grep "	${TITLE}$" \
            | cut -f1 \
            | head -1)

        if [ -n "$WINDOW_ID" ]; then
            $AEROSPACE layout floating --window-id "$WINDOW_ID"
            $AEROSPACE focus --window-id "$WINDOW_ID"
            exit 0
        fi

        sleep 0.1
    done
    exit 0
fi

# Get workspace for the floating notes window
CURRENT_WS=$($AEROSPACE list-windows --all --format '%{window-id}%{tab}%{workspace}' \
    | grep "^${WINDOW_ID}	" \
    | cut -f2)

FOCUSED_WS=$($AEROSPACE list-workspaces --focused)

if [ "$CURRENT_WS" = "$FOCUSED_WS" ]; then
    # It is currently here -> Hide it
    $AEROSPACE move-node-to-workspace --window-id "$WINDOW_ID" "$HIDDEN_WS"
else
    # It is NOT here (either hidden or on another screen) -> Summon it
    $AEROSPACE move-node-to-workspace --window-id "$WINDOW_ID" "$FOCUSED_WS"
    $AEROSPACE focus --window-id "$WINDOW_ID"
fi
