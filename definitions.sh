### test-suite definitions
##----------------------------

baseip="10.0.0"
# namespace array = (ip/mask|phy interface)

# intel T4
namespace[0]="${baseip}.1/24|enp3s0f0"
namespace[1]="${baseip}.2/24|enp3s0f1"
namespace[2]="${baseip}.3/24|enp3s0f2"
namespace[3]="${baseip}.4/24|enp3s0f3"


# OvS/veth Namespaces
#namespace[0]="${baseip}.1/24|tap1"
#namespace[1]="${baseip}.2/24|tap2"
#namespace[2]="${baseip}.3/24|tap3"
#namespace[3]="${baseip}.4/24|tap4"


# Myracom
#namespace[0]="${baseip}.1/24|enp3s0"
#namespace[1]="${baseip}.2/24|enp4s0"


#rbname="vethpair"
#rbname="loopcable10gbit-myracom"
#rbname="ovshost"
#rbname="ovstest"
#rbname="loopcable1gbit-progressive"
#rbname="netfpga"
#rbname="brocade7450"
#rbname="datacom-dm4100"
rbname="loopcable-bristol"
#rbname="pica8-bristol"
#rbname="ovshost-bristol"
#ppsb[128]="$(seq 10240 10240 1034240)"
#ppsb[128]="$(seq 993280 10240 1024000)"
#ppsb[128]="1034240"
#ratep=$(echo "1000 * 1024 * 1024 / 64 / 8"| bc)
#ppsb[64]="$(seq 21000 10000 1501000)"
ppsb[64]="$(seq 204800 204800 2048000)"
#ppsb[64]="$(seq 1511000 10000 15110000)"
#ppsb[150]="$(seq 21000 10000 801000)"
#ppsb[64]="$(seq 15000 1000 23000)"
# 1 Gbps = 86345 or 82345 ???
#ppsb[1518]="$(seq 15000 1000 90000)"
#ppsb[64]="2000000"
#ppsb[128]="2000000"
#ppsb[150]="2000000"
#ppsb[256]="2000000"
#ppsb[512]="2000000"
#ppsb[1024]="2000000"
#ppsb[1280]="2000000"
#ppsb[1500]="2000000"

#rb450g
#rbname="rb450g"
#ppsb[64]="10000 15000 20000 21000 22000 23000 24000 25000 26000 27000 28000 29000 30000 31000 32000 33000 34000 35000 36000 37000 38000 39000 40000 41000 42000 43000 44000 45000 46000 47000 48000 49000 50000 55000 60000 65000"
#ppsb[64]="$(seq 9000 1000 20000)"
#mtub[64]=33
#mtub[128]=66
#mtub[256]=132
#mtub[512]=252
#mtub[1024]=600
#mtub[1280]=640
#mtub[1500]=750
#mtub[1518]=
#ppsb[64]=62000
#ppsb[128]=62000
#ppsb[256]=62000
#ppsb[512]=62000
#ppsb[1024]=62000
#ppsb[1280]=62000
#ppsb[1500]=62000


#rb2011uas-in
#rbname="rb2011uas-in"
#mtub[64]=30
#ppsb[64]="10000 15000 20000 21000 22000 23000 24000 25000 26000 27000 28000 29000 30000 31000 32000 33000 34000 35000 36000 37000 38000 39000 40000 41000 42000 43000 44000 45000 46000 47000 48000 49000 50000 55000 60000"
#ppsb[64]="$(seq 9000 1000 20000)"
#mtub[128]=64
#mtub[256]=122
#mtub[512]=240
#mtub[1024]=540
#mtub[1280]=680
#mtub[1500]=780
#mtub[1518]=790
#ppsb[64]=60000
#ppsb[128]=60000
#ppsb[256]=62000
#ppsb[512]=58000
#ppsb[1024]=65000
#ppsb[1280]=65000
#ppsb[1518]=65000


#rb2011ils-in
#rbname="rb2011ils-in"
##mtub[64]=32
#ppsb[64]="1000 10000 15000 20000 25000 30000 35000 40000 45000 50000 55000 60000 61000 62000 63000 64000 65000"
##ppsb[64]="21000 22000 23000 24000 26000 27000 28000 29000 31000 32000 33000 34000 36000 37000 38000 39000 41000 42000 43000 44000 46000"
#ppsb[64]="$(seq 9000 1000 20000)"
#mtub[128]=64
#mtub[256]=130
#mtub[512]=232
#mtub[1024]=540
#mtub[1280]=672
#mtub[1500]=768
##mtub[1518]=790
#ppsb[64]=62000
#ppsb[128]=62000
#ppsb[256]=62000
#ppsb[512]=58000
#ppsb[1024]=65000
#ppsb[1280]=65000
#ppsb[1518]=65000

