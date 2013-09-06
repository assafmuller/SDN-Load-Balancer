#!/bin/bash

ovs-ofctl del-flows traffic
ovs-ofctl add-flow traffic "table=0,priority=0,actions=drop"
ovs-ofctl add-flow traffic "table=0,idle_timeout=0,hard_timeout=0,nw_dst=1.1.1.1,ip,actions=output:1"
ovs-ofctl add-flow traffic "table=0,idle_timeout=0,hard_timeout=0,ip,nw_src=1.1.1.1,actions=output:2"
