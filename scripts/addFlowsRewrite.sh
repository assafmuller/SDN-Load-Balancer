#!/bin/bash

ovs-ofctl del-flows traffic
ovs-ofctl add-flow traffic "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.0/0.0.0.3,actions=mod_dl_dst:02:00:00:00:00:11,output:1" 
ovs-ofctl add-flow traffic "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.1/0.0.0.3,actions=mod_dl_dst:02:00:00:00:00:12,output:2" 
ovs-ofctl add-flow traffic "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.2/0.0.0.3,actions=mod_dl_dst:02:00:00:00:00:13,output:3" 
ovs-ofctl add-flow traffic "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,nw_src=0.0.0.3/0.0.0.3,actions=mod_dl_dst:02:00:00:00:00:14,output:4"
ovs-ofctl add-flow traffic "table=0,idle_timeout=0,hard_timeout=0,ip,nw_src=1.1.1.1,actions=output:5"
ovs-ofctl add-flow traffic "table=0,priority=0,actions=drop"
