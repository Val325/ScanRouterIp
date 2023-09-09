#!/bin/bash

pid=$$
num=$(wc -l < ${1}) #amount total 
num_first=$(sed '1q;d' ${1})
num_two=$(sed '2q;d' ${1})

echo "--info--"
echo "pid: ${pid}"
echo "amout_strings: ${num}"
echo "--test--"
echo "get first string ${num_first}"
echo "get two sting ${num_two}"
echo "--------"

#while read router; 
#   do sudo ~/routersploit/routersploit/rsf.py -m scanners/autopwn -s "target ${router}" 
#   kill -SIGINT $pid
#done < ${1}

iteration_num=0
end_iter=5 #how many times divided
readarray -t array_str < ${1}
for (( j=0; j<=5; j++ ))
do
	for (( i=1; i<=5; i++ ))
	do
		[ -z "${array_str[iteration_num]}" ] && break
		echo "ip router: ${array_str[iteration_num]}"
		#echo "iteration: j=${j}, i=${i}"
		#echo "iteration numder: ${iteration_num + 1}"
		((iteration_num=iteration_num+1))	
	done
done

#while read router; 
#   do sudo xterm -e zsh -c  "/home/kali/routersploit/routersploit/rsf.py -m scanners/autopwn -s 'target ${router}'; exec zsh" &
#   kill -SIGINT $pid
#done < ${1}

for ((i = 1; i <= 5; i++)); do
    sudo xterm -e "/home/kali/routersploit/routersploit/rsf.py -m scanners/autopwn -s 'target ${array_str[i]}'; exec zsh" &
done

wait
