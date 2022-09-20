#!/sbin/sh

SLOT=$(getprop ro.boot.slot_suffix)
D9L="/sdcard/DualNine"
if [[ -f $D9L/boot.img.gz ]]; then
    pigz -d -c $D9L/boot.img.gz > "/dev/block/by-name/boot$SLOT";
    pigz -d -c $D9L/dtbo.img.gz > "/dev/block/by-name/dtbo$SLOT";
    pigz -d -c $D9L/super.img.gz > /dev/block/by-name/super;
    if [[ -f "/dev/block/by-name/vendor_boot$SLOT" ]]; then
        pigz -d -c $D9Lvendor_boot.img.gz > "/dev/block/by-name/vendor_boot$SLOT";
    fi
    mv $D9Ldata/* /data/
else
    mkdir -p $D9L/data/;
    pigz < "/dev/block/by-name/boot$SLOT" > $D9L/boot.img.gz
    pigz < "/dev/block/by-name/dtbo$SLOT" > $D9L/dtbo.img.gz
    pigz < /dev/block/by-name/super > $D9L/super.img.gz
    if [[ -f "/dev/block/by-name/vendor_boot$SLOT" ]]; then
        pigz < "/dev/block/by-name/vendor_boot$SLOT" > $D9L/vendor_boot.img.gz
    fi
    ui_print "Saving userdata for current slot"
    mv /data/* $D9L/data/
fi
