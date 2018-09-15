#!/bin/bash

sudo chmod 666  /dev/hidg0
export PATH=$PATH:$(pwd)/Raspberry-Pi-Zero-Rubber-Ducky-Duckberry-Pi

echo 'left-ctrl left-alt del' | hid-gadget-test /dev/hidg0 keyboard
sleep 3 
echo 'return' |  hid-gadget-test /dev/hidg0 keyboard
sleep 3 

string=$(cat user_name)
for((i=0; i<${#string}; i++)); do
	ch=${string:i:1}
	echo $ch | hid-gadget-test /dev/hidg0 keyboard
	sleep 0.1
done

for((i=0; i<4; i++)); do
	echo 'tab' |  hid-gadget-test /dev/hidg0 keyboard
done
echo 'return' |  hid-gadget-test /dev/hidg0 keyboard

for((i=0; i<2; i++)); do
	echo 'tab' |  hid-gadget-test /dev/hidg0 keyboard
done
echo 'return' |  hid-gadget-test /dev/hidg0 keyboard

sleep 5

. ./send_pin.sh

