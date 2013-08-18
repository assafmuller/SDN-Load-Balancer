#!/bin/bash

ifconfig em1 down
ip addr del 1.1.1.100/24 dev em1
service NetworkManager enable
service NetworkManager start
sleep 3
ifup em1
