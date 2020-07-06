#!/bin/bash
echo "the top memory utilizing processes are:"
echo "--------------------------------------------------"
ps -eo pid,user,ppid,%mem,%cpu,comm,cmd --sort=-%mem | head | tail -n +2 | awk '{print $1}' > /tmp/op1.txt
echo "--------------------------------------------------"
echo "UName     PID  %cpu     %mem        CMD"
echo "--------------------------------------------------"
for i in `cat /tmp/op1.txt`
do
username=$(ps -u -p $i | tail -1 | awk '{print $1}')
cpu=$(ps -u -p $i |tail -1 | awk '{print $3}')
mem=$(ps -u -p $i |tail -1 | awk '{print $4}')
command=$(ps -u -p $i |tail -1 | awk '{print $11}')
echo "$username $i $cpu $mem $command"
done | column -t
echo "--------------------------------------------------"

echo "the top cpu utilizing processes are:"
echo "======================================"
ps -eo pid,user,ppid,%mem,%cpu,comm --sort=-%cpu | head | tail -n +2 | awk '{print $1}' > /tmp/op2.txt
echo "--------------------------------------------------"
echo "UName     PID  %cpu     %mem        CMD"
echo "--------------------------------------------------"
for i in `cat /tmp/op2.txt`
do
username=$(ps -u -p $i | tail -1 | awk '{print $1}')
cpu=$(ps -u -p $i |tail -1 | awk '{print $3}')
mem=$(ps -u -p $i |tail -1 | awk '{print $4}')
command=$(ps -u -p $i |tail -1 | awk '{print $11}')
echo "$username $i $cpu $mem $command"
done | column -t
echo "--------------------------------------------------"
