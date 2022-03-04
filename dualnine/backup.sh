#!/sbin/sh

SLOT=$(getprop ro.boot.slot_suffix)
mv /data/dualnine/inactive/ /data/dualnine/active/;
mkdir -p /data/dualnine/inactive/data/;
pigz < "/dev/block/by-name/boot$SLOT" > /data/dualnine/inactive/boot.img.gz
pigz < "/dev/block/by-name/dtbo$SLOT" > /data/dualnine/inactive/dtbo.img.gz

if [[ -f "/dev/block/by-name/super" ]]; then
    pigz < /dev/block/by-name/super > /data/dualnine/inactive/super.img.gz
else
    pigz < "/dev/block/by-name/system$SLOT" > /data/dualnine/inactive/system.img.gz
    pigz < "/dev/block/by-name/vendor$SLOT" > /data/dualnine/inactive/vendor.img.gz
fi

if [[ -f "/dev/block/by-name/vendor_boot$SLOT" ]]; then
    pigz < "/dev/block/by-name/vendor_boot$SLOT" > /data/dualnine/inactive/vendor_boot.img.gz
fi

ui_print "Saving userdata for current slot"
mv /data/* /data/dualnine/inactive/data/
echo "1" > /data/dualnine/params/inactive;

if [[ -f /data/dualnine/active/boot.img.gz ]]; then
    setprop ro.dualnine.restore 1
fi
