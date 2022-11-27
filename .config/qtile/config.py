#!/usr/bin/env python3
#
#  _______      _____ _______
# /  ____/ /\  /_   _/  ____/ Author:	Saif Shahriar
# \ (___  /  \   | | | |___   Web:		https://saifshahriar.github.io/
#  \___ \/ /\ \  | | |  __/   GitHub:	https://github.com/saifshahriar
#  ____)/ ____ \_| |_| |      GitLab:	https://gitlab.com/saifshahriar
# \____/_/    \_\____|_|      License:	MIT
#
# My qtile config.

# ~~ Imports ~~ #
from typing import List  # noqa: F401
from scripts import storage
import os
import subprocess
from libqtile import qtile
from libqtile import bar, layout, widget, hook
from libqtile.widget import base
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
#NOTE: `psutil` module must be installed for some of the widgets.  #Fix: Import error

# ~~ Variables ~~ #
mod = "mod4"
alt = "mod1"
shift = "shift"
ctrl = "control"
home_dir = os.path.expanduser("~")
terminal = "st"
editor = "vim"
font = "JetBrainsMono Nerd Font"
client = 1;

# ~~ Keybindings ~~ #
keys = [
	### Basic Programmes ###
	Key([mod], "Return", lazy.spawn(terminal),			desc = "Launch a terminal"),
	Key([mod], "d",	lazy.spawn(f"dmenu_run -p \"Run\" -fn \"{font}:pixelsize=12\" -h 30"),
														desc = "dmenu"),
	### Windows ###
	# Switch between windows
	Key([mod], "h", lazy.layout.left(), 	desc = "Move focus to left"),
	Key([mod], "j", lazy.layout.right(),	desc = "Move focus to right"),
	Key([mod], "k", lazy.layout.down(),		desc = "Move focus down"),
	Key([mod], "l", lazy.layout.up(),		desc = "Move focus up"),
	# Same thing using arrow keys
	Key([mod], "Left",	lazy.layout.left(),		desc = "Move focus to left"),
	Key([mod], "Right",	lazy.layout.right(),	desc = "Move focus to right"),
	Key([mod], "Down",	lazy.layout.down(),		desc = "Move focus down"),
	Key([mod], "Up",	lazy.layout.up(),		desc = "Move focus up"),
	Key([alt], "Tab",   lazy.layout.next(),		desc = "Move window focus to other window"),
    # Swap windows
	Key([mod, shift], "h", lazy.layout.shuffle_left(),	desc = "Move window to the left"),
	Key([mod, shift], "l", lazy.layout.shuffle_right(),	desc = "Move window to the right"),
	Key([mod, shift], "j", lazy.layout.shuffle_down(),	desc = "Move window down"),
	Key([mod, shift], "k", lazy.layout.shuffle_up(),	desc = "Move window up"),
	# Same thing using arrow keys
	Key([mod, shift], "Left", lazy.layout.shuffle_left(),	desc = "Move window to the left"),
	Key([mod, shift], "Right", lazy.layout.shuffle_right(),	desc = "Move window to the right"),
	Key([mod, shift], "Down", lazy.layout.shuffle_down(),	desc = "Move window down"),
	Key([mod, shift], "Up", lazy.layout.shuffle_up(), 		desc = "Move window up"),
	# Grow and shrink windows
	#+ This portion only works for monadtall layout
	Key([mod, ctrl], "h", lazy.layout.shrink(),		desc = "[monadtall] Shrink window size"),
	Key([mod, ctrl], "l", lazy.layout.grow(),		desc = "[monadtall] Grow window size"),
	Key([mod, ctrl], "Left", lazy.layout.shrink(),	desc = "[monadtall] Shrink window size"),
	Key([mod, ctrl], "Right", lazy.layout.grow(),	desc = "[monadtall] Grow window size"),
	Key([mod, ctrl], "n", lazy.layout.normalize(),	desc = "[monadtall] Normalize window size"),
	Key([mod, ctrl], "m", lazy.layout.maximize(),	desc = "[monadtall] Max size"),
	#+END
	#+ This portion only works for bsp layout
	Key([mod, ctrl], "h", lazy.layout.grow_left(),	desc = "[bsp] Grow window to the left"),
	Key([mod, ctrl], "l", lazy.layout.grow_right(),	desc = "[bsp] Grow window to the right"),
	Key([mod, ctrl], "j", lazy.layout.grow_down(),	desc = "[bsp] Grow window down"),
	Key([mod, ctrl], "k", lazy.layout.grow_up(),	desc = "[bsp] Grow window up"),
	# Same thing using arrow keys
	Key([mod, ctrl], "Left", lazy.layout.grow_left(),	desc = "[bsp] Grow window to the left"),
	Key([mod, ctrl], "Right", lazy.layout.grow_right(),	desc = "[bsp] Grow window to the right"),
	Key([mod, ctrl], "Down", lazy.layout.grow_down(),	desc = "[bsp] Grow window down"),
	Key([mod, ctrl], "Up", lazy.layout.grow_up(),		desc = "[bsp] Grow window up"),
	#+END
	# TODO: Two keybindings for inc and dec the number of master window

	### Layouts ###
	Key([mod], "Tab", lazy.next_layout(), 				desc = "Toggle between layouts"),
	Key([mod], "space", lazy.window.toggle_floating(),	desc = "Toggle floating window"),
	Key([mod, shift], "space", lazy.window.toggle_maximize(),	
														desc = "Toggle maximize window"),
	Key([mod], "f", lazy.window.toggle_fullscreen(),	desc = "Toggle fullscreen"),
	# TODO: Add keys for tag control

	### WM Controls ###
	Key([mod], "c", lazy.window.kill(),		desc = "Kill focused window"),
	Key([mod, shift], "r", lazy.restart(), 	desc = "Restart Qtile"),
	Key([mod, shift], "q", lazy.shutdown(), desc = "Quit Qtile"),

]

