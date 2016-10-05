#!/bin/bash

modprobe pktgen
PGRX="/proc/net/pktgen/pgrx"
PGDEV="/proc/net/pktgen/pgctrl"

if [ "$1" == "display" ]; then
	cat $PGRX
	exit 0
fi

iface="$1"



echo "rx ${iface}" > $PGRX
echo "display script" > $PGRX
#echo "display human" > $PGRX
echo "statistics time" > $PGRX
echo "start" > $PGDEV

#cat $PGRX

