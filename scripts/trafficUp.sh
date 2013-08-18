#!/bin/bash

ifdown em1
service NetworkManager stop
service NetworkManager disable
ip addr add 1.1.1.100/24 dev em1
ifconfig em1 up
sleep 3
arp -s 1.1.1.1 02:00:00:00:00:00
