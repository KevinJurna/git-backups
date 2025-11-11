#!/bin/bash
# /opt/auto-backup-manager/backup.sh

SOURCE_DIR="/home"
BACKUP_DIR="/opt/auto-backup-manager/backups"
LOG_FILE="/opt/auto-backup-manager/logs/backup.log"
GIT_REPO="/opt/auto-backup-manager/git-backups"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[$(date)] Alustan varundamist..." >> "$LOG_FILE"

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] Varundamine õnnestus: $ARCHIVE_NAME" >> "$LOG_FILE"
else
    echo "[$(date)] VIGA varundamisel!" >> "$LOG_FILE"
fi

cp "$BACKUP_DIR/$ARCHIVE_NAME" "$GIT_REPO/"
cd "$GIT_REPO"
git add .
git commit -m "Automaatne varukoopia $DATE"
git push origin main >> "$LOG_FILE" 2>&1
