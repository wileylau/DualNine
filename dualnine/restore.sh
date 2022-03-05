#!/sbin/sh

SLOT=$(getprop ro.boot.slot_suffix)
pigz -d -c /data/dualnine/active/boot.img.gz > "/dev/block/by-name/boot$SLOT";
pigz -d -c /data/dualnine/active/dtbo.img.gz > "/dev/block/by-name/dtbo$SLOT";

if [[ -e /dev/block/by-name/super ]]; then
    pigz -d -c /data/dualnine/active/super.img.gz > /dev/block/by-name/super;
else
    pigz -d -c /data/dualnine/active/system.img.gz > "/dev/block/by-name/system$SLOT";
    pigz -d -c /data/dualnine/active/vendor.img.gz > "/dev/block/by-name/vendor$SLOT";
fi

if [[ -e "/dev/block/by-name/vendor_boot$SLOT" ]]; then
    pigz -d -c /data/dualnine/active/vendor_boot.img.gz > "/dev/block/by-name/vendor_boot$SLOT";
fi

mv /data/dualnine/active/data/* /data/
rm -rf /data/dualnine/active/
