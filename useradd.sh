#!/bin/bash
for i in `cat users`
do
sudo useradd $i -c "user $i for test purpose" -G sysadmin 2> /dev/null

result=`echo $?`
if [ $result -eq 0 ];then
	echo "user $i is created successfully"
        sudo echo "a" | sudo passwd --stdin "$i"
elif [ $result -ge 0 ]; then
	echo "user $i already exist"
fi
done
