#!/bin/bash

qemu-kvm -name "Template" -m 1024 -smp 2,cores=2 -boot d -drive file=../images/VM_Template.qcow2,if=virtio,index=0,media=disk,format=qcow2 -vga cirrus -balloon virtio &
