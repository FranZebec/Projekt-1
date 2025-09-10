#!/bin/bash

# -----------------------------
# Post-check script for backup
# -----------------------------

DEST_SERVER=oracle-backup
DEST_DIR=~/backup/
LOG_FILE=~/projekt/logs/postcheck.log
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Starting post-checks..." >> "$LOG_FILE"

# Check if destination directory has files
FILE_COUNT=$(ssh "$DEST_SERVER" "find $DEST_DIR -type f | wc -l")

if [ "$FILE_COUNT" -gt 0 ]; then
    echo "[$TIMESTAMP] OK: Backup directory on $DEST_SERVER contains $FILE_COUNT files." >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] ERROR: No files found in backup directory on $DEST_SERVER!" >> "$LOG_FILE"
    exit 1
fi

echo "[$TIMESTAMP] Post-checks completed successfully." >> "$LOG_FILE"
exit 0

