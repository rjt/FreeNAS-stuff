#!/bin/bash                                                                                                                         
                                                                                                                                    
echo === START OF READ SMART DATA SECTION ===                                                                                       
echo SMART Self-test log structure revision number 1                                                                                
                                                                                                                                    
for D in `egrep /dev/ /usr/local/etc/smartd.conf | awk '{ print $1 }' `;                                                            
  do echo ${D};                                                                                                                     
  smartctl -l scttemp ${D} | egrep -v '(=== START OF READ SMART DATA SECTION ===|SMART Self-test log structure revision number 1)' |
 egrep '(Lifetime    Min/Max Temperature)';                                                                                         
done;                                                                                                                               
                                                                                                                                    
echo Generated by $LOGNAME on $HOSTNAME using $0. 
