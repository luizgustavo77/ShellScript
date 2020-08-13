#!/bin/dash
 ping -c 1 -q IP -p 22
 if [ $? -eq 0 ] ;
 then
         echo "servidor ok"
 else
         ssmtp EMAIL < /home/lg/Documentos/Shell/msg &
 fi 
