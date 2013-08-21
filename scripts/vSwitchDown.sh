#!/bin/bash

# $1 = interface VMs will talk with the outside world
# $2 = Maximal number of VMs to connect to the switch

if [ ! $# -eq 2 ]
  then
    echo "Usage: $0 <physical interface> <number of VMs>"
    exit
fi

ip add flush $1
ifconfig $1 down

ovs-vsctl del-br lan
ovs-vsctl del-br traffic

service NetworkManager start
sleep 3

ifconfig $1 up

for (( i=1; i<=$2; i++ ))
do
    let "tap2=$i+100"
    tunctl -d tap$i
    tunctl -d tap$tap2
done

service openvswitch stop
