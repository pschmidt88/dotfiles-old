if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m $HOME/.config/polybar/launch.sh --blocks &
  done
else
  $HOME/.config/polybar/launch.sh --blocks &
fi

#MONITOR=DP-3-1 $HOME/.config/polybar/launch.sh --blocks &
#MONITOR=DP-3-2 $HOME/.config/polybar/launch.sh --blocks &

