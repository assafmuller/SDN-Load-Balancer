#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Supply VM number"
    exit 1
fi

let "tap1=$1"
let "tap2=$1+100"

qemu-kvm -name "$1_Rewrite" -m 1024 -smp 1,cores=1 -boot d -drive file=../images/VM$1_Rewrite,if=virtio,index=0,media=disk,format=qcow2 -net nic,vlan=0,model=virtio,macaddr=02:00:00:00:00:0$1 -net tap,vlan=0,ifname=tap$tap1,script=no,downscript=no -net nic,vlan=1,model=virtio,macaddr=02:00:00:00:00:1$1 -net tap,vlan=1,ifname=tap$tap2,script=no,downscript=no -vga cirrus -balloon virtio &
