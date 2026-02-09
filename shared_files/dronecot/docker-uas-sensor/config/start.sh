#!/bin/bash

cd /root/
sleep 1

#setup wlan adapter and put it in monitor mode
wlan1new=`cat dronescout.conf | sed '/^#/d' | grep WLAN_USB_1 | sed 's/;.*//g' | sed 's/ //g' | sed 's/WLAN_USB_1=//g'`
wlan_adapter=$wlan1new
ip link set $wlan_adapter down
iw $wlan_adapter set monitor control
ip link set $wlan_adapter up
iw dev $wlan_adapter set channel 1

TERM=vt100 screen -dmS WATCHDOG /root/watchdog.sh

sleep 1
cd /root/
PATH_MAPPING="/sys/firmware/devicetree/base/serial-number:/config/serial-number" LD_PRELOAD=/config/path-mapping-quiet.so ./dronescout

exit 0
