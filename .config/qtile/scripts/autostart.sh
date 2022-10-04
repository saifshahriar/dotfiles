#!/bin/sh

qtdir="$HOME/.config/qtile"

# set background
# sh $qtdir/scripts/.fehbg

# Kill if already running
killall -9 picom xfce4-power-manager ksuperkey dunst sxhkd eww nitrogen \
	xfce-polkit

# Launch Conkeww
#sed -i "s/colors\/color-.*/colors\/color-dracula.yuck\")/g" $HOME/.config/conkeww/eww.yuck
#eww --config $HOME/.config/conkeww/ open conkeww-main

# start hotkey daemon
exec sxhkd --c $qtdir/sxhkdrc &

# Launch notification daemon
dunst -config $qtdir/dunstrc &

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
picom --config $qtdir/picom.conf &

/usr/lib/xfce-polkit/xfce-polkit & >> /dev/null

# replace neovim colorscheme
# sed -i "s/theme =.*$/theme = \"chadracula\",/g" $HOME/.config/nvim/lua/custom/chadrc.lua
#
# change xfce4-terminal colorscheme
# XFCE_TERM_PATH="$HOME/.config/xfce4/terminal"
# cp "$XFCE_TERM_PATH"/colorschemes/dracula "$XFCE_TERM_PATH"/terminalrc
#
# change cava colorscheme
# CAVA_PATH="$HOME/.config/cava"
# cp "$CAVA_PATH"/colorschemes/dracula "$CAVA_PATH"/config

xrandr -s 1360x768
nitrogen --restore
