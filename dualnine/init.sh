#!/sbin/sh

if [[ ! -f /data/dualnine/params/slot ]]; then
    mkdir -p /data/dualnine/params/;
    touch /data/dualnine/params/slot;
    echo "a" > /data/slot/params/slot;
    ui_print " ";
    setprop ro.dualnine.slot a;
fi
