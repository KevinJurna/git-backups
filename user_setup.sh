#!/bin/bash
# /opt/auto-backup-manager/user_setup.sh

USER_FILE="/opt/auto-backup-manager/users.txt"
LOG_FILE="/opt/auto-backup-manager/logs/system.log"

while read USERNAME; do
    if id "$USERNAME" &>/dev/null; then
        echo "[$(date)] Kasutaja $USERNAME juba eksisteerib." >> "$LOG_FILE"
    else
        useradd -m "$USERNAME"
        echo "[$(date)] Loodud uus kasutaja: $USERNAME" >> "$LOG_FILE"
    fi
done < "$USER_FILE"
