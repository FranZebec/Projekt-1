#!/bin/bash

# -----------------------------
# Backup script for AWS -> Oracle
# -----------------------------

# Source directory on AWS
SRC_DIR=~/projekt/backup/

# Destination server and directory on Oracle
DEST_SERVER=92.5.93.250
DEST_DIR=~/backup/

# Log file
LOG_DIR=~/projekt/logs
LOG_FILE="$LOG_DIR/backup.log"

# Directory for logs
mkdir -p "$LOG_DIR"

# Timestamp for logging
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Run pre-checks
/home/ubuntu/projekt/precheck.sh
if [ $? -ne 0 ]; then
    echo "Pre-check failed. Backup aborted."
    exit 1
fi

# Rsync command with --delete-after
rsync -avz --delete-after -e "ssh -i ~/.ssh/oracle_backup_key" "$SRC_DIR" "$DEST_SERVER":"$DEST_DIR"

# Check if rsync succeeded
if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Backup completed successfully." >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] Backup failed!" >> "$LOG_FILE"
fi

# Run post-checks
/home/ubuntu/projekt/postcheck.sh
if [ $? -ne 0 ]; then
    echo "Post-check failed. Please check logs."
    exit 1
fi
