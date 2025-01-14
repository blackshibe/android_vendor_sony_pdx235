#!/vendor/bin/sh

pcbid=`cat /sys/bus/platform/drivers/HardwareInfo/HardwareInfo/modem_id`
fsg_flag_path="/mnt/vendor/persist/flag/fsg_flag"
dvt_fsg_flag_path="/mnt/vendor/persist/flag/dvt_fsg_flag"
current_time=`date +%Y%m%e%H%M%S`

echo "pcbid is : $pcbid"
if [ ! -f $dvt_fsg_flag_path ];then

    case "$pcbid" in
        "A4")
        if [ -f /vendor/etc/fsg/A_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/A_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
            echo "write A4 fsg"
        fi
        ;;
        "K4")
        if [ -f /vendor/etc/fsg/K_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/K_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
            echo "write K4 fsg"
        fi
        ;;
        "J4")
        if [ -f /vendor/etc/fsg/J_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/J_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
            echo "write J4 fsg"
        fi
        ;;
        "C2")
        if [ -f /vendor/etc/fsg/C_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/C_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
            echo "write C2 fsg"
        fi
        ;;
        "N4")
        if [ -f /vendor/etc/fsg/N_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/N_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
            echo "write N4 fsg"
        fi
        ;;
    esac

touch $fsg_flag_path
touch $dvt_fsg_flag_path
echo $pcbid_$current_time > $fsg_flag_path
echo $pcbid_$current_time > $dvt_fsg_flag_path

fi
