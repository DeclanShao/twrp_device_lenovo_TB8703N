#!/sbin/sh
# puppet13th@xda
# highwaystar_ru@xda
#dump current installed kernel
#get boot.img info
workdir=/tmp/mkboot
bootdevice=/dev/block/bootdevice/by-name/boot

busybox=$(command -v busybox)

mkdir $workdir
cd $workdir
$busybox dd if=$bootdevice of=boot.img 2>/dev/null

$busybox cat boot.img boot.sig > boot-signed.img

$busybox dd if=/boot-signed.img of=$bootdevice

rm -rf boot.img
rm -rf boot-signed.img
