#!/bin/sh

echo Download List
wget -O /opt/etc/miner.conf https://gitlab.com/ZeroDot1/CoinBlockerLists/raw/master/list.txt

echo Generation Block List
cd /opt/etc/
sed -i 's/.*/ipset=\/&\/miner/' miner.conf

echo Restart dnsmasq
ipset flush miner
killall -q dnsmasq
/usr/sbin/dnsmasq
