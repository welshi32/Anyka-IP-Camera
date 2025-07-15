#!/bin/sh

killall -9 as9ipcwatchdog
killall -2 recorder
killall -9 as9updatednsip
killall -9 akmodeselection
killall -9 as9nvserver
killall -9 udp_broadcast
killall -9 vsipbroadcast

sleep 5

killall -9 recorder
