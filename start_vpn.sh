#!/bin/bash

. ./Raspberry-Pi-Zero-Rubber-Ducky-Duckberry-Pi/duckpi.sh

echo 'space' |  ./hid-gadget-test /dev/hidg0 keyboard
echo 'left-meta r' |  ./hid-gadget-test /dev/hidg0 keyboard
sleep 0.3
echo 'return' |  ./hid-gadget-test /dev/hidg0 keyboard
sleep 2

string='"c:\Program Files (x86)\Common Files\Pulse Secure\JamUI\jamCommand.exe" /stop'
echo ${#string}
for((i=0; i<${#string}; i++)); do
	 ch=$(convert "${string:$i:1}")
         if [ "$ch" != "" ]; then
 	    echo "$ch" | ./hid-gadget-test /dev/hidg0 keyboard
	 fi
done
echo 'return' |  ./hid-gadget-test /dev/hidg0 keyboard
sleep 3

#string='"c:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe" & exit'
string='"c:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe"'
for((i=0; i<${#string}; i++)); do
	ch=$(convert "${string:$i:1}")
        if [ "$ch" != "" ]; then
	     echo "$ch" | ./hid-gadget-test /dev/hidg0 keyboard
        fi
done
echo 'return' |  ./hid-gadget-test /dev/hidg0 keyboard
sleep 5
#echo 'return' |  ./hid-gadget-test /dev/hidg0 keyboard
echo 'right' |  ./hid-gadget-test /dev/hidg0 keyboard
echo 'space' |  ./hid-gadget-test /dev/hidg0 keyboard
sleep 5
. ./send_pin.sh
