# /bin/bash

CONFIG_FILE="/home/housekeeping/housekeeping_config.ini"
LOG_DIR=$(awk -F= '/\/home\/logs\/system_monitor/ {print $1}' "$CONFIG_FILE")
DAYS=$(awk -F= '/\/home\/logs\/system_monitor/ {print $2}' "$CONFIG_FILE")


if [ -d "$LOG_DIR" ]; then
    echo "Cleaning $LOG_DIR"
    
    find "$LOG_DIR" -type f -mtime +"$DAYS" -delete
    
    echo "Cleanup complete."
else
    echo "$LOG_DIR not found, please check PATH setting in housekeeping_config.ini"
fi

