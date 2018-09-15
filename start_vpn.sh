#!/bin/bash

export PATH=$PATH:$(pwd)/Raspberry-Pi-Zero-Rubber-Ducky-Duckberry-Pi

. ./Raspberry-Pi-Zero-Rubber-Ducky-Duckberry-Pi/convert.sh

echo 'space' |  hid-gadget-test /dev/hidg0 keyboard
echo 'left-meta r' |  hid-gadget-test /dev/hidg0 keyboard
sleep 0.8
echo 'return' |  hid-gadget-test /dev/hidg0 keyboard
sleep 2

function sendit()
{
    string=$1
    echo ${#string}
    for((i=0; i<${#string}; i++)); do
	ch=$(convert "${string:$i:1}")
        if [ "$ch" != "" ]; then
 	    echo "$ch" | hid-gadget-test /dev/hidg0 keyboard
	fi
    done
}

string='"c:\Program Files (x86)\Common Files\Pulse Secure\JamUI\jamCommand.exe" /stop'
sendit "$string"

echo 'return' | hid-gadget-test /dev/hidg0 keyboard
sleep 3

#string='"c:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe" & exit'
string='"c:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe"'
sendit "$string"

echo 'return' | hid-gadget-test /dev/hidg0 keyboard
sleep 5
#echo 'return' |  ./hid-gadget-test /dev/hidg0 keyboard
echo 'right' | hid-gadget-test /dev/hidg0 keyboard
echo 'space' | hid-gadget-test /dev/hidg0 keyboard
sleep 5
. ./send_pin.sh

#echo 'left-meta tab' |  ./hid-gadget-test /dev/hidg0 keyboard
