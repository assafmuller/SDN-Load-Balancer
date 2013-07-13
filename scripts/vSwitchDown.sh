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

for (( i=0; i<$2; i++ ))
do
    ifconfig tap$i down
done

ovs-vsctl del-port ovs-switch $1
for (( i=0; i<$2; i++ ))
do
    ovs-vsctl del-port ovs-switch tap$i
done

ovs-vsctl del-br ovs-switch
service NetworkManager start
sleep 3
ifconfig $1 up

for (( i=0; i<$2; i++ ))
do
    tunctl -d tap$i
done

service openvswitch stop
