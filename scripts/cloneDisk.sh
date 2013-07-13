#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Supply VM number"
    exit
fi

qemu-img create -b ../images/VM_Template.qcow2 -f qcow2 ../images/VM$1
