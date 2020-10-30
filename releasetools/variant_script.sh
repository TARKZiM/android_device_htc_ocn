#!/sbin/sh

export SYSDEV="$(readlink -nf "/dev/block/bootdevice/by-name/system")"
export SYSFS="ext4"

determine_system_mount() {
  if grep -q -e"^$SYSDEV" /proc/mounts; then
    umount $(grep -e"^$SYSDEV" /proc/mounts | cut -d" " -f2)
  fi

  if [ -d /mnt/system ]; then
    SYSMOUNT="/mnt/system"
  elif [ -d /system_root ]; then
    SYSMOUNT="/system_root"
  else
    SYSMOUNT="/system"
  fi

  export S=$SYSMOUNT/system
}

mount_system() {
  mount -t $SYSFS $SYSDEV $SYSMOUNT -o rw,discard
}

unmount_system() {
  umount $SYSMOUNT
}

determine_system_mount

mount_system

cp -f $S/vendor/lib64/libril-qc-ltedirectdisc.so.dugl $S/vendor/lib64/libril-qc-ltedirectdisc.so
rm -f $S/vendor/lib64/libril-qc-ltedirectdisc.so.dugl

cp -f $S/vendor/lib64/libril-qc-qmi-1.so.dugl $S/vendor/lib64/libril-qc-qmi-1.so
rm -f $S/vendor/lib64/libril-qc-qmi-1.so.dugl

cp -f $S/vendor/lib64/libril-qc-radioconfig.so.dugl $S/vendor/lib64/libril-qc-radioconfig.so
rm -f $S/vendor/lib64/libril-qc-radioconfig.so.dugl

cp -f $S/vendor/lib64/libril-qcril-hook-oem.so.dugl $S/vendor/lib64/libril-qcril-hook-oem.so
rm -f $S/vendor/lib64/libril-qcril-hook-oem.so.dugl

unmount_system

exit 0
