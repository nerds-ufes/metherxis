#!/bin/bash

modprobe pktgen

CPU=1
iface=$1
PGTX="/proc/net/pktgen/${iface}"
if [ "$2" == "display" ]; then
	cat $PGTX
	exit 0
fi

ip=$2
ratep=$3
pktsize=$4
timetorun=$5

if [ "$timetorun" == "" ]; then
	timetorun=10
fi

#ratep=$(echo "${rate} * 1024 * 1024 / ${pktsize} / 8"| bc)
count=$((ratep * timetorun))
#echo "setting ratep=${ratep}"

mac=$(arping -I ${iface} ${ip} -c1 | grep Unicast | cut -d \[ -f 2 | cut -d \] -f 1)
if [ "$mac" == "" ]; then
	echo "Error obtaining mac address of destination: ${ip}"
	exit 1
fi

pgset()
{
    local result

    echo $1 > $PGDEV

    result=`cat $PGDEV | fgrep "Result: OK:"`
    if [ "$result" = "" ]; then
         cat $PGDEV | fgrep Result:
    fi
}

pg()
{
    echo inject > $PGDEV
    cat $PGDEV
}

# ******Inicializando a Configuração*******


# configurando a thread
# Cada CPU tem sua propria thread. Adicionamos a interface eth0.
for PGDEV in /proc/net/pktgen/kpktgend_*; do
	state=$(grep rem_device_all ${PGDEV})
	if [ "${state}" == "" ]; then
		echo "Removing device on ${PGDEV}"
		pgset "rem_device_all"
	fi
done
PGDEV="/proc/net/pktgen/kpktgend_${CPU}"
echo "Adicionando a interface ${iface}"
pgset "add_device ${iface}" 

#PGDEV="/proc/net/pktgen/kpktgend_1"
#echo "Removendo os dispositivos"
#pgset "rem_device_all" 
#echo "Adicionando a interface ${iface}"
#pgset "add_device ${iface}"


#echo "Setting max_before_softirq 10000"
#pgset "max_before_softirq 10000"


PGDEV=$PGTX
echo "Configuring $PGDEV"
pgset "count ${count}"
# test SO
#pgset "clone_skb 1"
# test driver
#pgset "clone_skb 100000"
pgset "clone_skb 0"
pgset "pkt_size ${pktsize}"
pgset "ratep ${ratep}"
#pgset "queue_map_min 0"
#pgset "queue_map_max 4"
#pgset "rate ${rate}"
#pgset "delay 96"
pgset "dst ${ip}" #IP do destino
pgset "dst_mac ${mac}" #MAC da interface


# Time to run
PGDEV="/proc/net/pktgen/pgctrl"

echo "Executando... ctrl-C para finalizar"
#sleep ${timetorun} && pgset "stop" &
pgset "start"
echo "Done"

# Result can be vieved in /proc/net/pktgen/eth1
