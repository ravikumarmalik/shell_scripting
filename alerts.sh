#!/bin/bash
echo
echo memory status....
printf "Timestamp Cpu  Memory  Disk\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
h=$(date +%H)
m=$(date +%M)
s=$(date +%S)
ms=$(date +%3N)

TIMESTAMP=$(($(date +%s%N)/1000000)),
CPU=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'),
MEMORY=$(free -l | awk 'NR==2{printf "%.1f,", $3*100/$2}')
DISK=$(df -h | awk '$NF=="/"{printf "%.1f", $5}')

echo "$TIMESTAMP$CPU$MEMORY$DISK"
sleep 5
done
end=$((SECONDS+3))
while [ $SECONDS -lt $end ]; do
echo "$TIMESTAMP$CPU$MEMORY$DISK$"
sleep 5
done



