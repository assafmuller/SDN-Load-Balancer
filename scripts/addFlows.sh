#!/bin/bash

ovs-ofctl del-flows lb
ovs-ofctl add-flow lb "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.0/0.0.0.3,actions=output:1" 
ovs-ofctl add-flow lb "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.1/0.0.0.3,actions=output:2" 
ovs-ofctl add-flow lb "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.2/0.0.0.3,actions=output:3" 
ovs-ofctl add-flow lb "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.3/0.0.0.3,actions=output:4"
ovs-ofctl add-flow lb "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.100,ip,nw_src=1.1.1.1,actions=output:5"
