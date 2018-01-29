#!/bin/sh
echo FreeNAS forum member NASbox contributed this script. 
echo https://forums.freenas.org/index.php?threads/script-to-identify-disk-drives-device-name-serial-gptid.60497/ 
echo $(basename $0) - Mounted Drives on $(hostname)
cat /etc/version
date
echo
# diskinfo="$(glabel status | tail -n +2 | awk '{split($3,a,"p"); print a[1],$1}')"
diskinfo="$(glabel status | tail -n +2 | awk '{print $3,$1}')" # Temp Bug fix to accomodate botH p1/p2
echo "+========+==========================+==================+============================================+"
echo "| Device |     DISK DESCRIPTION     |  SERIAL  NUMBER  |                   GPTID                    |"
echo "+========+==========================+==================+============================================+"

for d in $(echo "$diskinfo" | cut -d" " -f 1)
do
   diskinf=$(diskinfo -v $d | grep '# Disk ')
   diskdescription=$(echo "$diskinf" | grep '# Disk desc' | cut -d# -f 1 | xargs)
   diskserialno=$(echo "$diskinf" | grep '# Disk ident' | cut -d# -f 1 | xargs)
   diskgptid=$(echo "$diskinfo" | grep ^$d | cut -d" " -f 2)
   printf "| %-6s | %-24s | %-16s | %-42s |\n" "$d" "$diskdescription" "$diskserialno" "$diskgptid"
   echo "+--------+--------------------------+------------------+--------------------------------------------+"
done
