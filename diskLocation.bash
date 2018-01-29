#!/bin/bash

for D in `seq 0 1 11`; do echo $D; 
  diskinfo -v da${D} | egrep -i '(Disk ident|Dk)' ;
done;

