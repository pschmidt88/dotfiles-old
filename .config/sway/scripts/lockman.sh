#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout  5 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

# pause music before locking screen
playerctl -a pause

# Locks the screen immediately
swaylock -f -C ~/.config/swaylock/config
# Kills last background task so idle timer doesn't keep running
kill %%
