SDN-Load-Balancer
=================

Purpose:
--------
Demonstrate the performance hit of L2 and L3 header rewrites in a typical
software defined networking load balancer.

Usage - Getting the lab up:
---------------------------
* git clone into $HEAD
* mkdir $HEAD/images
* Resulting directory tree:
  $HEAD/
    images/
    scripts/
* Obtain any Linux distribution (Tested on Fedora)
* Create an image out of it called VM_Template.qcow2 and place it in the images folder
* Ensure that startupScript.sh is executed on the VM template boot up
* Construct a topology so that two Fedora hosts are connected via an Ethernet cable
* On the VMs host (Henceforth known as the host) execute:
    vSwitchUp.sh <em1> <2>
    vmPool.sh <2>
* On the other machine (Known as the traffic generator) execute trafficUp.sh

At this point you should be able to ping 1.1.1.1 from the traffic generator machine. The first VM
will answer you. If you fake the traffic from 1.1.1.101 (Instead of 1.1.1.100) you will get an answer
from the second VM.

* The installed flows can be viewed on the host via:
    ovs-ofctl dump-flows

Usage - Reproducing the results:
--------------------------------
* On the traffic generator machine, run:
    ovs-benchmark rate -r 1.1.1.1 -s 1023
    ovs-benchmark latency -r 1.1.1.1 -b 10000
  For a duration of 10 minutes

Authors:
--------
Assaf Muller: assafmuller@gmail.com
Noam Slomianko: drekmastermind@gmail.com

License:
--------
SDN-Load-Balancer
    Copyright (C) 2013  Assaf Muller & Noam Slomianko

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
