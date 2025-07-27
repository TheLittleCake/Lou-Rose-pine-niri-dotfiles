#!/bin/bash

STATUS=$(swaync-client -D | tr -d '[:space:]' | tr -d '%')

# Check if the cleaned-up output is "true" (Muted)
if [[ "$STATUS" == "true" ]]; then
    echo ""  # Muted (DND On)
else
    echo "󰂚"  # Active (DND Off)
fi
