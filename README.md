I have been educating myself in Linux terminal (Ubuntu).
So far this is what i did (link of my github is below):


Created two servers:
AWS (main server, running TeamSpeak and backup project scripts).
Oracle Cloud (backup server).
Set up SSH keys between PC ↔ AWS ↔ Oracle.

Backup project:
backup.sh: uses rsync to sync files from AWS to Oracle.
archivelog.sh: compresses & deletes old logs weekly.
precheck.sh: checks if rsync is installed, source folder exists and ssh works.
postcheck.sh: verifies backup success.
Created a logs directory to capture backup & cron activity.
Cronjobs:
Daily 4 AM backup.sh
Weekly Sunday midnight archivelog.sh


Git and GitHub:
Initialized a Git repo.
Added .gitignore (excludes only ssh keys for now)
Learned how to push and pull from and to GitHub


Docker:
Installed Docker on AWS.
Created a Dockerfile for backup projekt, built an image (backup-projekt).
Ran a container (backup-container) from that image.
Learned Docker commands (docker build, docker run, docker start, docker exec).

Next steps:

Dockerizing TeamSpeak 

Use Docker Compose to run Backup + TeamSpeak side by side.

Integrate Dynatrace monitoring for both containers.


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


