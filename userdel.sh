#!/bin/bash
for i in `cat users`
do
sudo userdel -r -f $i  2> /dev/null

result=`echo $?`
if [ $result -eq 0 ];then
	echo "user $i is deleted successfully"
elif [ $result -ge 0 ]; then
	echo "user $i does not exist"
fi
done
