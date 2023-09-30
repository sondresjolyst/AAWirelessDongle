#!/bin/sh

cd /sys/kernel/config/usb_gadget

# Get first available UDC, assume only one is available
UDC=$(ls -1 /sys/class/udc/ | head -1)

# Enable default gadget if bluetooth device is connected
if [ "$UDC" != "" -a "$SUBSYSTEM" = "bluetooth" -a "$DEVTYPE" = "link" -a "$ACTION" = "add" ]; then
    if [ -z $(grep '[^[:space:]]' default/UDC) ] && [ -z $(grep '[^[:space:]]' accessory/UDC) ]; then
        sleep 3
        echo "$UDC" > default/UDC
        logger -s -p INFO -t gadget_enable START: Bluetooth connected. Enabled default usb gadget.
    fi
fi