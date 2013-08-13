#!/bin/bash

tunctl -t tap500 -u root
tunctl -t tap501 -u root

ovs-vsctl add-port wan tap500
ovs-vsctl add-port lb tap501

ifconfig tap500 promisc up
ifconfig tap501 promisc up

qemu-kvm -name "Traffic" -m 2048 -smp 2,cores=4 -boot d -drive file=../images/VM_Traffic,if=virtio,index=0,media=disk,format=qcow2 -net nic,vlan=0,model=virtio,macaddr=02:00:00:00:01:F4 -net tap,vlan=0,ifname=tap500,script=no,downscript=no -net nic,vlan=1,model=virtio,macaddr=02:00:00:00:01:F5 -net tap,vlan=1,ifname=tap501,script=no,downscript=no -vga cirrus -balloon virtio &
