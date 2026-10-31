export QT_QPA_PLATFORMTHEME=qt5ct
setxkbmap us,ru -option grp:alt_shift_toggle

feh --bg-fill /path/to/background.png &
/usr/libexec/xfce-polkit &
dunst &
slstatus &

exec dbus-run-session dwm
