#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9107456 4577a1cfeb73b5c782bc4af0a4dbae50a68bb7e7 6819840 1498c656dc02f3828ca4c97ef5ddcb7fbe2f03e8
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9107456:4577a1cfeb73b5c782bc4af0a4dbae50a68bb7e7; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6819840:1498c656dc02f3828ca4c97ef5ddcb7fbe2f03e8 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 4577a1cfeb73b5c782bc4af0a4dbae50a68bb7e7 9107456 1498c656dc02f3828ca4c97ef5ddcb7fbe2f03e8:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
