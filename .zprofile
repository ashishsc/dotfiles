export TERM=xterm-256color
if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon -s)
fi
stty -ixon
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape' -t 200
