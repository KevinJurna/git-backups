#!/bin/bash
# /opt/auto-backup-manager/startup.sh

LOG_FILE="/opt/auto-backup-manager/logs/system.log"

echo "[$(date)] Süsteem käivitati. Käivitan automaatsed protsessid..." >> "$LOG_FILE"

/opt/auto-backup-manager/user_setup.sh
/opt/auto-backup-manager/backup.sh
