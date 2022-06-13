#!/usr/bin/env bash
#
#   Script for locking the screen.
#   Script is bound to a keyshortcut by i3 in its configuration file.
#   
#   REQUIRES: imagemagik, i3lock
#################################################################################

LOCK_ICON="lock.png"

blur_and_lock() {
    # Blur
    convert x:root -blur 0x5 /tmp/screen.png

    # Pixelate
    #convert x:root -scale 10% -scale 1000% /tmp/screen.png

    [[ -f $LOCK_ICON ]] && convert /tmp/screen.png $LOCK_ICON -gravity center -composite -matte /tmp/screen.png
    #dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
    
    i3lock -n -i /tmp/screen.png
    rm /tmp/screen.png
}


