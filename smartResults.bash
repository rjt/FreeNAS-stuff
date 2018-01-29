#!/bin/bash                                                                                                                         
                                                                                                                                    
echo === START OF READ SMART DATA SECTION ===                                                                                       
echo SMART Self-test log structure revision number 1                                                                                
                                                                                                                                    
for D in `egrep /dev/ /usr/local/etc/smartd.conf | awk '{ print $1 }' `;                                                            
  do echo ${D};                                                                                                                     
  smartctl -l selftest ${D} | egrep -v '(^smartctl 6|^Copyright|=== START OF READ SMART DATA SECTION ===|SMART Self-test log structu
re revision number 1)';                                                                                                             
done;                                                                                                                               
                                                                                                                                    
echo "Completed without error" could be removed or use smartctl -q errorsonly                                                       
echo Generated by $LOGNAME on $HOSTNAME using $0.                                                                                   
                                                