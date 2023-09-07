#!/bin/bash
 
#sudo ~/routersploit/routersploit/rsf.py -m scanners/autopwn -s "target ${1}" 
while read router; 
   do sudo ~/routersploit/routersploit/rsf.py -m scanners/autopwn -s "target ${router}" 
done < ${1}

