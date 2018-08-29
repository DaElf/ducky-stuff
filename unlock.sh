#!/bin/bash

sudo chmod 666 /dev/hidg0

echo 'left-ctrl left-alt del' | ./hid-gadget-test /dev/hidg0 keyboard
sleep 1 
echo 'return' |  ./hid-gadget-test /dev/hidg0 keyboard
sleep 10

. ./send_pin.sh

