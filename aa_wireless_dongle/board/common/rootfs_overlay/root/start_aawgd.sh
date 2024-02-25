#!/bin/sh

while true; do
    /usr/bin/env AAWG_CONNECT_HOOK=/root/enable_gadget.sh /usr/bin/aawgd
    sleep 5
done