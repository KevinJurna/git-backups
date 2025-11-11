#!/bin/bash
# /opt/auto-backup-manager/setup_cron.sh

CRON_JOB="0 2 * * * /opt/auto-backup-manager/backup.sh"
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
echo "[$(date)] Cronjob lisatud." >> /opt/auto-backup-manager/logs/system.log

