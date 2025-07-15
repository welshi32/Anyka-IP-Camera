#!/bin/sh
# add 20131210 by liubing
RECFILES=/mnt/sdcard/RecFiles
RECBAKR=/mnt/sdcard/RecFiles/recoredindex_bakr.ini
RECTEMP=/mnt/sdcard/RecFiles/recoredindex_temp.ini
init_SD()
{
	if [ -f "RECFILES" ]
	then
		if [ -f "RECBAKR" ]
		then
			cp /mnt/sdcard/RecFiles/recoredindex_bakr.ini /mnt/sdcard/RecFiles/recoredindex.ini
		else
			if [ -f "RECTEMP" ]
			then
				cp /mnt/sdcard/RecFiles/recoredindex_temp.ini /mnt/sdcard/RecFiles/recoredindex_bakr.ini
				rm -rf /mnt/sdcard/RecFiles/recoredindex_temp.ini
				cp /mnt/sdcard/RecFiles/recoredindex_bakr.ini /mnt/sdcard/RecFiles/recoredindex.ini
			else
				:
			fi
		fi
	else
		:
	fi
}
init_SD
exit 0







