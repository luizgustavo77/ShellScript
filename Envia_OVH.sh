#!/bin/bash
cd /var/lib/elasticsearch/nodes/0/indices
vetor=(`ls`)
#echo ${vetor[*]}
for i in ${vetor[*]} ;
do
  sshpass -p 'KEY' rsync -avz -e ssh /var/lib/elasticsearch/nodes/0/indices/$i USER@URL:VOLUME/
done