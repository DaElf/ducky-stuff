#!/bin/bash

string=$(cat my_pin)
for((i=0; i<${#string}; i++)); do
	ch=${string:i:1}
	echo $ch | ./hid-gadget-test /dev/hidg0 keyboard
	sleep 0.1
done
echo 'return' |  ./hid-gadget-test /dev/hidg0 keyboard

