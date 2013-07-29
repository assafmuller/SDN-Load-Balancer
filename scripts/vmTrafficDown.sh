#!/bin/bash

ovs-vsctl del-port wan tap500
ovs-vsctl del-port lb tap501

tunctl -d tap500
tunctl -d tap501
