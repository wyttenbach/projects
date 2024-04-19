#!/bin/bash
in="$1"
if [ ! -f "$in" ]; then
    echo "Not found (.txt required)"
    exit 1
fi
out="${in%%.txt}.pdf"
base64 -d -i "$in" -o "$out" && open "$out"
