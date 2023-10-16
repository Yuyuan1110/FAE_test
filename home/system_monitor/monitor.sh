#!/bin/bash

# get cpu usage
cpu=$(top -bn1 |grep "Cpu(s)" |awk '{print $2}' |cut -d'%' -f1)

#get memory usage
mem=$(free |awk '/Mem/{printf("%.2f"), $3/$2*100}')

#get Disk usage (just /)
disk=$(df -h / |awk '/\//{print $(NF-1)}' |sed 's/%//')


#echo "CPU: ${cpu}%"
#echo "Memory: ${mem}%"
#echo "Disk: ${disk}%"
echo "CPU${cpu}%;Memory${mem}%;Disk${disk}%" > /home/web_service/system_monitor.txt


log_dir="/home/logs/system_monitor"
filename="${log_dir}/system_monitor-$(date +%F).log"

#if [ -d "$log_dir" ]; then
#    echo "[$(date +"%F %H:%M:%S.%N" | cut -c1-26)] INFO;CPU;${cpu}%;Mem;${mem}%;Disk;${disk}%" > "$filename"
#else
#    mkdir -p "$log_dir"
#    echo "[$(date +"%F %H:%M:%S.%N" | cut -c1-26)] INFO;CPU;${cpu}%;Mem;${mem}%;Disk;${disk}%" > "$filename"
#fi

if [ -d "$log_dir" ]; then
    echo "[$(date +"%F %H:%M:%S.%N" | cut -c1-26)] INFO;CPU;${cpu}%;Mem;${mem}%;Disk;${disk}%" >> "$filename"
else
    mkdir -p "$log_dir"
    echo "[$(date +"%F %H:%M:%S.%N" | cut -c1-26)] INFO;CPU;${cpu}%;Mem;${mem}%;Disk;${disk}%" >> "$filename"
fi
