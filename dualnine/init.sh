#!/sbin/sh

if [[ ! -f /data/dualnine/params/slot ]]; then
    mkdir -p /data/dualnine/params/;
    touch /data/dualnine/params/slot;
    echo "a" > /data/slot/params/slot;
    setprop ro.dualnine.slot a;
fi
if [[ -e /dev/block/by-name/super ]]; then
    echo "dynamic" > /data/dualnine/params/device_type;
else
    echo "static" > /data/dualnine/params/device_type;
fi