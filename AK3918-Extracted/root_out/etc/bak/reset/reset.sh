#!/bin/sh

SOURCEDIR=/etc/bak/reset
DESTDIR=/mnt/mtd/mvconf

do_filereset()
{
	cp -f $SOURCEDIR/*.ini $DESTDIR/
	cp -f $SOURCEDIR/*.conf $DESTDIR/

	/etc/bak/reset/APname_preset.sh
}

#
#main
#
do_filereset
	