# ~~ Mouse Bindings ~~ #
mouse = [
	Drag([mod], "Button1", lazy.window.set_position_floating(),	start = lazy.window.get_position()),
	Drag([mod], "Button3", lazy.window.set_size_floating(),		start = lazy.window.get_size()),
	Click([mod], "Button2", lazy.window.bring_to_front())
]

# ~~ Workspaces ~~ #
# custom workspace names and initialization
class Groupings:
	def init_group_names(self):
		return [
			("", {"layout": "monadtall"}),     # Terminals
			("", {"layout": "monadtall"}),     # Web Browser
			("", {"layout": "monadtall"}),     # File Manager
			("", {"layout": "monadtall"}),     # Text Editor
			("", {"layout": "monadtall"}),     # Media
			("", {"layout": "monadtall"}),     # Music/Audio
			("", {"layout": "monadtall"}),     # Text Editor
			("", {"layout": "monadtall"}),     # Music/Audio
			("漣", {"layout": "monadtall"})     # Settings
		]

	def init_groups(self):
		return [Group(name, **kwargs) for name, kwargs in group_names]
if __name__ in ["config", "__main__"]:
	group_names = Groupings().init_group_names()
	groups = Groupings().init_groups()

for i, (name, kwargs) in enumerate(group_names, 1):
	keys.append(Key([mod], str(i), lazy.group[name].toscreen(),			desc = f"Switch to workspace {i}"))
	keys.append(Key([mod, shift], str(i), lazy.window.togroup(name),	desc = f"Send window to workspace {i}"))

# ~~ Layouts and Themes ~~ #
# colors for the bar/widgets/panel
def init_colors():
	return [["#1a1b26", "#1a1b26"],  # color 0 | bg
			["#1a1b26", "#1a1b26"],  # color 1 | bg
			["#c0caf5", "#c0caf5"],  # color 2 | fg
			["#f7768e", "#f7768e"],  # color 3 | red
			["#9ece6a", "#9ece6a"],  # color 4 | green
			["#e0af68", "#e0af68"],  # color 5 | yellow
			["#7aa2f7", "#7aa2f7"],  # color 6 | blue
			["#bb9af7", "#bb9af7"],  # color 7 | magenta
			["#7dcfff", "#7dcfff"],  # color 8 | cyan
			["#a9b1d6", "#a9b1d6"]	 # color 9 | white
		 ]

