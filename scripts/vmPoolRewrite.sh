#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Supply number of VMs"
    exit 1
fi

for (( i=1; i<=$1; i++ ))
do
    ./vmUpRewrite.sh $i
done

