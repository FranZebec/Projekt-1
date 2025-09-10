SIMPLE BACKUP


WSL UBUNTU


AWS server hosts TeamSpeak6 server and has project with backup script on it



Oracle serer is only used for backup



Backup.sh script for backup of files inside project uses rsync --delete-after



Cron job made for 4 am every day to run backup.sh, log files put in /projekt/logs for cron and backup.sh
