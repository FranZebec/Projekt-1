#!/bin/bash

# -----------------------------
# Pre-check script for backup
# -----------------------------

SRC_DIR=~/projekt/backup/
DEST_SERVER=oracle-backup
DEST_DIR=~/backup/
LOG_FILE=~/projekt/logs/precheck.log
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Starting pre-checks..." >> "$LOG_FILE"

# Check if source directory exists
if [ ! -d "$SRC_DIR" ]; then
    echo "[$TIMESTAMP] ERROR: Source directory $SRC_DIR does not exist!" >> "$LOG_FILE"
    exit 1
else
    echo "[$TIMESTAMP] OK: Source directory exists." >> "$LOG_FILE"
fi

# Check if rsync is installed
if ! command -v rsync &> /dev/null; then
    echo "[$TIMESTAMP] ERROR: rsync not installed!" >> "$LOG_FILE"
    exit 1
else
    echo "[$TIMESTAMP] OK: rsync is installed." >> "$LOG_FILE"
fi

# Check SSH connectivity to Oracle server
if ssh -o BatchMode=yes -o ConnectTimeout=5 "$DEST_SERVER" "echo 2>&1" && [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] OK: SSH connection to $DEST_SERVER works." >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] ERROR: Cannot connect to $DEST_SERVER via SSH!" >> "$LOG_FILE"
    exit 1
fi

echo "[$TIMESTAMP] Pre-checks completed successfully." >> "$LOG_FILE"
exit 0

