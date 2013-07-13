#!/bin/bash

# $1 = interface VMs will talk with the outside world
# $2 = Maximal number of VMs to connect to the switch

if [ ! $# -eq 2 ]
  then
    echo "Usage: $0 <physical interface> <number of VMs>"
    exit
fi

service openvswitch start
for (( i=0; i<$2; i++ ))
do
    tunctl -t tap$i -u root
done
service NetworkManager stop
sleep 3
ip add flush $1
ifconfig $1 down
sleep 1
ovs-vsctl add-br ovs-switch
for (( i=0; i<$2; i++ ))
do
    ovs-vsctl add-port ovs-switch tap$i
done
ovs-vsctl add-port ovs-switch $1
for (( i=0; i<$2; i++ ))
do
    ifconfig tap$i promisc up
done
ifconfig $1 promisc up
dhclient -r ovs-switch
sleep 1
dhclient ovs-switch
