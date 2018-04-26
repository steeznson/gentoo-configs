# set rice, keymap, wallpaper, status
xrdb -merge /home/james/.Xresources &
setxkbmap -layout gb &
sh /home/james/.fehbg &
DATE="$( date '+%F %R' )"
CAP="$(df -H | grep -vE '^Filesystem|devtmpfs|tmpfs|shm|cgroup_root|none' | awk '{print$4 " " $1}')"
BAT="$( cat /sys/class/power_supply/BAT0/capacity )"
while true; do
	#xsetroot -name "$( date '+%F %R'; cat /sys/class/power_supply/BAT0/capacity )"
	xsetroot -name "$( echo $DATE $CAP $BAT% )"
    	sleep 1m;    # Update time every minute
done &
# dwm
exec dwm
