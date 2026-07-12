#!/bin/bash

# Define the threshold limit as 80 percent
THRESHOLD=80

# 1. Get the current CPU usage percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

# Check if CPU usage is greater than 80
if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: High CPU usage detected! Current usage is: $CPU_USAGE%"
fi

# 2. Get the current Memory usage percentage
TOTAL_MEM=$(free | grep Mem | awk '{print $2}')
USED_MEM=$(free | grep Mem | awk '{print $3}')
MEM_USAGE=$(( USED_MEM * 100 / TOTAL_MEM ))

# Check if Memory usage is greater than 80
if [ "$MEM_USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: High Memory usage detected! Current usage is: $MEM_USAGE%"
fi

# 3. Get the current Disk usage percentage of the root system
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

# Check if Disk usage is greater than 80
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: High Disk usage detected! Current usage is: $DISK_USAGE%"
fi

# 4. Show the total number of running processes
PROCESS_COUNT=$(ps -ef | wc -l)
echo "Total running processes on the system: $PROCESS_COUNT"

