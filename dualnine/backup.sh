#!/sbin/sh

mv /data/dualnine/inactive/ /data/dualnine/active/;
mkdir -p /data/dualnine/inactive/data/;
pigz < /dev/block/by-name/boot > /data/dualnine/inactive/boot.img.gz
pigz < /dev/block/by-name/dtbo > /data/dualnine/inactive/dtbo.img.gz
pigz < /dev/block/by-name/super > /data/dualnine/inactive/super.img.gz
ui_print "Saving userdata for current slot"
mv /data/* /data/dualnine/inactive/data/
echo "1" > /data/dualnine/params/inactive;

if [[ -f /data/dualnine/active/boot.img.gz ]]; then
    setprop ro.dualnine.restore 1
fi
