#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CURRENT_DIR="$(pwd)"



if [ "$SCRIPT_DIR" != "$CURRENT_DIR" ]; then
    echo "Moving to '$SCRIPT_DIR' to execute"
    cd $SCRIPT_DIR
fi

sudo docker build -t tiling-server .
