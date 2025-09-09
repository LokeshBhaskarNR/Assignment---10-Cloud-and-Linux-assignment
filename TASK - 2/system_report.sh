#!/bin/bash

while true
do
    TIMESTAMP=$(TZ='Asia/Kolkata' date +"%Y%m%d_%H%M%S")
    LOG_FILE="system_logs_${TIMESTAMP}.txt"

    {
        echo "========== System Report =========="
        echo "Date: $(TZ='Asia/Kolkata' date)"
        echo "Uptime: $(uptime -p)"
        echo "CPU Info:"
        lscpu | grep 'Model name\|CPU(s)'
        echo "Memory Usage:"
        free -h
        echo "Disk Usage:"
        df -h /
        echo "==================================="
        echo ""
    } > "$LOG_FILE"

    echo "Saved log: $LOG_FILE"

    sleep 120
done
