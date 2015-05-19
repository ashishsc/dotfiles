#!/bin/sh

# sudo apt-get install xautolock
exec xautolock \
  -time 10 -locker "~/dotfiles/linux/i3/fuzzy-lock.sh" \
  -notify 60 \
  -notifier "notify-send -u critical -t 30000 -- 'LOCKING screen in 30 seconds'" \
  -killtime 10 \
  -killer "xset dpms force off"
