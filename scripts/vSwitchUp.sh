#!/bin/bash

# $1 = interface VMs will talk with the outside world
# $2 = Maximal number of VMs to connect to the switch

if [ ! $# -eq 2 ]
  then
    echo "Usage: $0 <physical interface> <number of VMs>"
    exit
fi

service openvswitch start
for (( i=1; i<=$2; i++ ))
do
    let "tap2=$i+100"
    tunctl -t tap$i -u root
    tunctl -t tap$tap2 -u root
done
service NetworkManager stop
sleep 3
ip add flush $1
ifconfig $1 down
sleep 1
ovs-vsctl add-br wan
ovs-vsctl add-br lb
#ovs-vsctl set-controller lb tcp:127.0.0.1:6633
./addFlows.sh
for (( i=1; i<=$2; i++ ))
do
    let "tap2=$i+100"
    ovs-vsctl add-port wan tap$i
    ovs-vsctl add-port lb tap$tap2
done
ovs-vsctl add-port wan $1
for (( i=1; i<=$2; i++ ))
do
    let "tap2=$i+100"
    ifconfig tap$i promisc up
    ifconfig tap$tap2 promisc up
done
ifconfig $1 promisc up
dhclient -r wan
sleep 1
dhclient wan
sleep 3
./vmTrafficUp.sh
#./controllerUp.sh $2
