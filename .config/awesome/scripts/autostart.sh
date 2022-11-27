#!/bin/sh

awesomedir="$HOME/.config/awesome"

# set background
# sh $awesomedir/scripts/.fehbg

# Kill if already running
killall -9 picom xfce4-power-manager ksuperkey dunst sxhkd eww nitrogen \
	lxsession

# Launch Conkeww
#sed -i "s/colors\/color-.*/colors\/color-dracula.yuck\")/g" $HOME/.config/conkeww/eww.yuck
#eww --config $HOME/.config/conkeww/ open conkeww-main

# start hotkey daemon
exec sxhkd --c $awesomedir/sxhkdrc &

# Launch notification daemon
dunst -config $awesomedir/dunstrc &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Remap Caps_Lock to Escape
setxkbmap
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'clear lock'
xmodmap -e 'keycode 9 = Caps_Lock'

numlockx on

# power manager and picom start
xfce4-power-manager &
picom --experimental-backends

#/usr/lib/xfce-polkit/xfce-polkit & >> /dev/null
lxsession & >> /dev/null

xrandr -s 1360x768
nitrogen --restore
