#!/bin/sh

set_gpio()
{
    if [ ! -d "/sys/class/gpio/GPIO$1" ]; then
        echo $1 > /sys/class/gpio/export
        echo out > /sys/class/gpio/GPIO$1/direction
    fi

    echo $2 > /sys/class/gpio/GPIO$1/value
}

insmod /usr/modules/vmm.ko mmz=anonymous,0,0xA2000000,24M anony=1

#reset sensor
set_gpio 13 0

insmod /usr/modules/xbus_rpc.ko fn=/usr/modules/rtthread_arc_FH8626V100.bin fa=0xbff80000

#reset sensor
set_gpio 13 1

insmod /usr/modules/media_process.ko
insmod /usr/modules/isp.ko
insmod /usr/modules/enc.ko
insmod /usr/modules/jpeg.ko
insmod /usr/modules/bgm.ko
