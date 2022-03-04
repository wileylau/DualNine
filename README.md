# DualNine - Dual Booting made easy #

### What is this? ###
This ZIP allows devices to dualboot (or even multiBoot) different ROMs and different Android versions at ease.

### Advantages and features ###
- Works for most devices (with dynamic partitions)
- No extra kernel / recovery requirements
- Separated /data, including internal storage
- No partitioning involved (less brick risk)
- One ZIP does basically all the work
- Uses less space for inactive partition
- Supports dualbooting different android versions

### Devices Requirements ###
- Unencrypted / decrypted storage
- Devices that has dynamic partitions (check with[this app](https://play.google.com/store/apps/details?id=tk.hack5.treblecheck))
    - Some devices that have retrofitted dynamic partitions (e.g. Redmi Note 8 Pro) are UNTESTED.
- Minimum:
    - 8GB space in /data (may vary with super partition size)
- Recommended:
    - 16GB (or more) space in /data

### Tested Devices ###
- Refer [here](/misc/devices.md)

### How to build? ###
- You don't have to. Just fetch the latest release from the [releases tab](https://github.com/rain2wood/DualNine/releases).
- For bleeding edge users / devs, just clone the repo and zip it.

### How to use? ###
- NO MATTER WHAT, DO NOT SETUP PASSWORDS ON INACTIVE SLOT. 
- Remove passwords before you swap slots!
- Flash a ROM.
- Decrypt the ROM. (Important!)
- Set the ROM up (optional).
- Reboot to recovery, flash DualNine.
- After flashing DualNine, flash the other ROM you want to dualboot.
- Decrypt the ROM. (Important!)
- Reboot, and profit. You have DualNine setupped.
- To switch slots, reboot to recovery and flash DualNine ZIP again, and reboot. You will boot back into the inactive slot (the first ROM you flashed.)
- How to switch dualboot ROMs: soon
- Note that erasing /data will WIPE the DualNine installation, and you'll have to reinstall again.
- To remove dualnine, delete /data/dualnine or format data.

### How it works? ###
- The DualNine ZIP creates a directory in /data which stores your ROM in compressed format.
- When you reflash the DualNine ZIP (switch slots), the system will backup your current slot and userdata, and then restore the previously stored ROM and it's userdata.
- We are currently using pigz (Parallel GZIP) in order to save space and time.

### Credits and Thanks ###
- [Alexander Winkowski](https://github.com/dereference23)
- [Piraterex](https://github.com/piraterex)
- [Jay](https://github.com/ProtoDevNan0)
- #oofgang on Telegram for their pigz concept

### To-Do ###
- Actually check Virtual A/B support (I don't have a virtual AB devices)
- Switch to ZSTD / any faster compression tools with higher compression rate
- Perform checks on `/data` size. Compress if necessary.
- Write an Android app to ease use of DualNine
- ... and more!