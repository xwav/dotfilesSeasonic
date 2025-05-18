#set date on top bar
~/xsetroot.sh & 

feh --bg-scale --randomize  ~/.config/wallpapers/* &
xcompmgr -c &
conky &

#exec dwm
while true; do
	/usr/local/bin/dwm 2> /dev/null
done
