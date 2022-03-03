#!/sbin/sh

pigz -d -c /data/dualnine/active/boot.img.gz > /dev/block/by-name/boot;
pigz -d -c /data/dualnine/active/dtbo.img.gz > /dev/block/by-name/dtbo;
pigz -d -c /data/dualnine/active/super.img.gz > /dev/block/by-name/super;
mv /data/dualnine/active/data/* /data/
rm -rf /data/dualnine/active/;
