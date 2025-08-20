#!/bin/bash

set -euo pipefail

SNAP_NAME="otel-ebpf-profiler"
COUNT=0
MAX=6
INTERVAL=5

setup() {
    snapcraft pack -v
    sudo snap install ./*.snap --dangerous --classic
    sudo snap start "$SNAP_NAME"
}

verify() {

    # verify that the snap stays active for a while
    while [ "$COUNT" -lt "$MAX" ]; do
        state=$(sudo snap info "$SERVICE" | yq -r ".services.\"$SERVICE\"" | awk -F ', ' '{print $3}')
        if [[ "$state" != "active" ]]; then
            echo "❌ $SERVICE is not active (state=$state)"
            exit 1
        fi
        COUNT=$((COUNT + 1))
        sleep "$INTERVAL"
    done

    echo "✅ $SERVICE is active and running!"
    exit 0
}

setup
verify

