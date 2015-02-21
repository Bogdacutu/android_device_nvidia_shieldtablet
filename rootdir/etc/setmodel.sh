#!/sbin/sh
set -- `cat /proc/cmdline`
model="wx_na_wf"
for x in "$@"; do
	case "$x" in board_info=*)
		id=`echo "${x#board_info=}" | cut -c 8-13`
		echo "ID = $id"
		case $id in
			"0x00ea") model="wx_na_wf" ;;
			"0x04d2") model="wx_un_do" ;;
			*) model="wx_na_do" ;;
		esac
		;;
	esac
done
echo $model
setprop ro.product.name $model
setprop ro.build.product $model
setprop ro.cm.device $model