##### DEFAULT THEME SETTINGS FOR LAYOUTS #####
layout_theme = {
	"border_width": 2,
	"margin": 5,
	"font": font,
	"font_size": 10,
	"border_focus": "#7aa2f7",
	"border_normal": "#1a1b26"
}

# window layouts
layouts = [
	layout.MonadTall(
		new_client_position = 'top',
		single_margin = 0,
		single_border_width = False,
		**layout_theme
	),
	layout.Bsp(
		margin_on_single = 0,
		border_on_single = False,
		**layout_theme
	),
]

# ~~ Widgets ~~ #
def init_separator():
	return widget.Sep(
		size_percent = 60,
		margin = 5,
		linewidth = 2,
		background = colors[1],
		foreground = "#32344a"
	)

def nerd_icon(nerdfont_icon, fg_color):
	return widget.TextBox(
		font = font,
		fontsize = 15,
		text = nerdfont_icon,
		foreground = fg_color,
		background = colors[1]
	)

def init_edge_spacer():
	return widget.Spacer(
		length = 5,
		background = colors[1]
	)

colors = init_colors()
sep = init_separator()
space = init_edge_spacer()

widget_defaults = dict(
	font = font,
	# font = 'Source Code Pro Medium',
	fontsize = 12,
	padding = 5,
)

extension_defaults = widget_defaults.copy()

def init_widgets_list():
	widgets_list = [
		# Left Side of the bar
		#space,
		# widget.Image(
		#    filename = "/usr/share/pixmaps/archlinux-logo.png",
		#    background = colors[1],
		#    margin = 3
		# ),
		widget.Spacer(foreground = colors[5], background = colors[5], length = 10),
		widget.CurrentLayoutIcon(
			custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
			foreground = "#ffffff",
			background = colors[5],
			padding = -8,
			scale = 0.5
		),
		widget.CurrentLayout(foreground = "#ffffff", background = colors[5]),
		widget.Spacer(foreground = colors[5], background = colors[5], length = 6),
		# widget.Image(
		# 	filename = "~/.config/qtile/python.png",
		# 	background = colors[1],
		# 	margin = 3,
		# 	mouse_callbacks = {
		# 		'Button1': lambda: qtile.cmd_spawn(
		# 			"dmenu_run -p 'Run:' -h 32"
		# 		),
		# 		'Button3': lambda: qtile.cmd_spawn(
		# 			f'{terminal} -e {editor} {home_dir}/.config/qtile/config.py'
		# 		)
		# 	}
		# ),
		widget.GroupBox(
			font = font,
			fontsize = 15,
			foreground = colors[2],
			background = colors[1],
			borderwidth = 4,
			highlight_method = "text",
			this_current_screen_border = colors[6],
			active = colors[4],
			inactive = colors[2]
		),

		# Center bar

		widget.Spacer(
			length = bar.STRETCH,
			background = colors[1]
		),
		# sep,
		nerd_icon("﬙", colors[3]),
		widget.CPU(
			format = "{load_percent}%",
			foreground = colors[2],
			background = colors[1],
			padding = -1,
			update_interval = 2,
			mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(f"{terminal} -e htop")}
		),
		space,
		nerd_icon("",colors[4]),
		widget.Memory(
			format = "{MemUsed:.0f}{mm}",
			foreground = colors[2],
			background = colors[1],
			padding = -1,
			update_interval = 2,
			mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(f"{terminal} -e htop")}
		),
		space,
		nerd_icon("", colors[6]),
		widget.GenPollText(
			foreground = colors[2],
			background = colors[1],
			padding = -1,
			update_interval = 5,
			func = lambda: storage.diskspace('FreeSpace'),
			mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(f"{terminal} -e htop")}
		),
		space,
		nerd_icon("", colors[4]),
		widget.GenPollText(
			foreground = colors[2],
			background = colors[1],
			padding = -1,
			update_interval = 5,
			func = lambda: subprocess.check_output(f"{home_dir}/.config/qtile/scripts/num-installed-pkgs").decode("utf-8")
		),

		# Left Side of the bar

		widget.Spacer(
			length = bar.STRETCH,
			background = colors[1]
		),
		# nerd_icon(
		#    "  ",
		#    colors[6]
		# ),
		# widget.Battery(
		# 	foreground = colors[2],
		# 	background = colors[1],
		# 	format = "{percent:2.0%}"
		# ),
		space,
		space,
		nerd_icon("墳", colors[3]),
		widget.Volume(
			#padding = -1,
			foreground = colors[2],
			background = colors[1]
		),
		space,
		space,
		nerd_icon("", colors[4]),
		widget.Net(
			format = "{down} ↓↑ {up}",
			foreground = colors[2],
			background = colors[1],
			padding = -1,
			update_interval = 2,
			mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("networkmanager_dmenu")}
		),
		space,
		space,
		sep,
		space,
		space,
		nerd_icon("", colors[7]),
		widget.Clock(
			format = '%b %d-%Y',
			padding = -1,
			foreground = colors[2],
			background = colors[1]
		),
		space,
		nerd_icon("", colors[8]),
		widget.Clock(
			format = '%I:%M %p',
			padding = -1,
			foreground = colors[2],
			background = colors[1]
		),
		widget.Systray(background = colors[1]),
		space,
		space
	]
	return widgets_list

