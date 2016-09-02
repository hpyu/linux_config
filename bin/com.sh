#!/bin/bash
if [ $# -ne 1 ]; then
	echo "lack of param like ttyUSB0, ttyUSB1, ttyUSB2 or ttyUSB3"
	exit 1
fi
if [ "$1" == "0" ]; then
	dev="ttyUSB0"
	base="ttyusb0"
elif [ "$1" == "1" ]; then
	dev="ttyUSB1"
	base="ttyusb1"
elif [ "$1" == "2" ]; then
	dev="ttyUSB2"
	base="ttyusb2"
elif [ "$1" == "3" ]; then
	dev="ttyUSB3"
	base="ttyusb3"
elif [ "$1" == "4" ]; then
	dev="ttyUSB4"
	base="ttyusb4"
else
	echo "error: wrong device"
	exit 1
fi
d=`date +%F`
h=`date +%H`
m=`date +%M`
s=`date +%S`
log=$d-$h$m$s
mkdir -p /home/haipengy/minicom_log/$base
sudo minicom $dev -C /home/haipengy/minicom_log/$base/$log -w


