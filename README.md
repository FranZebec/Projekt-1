SIMPLE BACKUP


WSL UBUNTU


AWS server hosts TeamSpeak6 server and has project with backup script on it



Oracle serer is only used for backup



Backup.sh script for backup of files inside project uses rsync --delete-after



Cron job made for 4 am every day to run backup.sh, log files put in /projekt/logs for cron and backup.sh




/home
 ├── ts3                     <-- TeamSpeak folder
 │    ├── logs
 │    ├── staro
 │    └── teamspeak-server_linux_amd64
 └── ubuntu
      └── projekt             <-- Backup project
           ├── backup
           ├── logs
           ├── backup.sh
           ├── archivelog.sh
           ├── precheck.sh
           └── postcheck.sh

  1 contenter will be teamspeak and another backup project
