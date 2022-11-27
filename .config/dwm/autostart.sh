#!/bin/sh

xrdb -merge ~/.config/X11/xresources

killall -9 picom xfce4-power-manager ksuperkey dunst sxhkd eww nitrogen \
    xfce-polkit

picom &
nitrogen --restore &
[ -f "$HOME"/.config/dwm/sxhkdrc ] && sxhkd -c $HOME/.config/dwm/sxhkdrc
dunst -config "$HOME"/.config/dunstrc

# Remap Caps_Lock to Escape
setxkbmap
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'clear lock'
xmodmap -e 'keycode 9 = Caps_Lock'

numlockx on

xfce4-power-manager &
/usr/lib/xfce-polkit/xfce-polkit & >> /dev/null

[ -f "$HOME"/.config/dwm/dwmbar.sh ] && "$HOME"/.config/dwmbar.sh

dwm
