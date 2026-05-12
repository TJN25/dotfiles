#!/bin/bash

TITLE="POPUP_TERMINAL"
HIDDEN_WS="HIDDEN"

AEROSPACE="/opt/homebrew/bin/aerospace"

WINDOW_ID=$($AEROSPACE list-windows --all --format '%{window-id}%{tab}%{window-title}' \
    | grep "	${TITLE}$" \
    | cut -f1 \
    | head -1)

if [ -z "$WINDOW_ID" ]; then
    env PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH" \
    open -n /Applications/WezTerm.app --args --config-file "$HOME/.config/wezterm/popup_terminal.lua"

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

CURRENT_WS=$($AEROSPACE list-windows --all --format '%{window-id}%{tab}%{workspace}' \
    | grep "^${WINDOW_ID}	" \
    | cut -f2)

FOCUSED_WS=$($AEROSPACE list-workspaces --focused)

if [ "$CURRENT_WS" = "$FOCUSED_WS" ]; then
    $AEROSPACE move-node-to-workspace --window-id "$WINDOW_ID" "$HIDDEN_WS"
else
    $AEROSPACE move-node-to-workspace --window-id "$WINDOW_ID" "$FOCUSED_WS"
    $AEROSPACE focus --window-id "$WINDOW_ID"
fi
