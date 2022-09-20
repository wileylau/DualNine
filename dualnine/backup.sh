#!/sbin/sh

SLOT=$(getprop ro.boot.slot_suffix)
D9L="$D9L"
mv $D9L/inactive/ $D9L/active/;
mkdir -p $D9L/inactive/data/;
pigz < "/dev/block/by-name/boot$SLOT" > $D9L/inactive/boot.img.gz
pigz < "/dev/block/by-name/dtbo$SLOT" > $D9L/inactive/dtbo.img.gz
pigz < /dev/block/by-name/super > $D9L/inactive/super.img.gz
if [[ -f "/dev/block/by-name/vendor_boot$SLOT" ]]; then
    pigz < "/dev/block/by-name/vendor_boot$SLOT" > $D9L/inactive/vendor_boot.img.gz
fi
ui_print "Saving userdata for current slot"
mv /data/* $D9L/inactive/data/
echo "1" > $D9L/params/inactive;

if [[ -f $D9L/active/boot.img.gz ]]; then
    setprop ro.dualnine.restore 1
fi