#rb750gl
#rbname="rb750gl"
#mtub[64]=21
##ppsb[64]="1000 10000 15000 20000 25000 30000 35000 40000 41000 42000 43000 44000 45000"
#ppsb[64]="21000 22000 23000 24000 26000 27000 28000 29000 31000 32000 33000 34000"
#ppsb[64]="$(seq 10000 1000 44000)"
#ppsb[64]=41000
#ppsb[128]=41000
#ppsb[256]=41000
#ppsb[512]=41000
#ppsb[1024]=41000
#ppsb[1280]=41000
#ppsb[1500]=41000
#mtub[128]=44
#mtub[256]=86
#mtub[512]=170
#mtub[1024]=354
#mtub[1280]=448
##mtub[1500]=518
#ppsb[1500]="21000 22000 23000 24000 26000 27000 28000 29000 31000 32000 33000 34000 36000 37000 38000 39000"
#ppsb[1500]="1000 10000 15000 20000 25000 30000 35000 40000 41000 42000 43000 44000 45000"
#mtub[1518]=


maxcont=6
proto="udp"
npingport=80
timetorun=10

if [ $proto == "tcp" ]; then
	iperf="iperf3"
	iperfsrvparam="-s"
	iperfcliparam="-t ${iperftime} -P7 -c"
else
	iperf="iperf"
	iperfsrvparam="-s -u -i 1"
	iperfcliparam="-t ${iperftime} -u"
fi

bwm="bwm-ng"
bwmparam="-u bits -o csv -t 1000 -T rate"

pktgen="$(pwd)/pktgen.sh"
pgrx="$(pwd)/pktgen-rx.sh"

pktgenlat="$(pwd)/pktgen-lat.sh"
pgrxlat="$(pwd)/pktgen-lat-rx.sh"

pktgenmulti="$(pwd)/pktgen-multi.sh"

remote="ip netns exec"

h1name="ns0"
h1if=$(echo ${namespace[0]} | cut -d '|' -f 2)
h1ip=$(echo ${namespace[0]} | cut -d '|' -f 1 | cut -d '/' -f 1)
h1filebwm="bwm-${h1name}-${proto}.txt"
h1fileiperf="iperf-${h1name}-${proto}.txt"
h1filepcap="tcpdump-${h1name}-${proto}.pcap"
h1filepgrx="pgrx-${h1name}-${proto}.txt"
h1filepgrxlat="pgrxlat-${h1name}-${proto}.txt"
h1filenping="nping-${h1name}-${proto}.txt"


h2name="ns1"
h2if=$(echo ${namespace[1]} | cut -d '|' -f 2)
h2ip=$(echo ${namespace[1]} | cut -d '|' -f 1 | cut -d '/' -f 1)
h2filebwm="bwm-${h2name}-${proto}.txt"
h2fileiperf="iperf-${h2name}-${proto}.txt"
h2filepcap="tcpdump-${h2name}-${proto}.pcap"
h2filepgrx="pgrx-${h2name}-${proto}.txt"
h2filepgrxlat="pgrxlat-${h2name}-${proto}.txt"


h3name="ns2"
h3if=$(echo ${namespace[2]} | cut -d '|' -f 2)
h3ip=$(echo ${namespace[2]} | cut -d '|' -f 1 | cut -d '/' -f 1)
h3filebwm="bwm-${h3name}-${proto}.txt"
h3fileiperf="iperf-${h3name}-${proto}.txt"
h3filepcap="tcpdump-${h3name}-${proto}.pcap"
h3filepgrx="pgrx-${h3name}-${proto}.txt"
h3filepgrxlat="pgrxlat-${h3name}-${proto}.txt"


h4name="ns3"
h4if=$(echo ${namespace[3]} | cut -d '|' -f 2)
h4ip=$(echo ${namespace[3]} | cut -d '|' -f 1 | cut -d '/' -f 1)
h4filebwm="bwm-${h4name}-${proto}.txt"
h4fileiperf="iperf-${h4name}-${proto}.txt"
h4filepcap="tcpdump-${h4name}-${proto}.pcap"
h4filepgrx="pgrx-${h4name}-${proto}.txt"
h4filepgrxlat="pgrxlat-${h4name}-${proto}.txt"




rb="root@192.168.5.5"
rbfilempstat="mpstat-${proto}.txt"

filesleep () {
    while [ ! -s $1 ]; do
        sleep 0.5
    done
}
