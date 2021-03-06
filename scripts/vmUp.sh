#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Supply VM number"
    exit 1
fi

let "tap1=$1"
let "tap2=$1+100"

qemu-kvm -name "$1" -m 1024 -cpu host -smp 1,cores=1 -boot d -drive file=../images/VM$1,if=virtio,index=0,media=disk,format=qcow2 -net nic,vlan=0,model=virtio,macaddr=02:00:00:00:00:00 -net tap,vlan=0,ifname=tap$tap1,script=no,downscript=no -net nic,vlan=1,model=virtio,macaddr=02:00:00:00:00:0$1 -net tap,vlan=1,ifname=tap$tap2,script=no,downscript=no -vga cirrus -balloon virtio &
