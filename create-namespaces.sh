#!/bin/bash

. definitions.sh

# 10gbit
mtu=9000
nstype="other"

if [ "$nstype" == "veth" ]; then
	ip link add tap1 type veth peer name tap2
fi

for ((i=0; i<${#namespace[@]}; i++)); do
	ip=$(echo ${namespace[$i]} | cut -d '|' -f 1)
	iface=$(echo ${namespace[$i]} | cut -d "|" -f 2)
	echo "-----"
	echo "add namespace ns${i}"
	ip netns del ns${i} 2> /dev/null
	sleep 2
	ip netns add ns${i}

	echo "attach phy to namespace ns${i}"
	ip link set $iface netns ns${i}

	echo "set ports up"
	ip netns exec ns${i} ip link set dev lo up
	ip netns exec ns${i} ip link set dev $iface mtu ${mtu} up

	echo "assign ipv4 address"
	ip netns exec ns${i} ip addr add dev $iface $ip
done 
