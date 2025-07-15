#!/bin/sh

cp /mnt/mtd/prerun /tmp/prerun -af
chmod +x /tmp/prerun
#=================================================

debug=0

#=================================================
/tmp/prerun

/mnt/mtd/hu_updater

/mnt/mtd/idcheck.sh

if [ -f "/mnt/mtd/wifi_need_preset" ]
then
	rm /mnt/mtd/wifi_need_preset
	/etc/bak/reset/APname_preset.sh
fi

ifconfig lo up

telnetd &

if [ "$debug" == "0" ]
then
	ulimit -s 1024
	/mnt/mtd/hwwtd &
	/mnt/mtd/udp_broadcast > /dev/null &
	/mnt/mtd/vsipbroadcast > /dev/null &
	/mnt/mtd/as9nvserver &
	/mnt/mtd/as9updatednsip &
	sleep 1
	/mnt/mtd/recorder &
	/mnt/mtd/hu_checker &
	sleep 5
	/mnt/mtd/as9ipcwatchdog /mnt/mtd&
fi
