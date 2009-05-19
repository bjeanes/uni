#!/bin/bash
ifconfig veth1 hw ether 02:16:00:00:00:01
ifconfig veth1 inet 192.168.74.100 netmask 255.255.255.0 broadcast 192.168.74.255 up
ifconfig vif0.1 up
brctl addif switch1 vif0.1
