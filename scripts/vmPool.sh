#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Supply number of VMs"
    exit 1
fi

for (( i=1; i<=$1; i++ ))
do
    if [ ! -e ../images/VM$i ]
      then
        ./cloneDisk.sh $i
    fi 

    ./vmUp.sh $i
done

