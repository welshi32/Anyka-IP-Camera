#!/bin/sh

NETWORKINFO_INI=/mnt/mtd/network_Info.ini
DDNSCLIENT_INI=/mnt/mtd/DDNSClient.ini

/mvs/apps/recorder -read_id

DEVID=`sed -n 's/DEV_ID=\(.*\)/\1/p' $NETWORKINFO_INI`

DOMAINID=`sed -n 's/Domain=\(.*\)/\1/p' $DDNSCLIENT_INI`

if [ "$DOMAINID" != "" ]
then

        DOMAINID=${DOMAINID%%.*}
        if [ "$DEVID" != "$DOMAINID" ]
        then
                rm $DDNSCLIENT_INI
		echo "remove DDNSClient.ini"
		/etc/bak/reset/APname_preset.sh
		echo "reset AP name and ID osd"
        fi
fi

