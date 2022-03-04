#!/sbin/sh

if [[ ! -f /data/dualnine/params/slot ]]; then
    mkdir -p /data/dualnine/params/;
    touch /data/dualnine/params/slot;
    echo "a" > /data/slot/params/slot;
    ui_print " ";
    setprop ro.dualnine.slot a;
fi
if [[ -f /dev/block/by-name/super ]]; then
    echo "dynamic" > /data/dualnine/params/device_type;
else
    echo "static" > /data/dualnine/params/device_type;
fi