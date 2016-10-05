#!/bin/bash

. definitions.sh

testname="latency"
mkdir ${testname}

for mtu in ${!ppsb[*]}; do
    echo
    #band=${mtub[${mtu}]}
    #maxpps=$(echo "${band} * 1024 * 1024 / ${mtu} / 8" | bc)

    for ppsx in ${ppsb[${mtu}]}; do
	    cont=0
	
        while [ "$cont" -lt $maxcont ]; do

	        fileprefix="${testname}/${rbname}.${mtu}.${ppsx}.${cont}"
            echo "---------------- Test $rbname: $proto: $cont: $mtu: ${ppsx}:"

	        # bwm-ng
	        #${remote} ${h2name} ${bwm} ${bwmparam} -I ${h2if} -F ${fileprefix}.${h2filebwm} &

	        # pgrx - modified pktgen kernel module
	        ${remote} ${h2name} ${pgrxlat} ${h2if} &
       
	        # pktgen 
	        #${remote} ${h1name} ping ${h2ip} -c 5 > /dev/null &
	        ${remote} ${h1name} ${pktgenlat} ${h1if} ${h2ip} ${ppsx} ${mtu}

            sleep 2

	        #latency data
	        ${remote} ${h1name} ${pktgenlat} ${h1if} display > ${fileprefix}.${h1filepgrxlat}
	        ${remote} ${h2name} ${pgrxlat} display > ${fileprefix}.${h2filepgrxlat}

            cont=$((cont+1))
	        #sleep 1
	    done

    done

done
