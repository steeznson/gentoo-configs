# set rice, keymap, wallpaper, status
xrdb -merge /home/james/.Xresources &
setxkbmap -layout gb &
sh /home/james/.fehbg &
while true; do
    xsetroot -name "$( date +"%F %R"; cat /sys/class/power_supply/BAT0/capacity )";
    sleep 1m;    # Update time every minute
done &
# dwm
exec dwm
