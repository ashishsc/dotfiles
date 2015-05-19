export TERM=xterm-256color
if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon -s)
fi
stty -ixon
eval `ssh-agent -s`