# screens/bar
def init_screens():
	return [
		Screen(
			top = bar.Bar(
				widgets = init_widgets_list(),
				size = 30,
				opacity = 0.75,
				margin = [0, 0, 0, 0]
			)
		)
	]

screens = init_screens()


# ~~ Window Rule ~~ #

# assign apps to groups/workspace
@hook.subscribe.client_new
def assign_app_group(client):
	d = {}

	# assign deez apps
	d[group_names[0][0]] = ['Alacritty', 'xfce4-terminal']
	d[group_names[1][0]] = ['Navigator', 'discord', 'brave-browser', 'midori', 'qutebrowser']
	d[group_names[2][0]] = ['pcmanfm', 'thunar']
	d[group_names[3][0]] = ['code', 'geany']
	d[group_names[4][0]] = ['vlc', 'obs', 'mpv', 'mplayer', 'lxmusic', 'gimp']
	d[group_names[5][0]] = ['spotify']
	d[group_names[6][0]] = ['lxappearance', 'gpartedbin', 'lxtask',
							'lxrandr', 'arandr', 'pavucontrol', 'xfce4-settings-manager']

	wm_class = client.window.get_wm_class()[0]
	for i in range(len(d)):
		if wm_class in list(d.values())[i]:
			group = list(d.keys())[i]
			client.togroup(group)
			client.group.cmd_toscreen(toggle = False)

main = None

# Autostart
@hook.subscribe.startup
def start_once():
	start_script = os.path.expanduser("~/.config/qtile/scripts/autostart.sh")
	subprocess.call([start_script])

@hook.subscribe.startup_once
def start_always():
	# fixes the cursor
	subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules = [
	# Run the utility of `xprop` to see the wm class and name of an X client.
	*layout.Floating.default_float_rules,
	Match(wm_class = 'Alafloat'),  	# Floating Alacritty Terminal
	Match(wm_class = 'confirmreset'), # gitk
	Match(wm_class = 'feh'),
	Match(wm_class = 'Lxappearance'),
	Match(wm_class = 'makebranch'),  	# gitk
	Match(wm_class = 'maketag'),  	# gitk
	Match(wm_class = 'Nitrogen'),
	Match(wm_class = 'ssh-askpass'),  # ssh-askpass
	Match(wm_class = 'Viewnior'),  	# Photos/Viewnior
	Match(title = 'sxiv'),
	Match(title = 'branchdialog'),  	# gitk
	Match(title = 'pinentry'),  		# GPG key password entry
], **layout_theme)
auto_fullscreen = True
auto_minimize = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

# ~~ Extension ~~ #

# vim:cc=120:tw=120
