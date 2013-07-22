#!/bin/bash

ifconfig eth1 -arp
ifup eth1
sleep 2
arp -s 1.1.1.100 02:00:00:00:01:F5
