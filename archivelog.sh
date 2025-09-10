#!/bin/bash

# Directories
LOG_DIR=~/projekt/logs
ARCHIVE_DIR="$LOG_DIR/archive"

# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Find logs older than 7 days, move them to archive, and compress
find "$LOG_DIR" -type f -name "*.log" -mtime +7 | while read LOGFILE; do
    BASENAME=$(basename "$LOGFILE" .log)
    gzip -c "$LOGFILE" > "$ARCHIVE_DIR/${BASENAME}_${TIMESTAMP}.log.gz"
    rm "$LOGFILE"
done

# Optional: delete compressed logs older than 30 days
find "$ARCHIVE_DIR" -type f -name "*.gz" -mtime +30 -delete

