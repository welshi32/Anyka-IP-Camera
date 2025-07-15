#!/bin/sh

CONFFILE=/mnt/mtd/wificonf/hostapd.conf
INIFILE=/mnt/mtd/mvconf/wifi.ini

NUM=`sed -n 's/DEV_ID=\(.*\)/\1/p' /mnt/mtd/network_Info.ini`

sh -c "sed -i 's/^ssid=.*/ssid=MV$NUM/' $CONFFILE"
sh -c "sed -i 's/^apssid=.*/apssid=MV$NUM/' $INIFILE"
