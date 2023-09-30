#!/bin/sh

cd /sys/kernel/config/usb_gadget

# Get first available UDC, assume only one is available
UDC=$(ls -1 /sys/class/udc/ | head -1)

# Enable default gadget if client device is connected
if [ -z $(grep '[^[:space:]]' default/UDC) ]; then
    echo "" > accessory/UDC
    echo "$UDC" > default/UDC
    logger -s -p INFO -t gadget_enable START: Client connected. Enabled default usb gadget.
fi