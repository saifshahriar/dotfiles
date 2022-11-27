#!/usr/bin/env lua
--
--  _______      _____ _______
-- /  ____/ /\  /_   _/  ____/ Author:	Saif Shahriar
-- \ (___  /  \   | | | |___   Web:		https://saifshahriar.github.io/
--  \___ \/ /\ \  | | |  __/   GitHub:	https://github.com/saifshahriar
--  ____)/ ____ \_| |_| |      GitLab:	https://gitlab.com/saifshahriar
-- \____/_/    \_\____|_|      License:	MIT
--
-- My basic awesomewm config. 

pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({ preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors }
	)
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true
			
		naughty.notify({ 
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err) 
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Func def
local bf 				= beautiful
local f = string.format

gaps			= 3
smartgaps		= true
rounded_border	= true
border_radius	= 10
barheight		= 30
font			= "JetBrainsMono Nerd Font"
fontsize		= "10"

-- Define Keys
mod 			= "Mod4"
shift			= "Shift"
ctrl			= "Control"
meta			= "Mod1"

-- Define Programmes
terminal		= "st"
browser			= "firefox"
editor			= os.getenv("EDITOR") or "vim"
editor_cmd		= terminal .. " -e "..editor
launcher		= string.format("dmenu_run -p 'Run: ' -fn '%s:pixelsize=12' -h %d", font, barheight)
file_manager	= "thunar"
gui_editor		= "lapce"

awesomedir 		= os.getenv("HOME").."/.config/awesome/"

-- Colors
color = {
	bg 		= "#1a1b26",
	fg 		= "#c0caf5",
	blue 	= "#7aa2f7",
	green 	= "#9ece6a",
	red		= "#f7768e"
}

-- WM Config
local options = {
	border_width		= 3,
	border_single_client= false,
	wibar_opacity		= 0.75,
	menu_height			= 25,
	menu_width			= 185,
	menu_border_width	= 0,
	menu_submenu_icon	= " ",
	hotkeys_group_margin= 5,

	-- Theming
	border_focus 		= color.blue,
	border_normal		= color.bg,
	wibar_bg 			= color.bg,
	wibar_fg 			= color.fg,
	taglist_fg_focus 	= color.blue,
	taglist_bg_focus 	= color.bg,
	taglist_fg_occupied	= color.green,
	taglist_fg_urgent	= color.fg,
	taglist_bg_urgent	= color.red,
	menu_fg_normal 		= color.fg,
	menu_bg_normal 		= color.bg,
	menu_fg_focus		= color.bg,
	menu_bg_focus 		= color.blue,
	hotkeys_bg 			= color.bg,
	hotkeys_fg 			= color.green,
	hotkeys_border_color= color.blue,
	hotkeys_modifiers_fg= color.blue,
	prompt_fg 			= color.fg,
	prompt_bg 			= color.bg,
	bg_systray			= color.bg,
	systray_icon_spacing= 3,
	hotkeys_shape		= function(cr, w, h) gears.shape.rounded_rect(cr, w, h, border_radius) end,

	-- Custom icons for layout
	layout_fairv		= awesomedir .. "icons/" .. "fairv.png",
	layout_tile			= awesomedir .. "icons/" .. "tile.png",

	-- Defined above 
	useless_gap			= gaps,
	wibar_height		= barheight,
	font				= font .. " " .. fontsize,
	hotkeys_font 		= font,
	hotkeys_description_font = font,
}

for k, v in pairs(options) do
	beautiful[k] = v
end

-- Remove small squares that indicates occupied tags
bf.taglist_squares_sel	= nil
bf.taglist_squares_unsel= nil

-- }}}

-- {{{ User defined function for extension
-- If alacritty exists then alacritty or kitty or xterm
-- function t_split(s, delimiter)
--     result = {};
--     for match in (s..delimiter):gmatch("(.-)"..delimiter) do
--         table.insert(result, match);
--     end
--     return result;
-- end

-- guess_terminal = function()
-- 	if io.open("/usr/bin/alacritty", "r") then
-- 		return "alacritty"
-- 	else
-- 		local term_list = {"kitty", "xfce4-terminal", "gnome-terminal", "urxvt", "terminator", "xterm"}
-- 		for i in ipairs(term_list) do
-- 			if io.open("/usr/bin/"..i, "r") then
-- 				return i
-- 			else
-- 				io.popen("notify-send -u critical \"No terminal detected. Set your terminal manually in ~/.config/awesome/rc.lua\"")
-- 			end
-- 		end
-- 	end
-- end

-- No border when there smartgaps is on
if smartgaps then
	beautiful.gap_single_client = false
end
screen.connect_signal("arrange", function(s)
	local only_one = #s.tiled_clients == 1
	for _, c in pairs(s.clients) do
		if only_one and not c.floating or c.maximized then
			c.border_width = 0
		else
			c.border_width = bf.border_width
		end
	end
	-- Rounded corners
	if rounded_border == true then
		client.connect_signal("manage", function (c)
		    c.shape = function(cr,w,h)
				if #s.tiled_clients == 1 then
					gears.shape.rounded_rect(cr, w, h, 0)
				else
					gears.shape.rounded_rect(cr, w, h, border_radius)
				end
		    end
		end)
	end
end)

-- Function to resize windows from four direction
local dpi = xresources.apply_dpi
local floating_resize_amount = dpi(20)
local tiling_resize_factor = 0.05
local capi = { client = client, mouse = mouse }

function resize_client(c, direction)
	if c and c.floating or awful.layout.get(capi.mouse.screen) == awful.layout.suit.floating then
		if direction == "up" then
			c:relative_move(0, 0, 0, -floating_resize_amount)
		elseif direction == "down" then
			c:relative_move(0, 0, 0, floating_resize_amount)
		elseif direction == "left" then
			c:relative_move(0, 0, -floating_resize_amount, 0)
		elseif direction == "right" then
			c:relative_move(0, 0, floating_resize_amount, 0)
		end
	elseif awful.layout.get(capi.mouse.screen) ~= awful.layout.suit.floating then
		if direction == "up" then
			awful.client.incwfact(-tiling_resize_factor)
		elseif direction == "down" then
			awful.client.incwfact(tiling_resize_factor)
		elseif direction == "left" then
			awful.tag.incmwfact(-tiling_resize_factor)
		elseif direction == "right" then
			awful.tag.incmwfact(tiling_resize_factor)
		end
	end
end

local myprompt = awful.widget.prompt {
	prompt = "Run: ",
	visible = true,
}

--- {{{ Layouts
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.fair,
}
--- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "Hotkeys",		function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual",		terminal .. " -e man awesome" },
   { "Run Prompt",	function() myprompt:run() end },
   { "Edit config",	editor_cmd .. " " .. awesome.conffile },
   { "Reload WM",	awesome.restart },
   { "Quit",		function() awesome.quit() end },
}


myapps_multimedia_anicli_cmd = {
	{ "New Anime  ", terminal .. " -e ani-cli" },
	{ "Continue...", terminal .. " -e ani-cli -c"},
}

myapps_multimedia = {
	{ "Ani-Cli           ",myapps_multimedia_anicli_cmd},
	{ "VLC",			vlc},
}

myapps = {
	{ "Multimedia        ", myapps_multimedia},
}

mywallpapers = {
	{ "Browse", 	"nitrogen"},
	{ "Restore",	"nitrogen --restore"}
}

mymainmenu = awful.menu({ 
	items = { 
		{ "  Awesome        ",	myawesomemenu}, -- beautiful.awesome_icon },
		{ "  Applications   ", 	myapps, " ",},
		{ "  Browser",				browser},
		{ "  File Manager", 		file_manager },
		{ "  Launcher",			launcher },
		{ "  Terminal", 			terminal },
		{ "  Text Editor",			gui_editor },
		{ "  Wallpapers     ",	mywallpapers}
	}
})

mylauncher = awful.widget.launcher({
	-- image = beautiful.awesome_icon,
	menu = mymainmenu 
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Create a textclock widget
-- See: https://elv13.github.io/widgets/wibox.widget.textclock.html
mytextclock = wibox.widget.textclock("%a %b %e, %I:%M %p")

-- Systray
mysystray = wibox.layout.margin(wibox.widget.systray(), 5, 5, 5, 5)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end),
	awful.button({ mod }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ mod }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
	awful.button({ }, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{raise = true}
			)
		end
	end),
	awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 250 } }) end),
	awful.button({ }, 4, function() awful.client.focus.byidx(1) end),
	awful.button({ }, 5, function() awful.client.focus.byidx(-1) end)
)

local function set_wallpaper(s)
	os.execute("nitrogen --restore")
	-- if beautiful.wallpaper then
	--     local wallpaper = beautiful.wallpaper
	--     if type(wallpaper) == "function" then
	--         wallpaper = wallpaper(s)
	--     end
	--     gears.wallpaper.maximized(wallpaper, s, true)
	-- end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "  ", 
				"  ",
				"  ",
				"  ",
				"  ",
				"  ",
				"  ",
				"  ",
				" 漣 " 
			}, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
						   awful.button({ }, 1, function() awful.layout.inc( 1) end),
						   awful.button({ }, 3, function() awful.layout.inc(-1) end),
						   awful.button({ }, 4, function() awful.layout.inc( 1) end),
						   awful.button({ }, 5, function() awful.layout.inc(-1) end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = taglist_buttons
	}

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen  = s,
		-- filter  = awful.widget.tasklist.filter.currenttags,
		-- buttons = tasklist_buttons
	}

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			-- mylauncher,
			s.mytaglist,
			s.mypromptbox,
			myprompt
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mytextclock,
			mysystray,
			s.mylayoutbox,
		},
	}
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({ }, 3, function () mymainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
local key = {
	move = function(k, dir)
		return(awful.key(
				{mod}, k, 
				function() awful.client.focus.bydirection(dir)
					if client.focus then
						client.focus:raise()
					end
				end, 
				{ 
					description = f("Move focus to the %s", dir),
					group = "client" 
				}
		))
	end,

	swap = function(k, dir)
		return(awful.key(
				{mod, shift}, k,
				function() awful.client.swap.bydirection(dir)
					if client.focus then client.focus:raise() end
				end, 
				{
					description = f("Move focused window to the %s", dir),
					group = "client"
				}
		))
	end,

	resize = function(k, dir)
		return(awful.key(
				{mod, ctrl}, k,
				function(c) resize_client(client.focus, dir) end,
				{
					description = f("Resize window to the %s", dir),
					group = "client"
				}
		))
	end,

	cmd = function(m, k, cmd, desc, g)
		return(awful.key(m, k, cmd, { description = desc, group = g }))
	end,

	spawn = function(k, p, desc)
		return(awful.key(
				{mod}, k, 
				function() awful.spawn(p) end,
				{ description = desc, group = "launcher" }
		))
	end
}


globalkeys = gears.table.join(
	-- Switch between clients
	key.move("h",		"left"),
	key.move("l", 		"right"),
	key.move("k", 		"up"),
	key.move("j", 		"down"),
	-- Same thing using arrow keys
	key.move("Left",	"left"),
	key.move("Right",	"right"),
	key.move("Up",		"up"),
	key.move("Down",	"down"),

	-- Swap clients
	key.swap("h",		"left"),
	key.swap("l", 		"right"),
	key.swap("k", 		"up"),
	key.swap("j", 		"down"),
	-- Same thing using arrow keys
	key.swap("Left",	"left"),
	key.swap("Right",	"right"),
	key.swap("Up",		"up"),
	key.swap("Down",	"down"),

	-- Control window size
	key.resize("h",		"left"),
	key.resize("l", 	"right"),
	key.resize("k", 	"up"),
	key.resize("j", 	"down"),
	-- Same thing using arrow keys
	key.resize("Left",	"left"),
	key.resize("Right",	"right"),
	key.resize("Up",	"up"),
	key.resize("Down",	"down"),

	-- Move between tags
	key.cmd({mod, meta}, "h",	 awful.tag.viewprev, "Goto next tag", "tag"),
    key.cmd({mod, meta}, "l",	 awful.tag.viewnext, "Goto prev tag", "tag"),
	key.cmd({mod, meta}, "Left", awful.tag.viewprev, "Goto next tag", "tag"),
    key.cmd({mod, meta}, "Right",awful.tag.viewnext, "Goto prev tag", "tag"),
	key.cmd({mod}, "Escape",	 awful.tag.history.restore,	"Toggle next/prev tag",	"tag"),
	
	key.cmd({mod}, "u",	  		awful.client.urgent.jumpto,			 "Jump to urgent client",	  "client"),
	key.cmd({mod}, "Tab",		function() awful.layout.inc( 1) end, "Switch to next layout",	  "layout"),
	key.cmd({mod, shift}, "Tab",function() awful.layout.inc(-1) end, "Switch to previous layout", "layout"),

	-- Standard program
	key.spawn("Return", terminal, f("Spawn a terminal (%s)", terminal)),
	key.spawn("d",		launcher, "Launch Dmenu"), 

	-- Awesome
	key.cmd({mod, shift}, "r", awesome.restart, "reload awesome", "awesome"),
	key.cmd({mod, shift}, "q", awesome.quit,   	"quit awesome",	  "awesome")
)

clientkeys = gears.table.join(
	key.cmd({mod}, "space", 	   awful.client.floating.toggle, 								"Toggle floating",	"layout"),
	key.cmd({mod}, "f",			   function(c) c.fullscreen = not c.fullscreen c:raise() end,	"Toggle fullscreen","layout"),
	key.cmd({mod, shift}, "space", function(c) c.maximized = not c.maximized c:raise() end,		"Toggle maximize",	"layout"),
	key.cmd({mod}, "c", 		   function(c) c:kill() end,									"Close",			"client"),
	key.cmd({mod, ctrl}, "Return", function(c) c:swap(awful.client.getmaster()) end,			"Move to master",	"client")
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,
		-- View tag only.
		awful.key({mod}, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then tag:view_only() end
			end,
			{
				description = "Goto tag #"..i,
				group = "tag"
			}
		),
		-- Toggle tag display.
		awful.key({mod, ctrl }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then awful.tag.viewtoggle(tag) end
			end,
			{
				description = "Toggle tag #" .. i,
				group = "tag"
			}
		),
		-- Move client to tag.
		awful.key({mod, shift }, "#" .. i + 9,
			function()
			    if client.focus then
			  	  local tag = client.focus.screen.tags[i]
			  	  if tag then client.focus:move_to_tag(tag) end
			   end
			end,
			{
				description = "Move focused client to tag #"..i,
				group = "tag"
			}
		),
		-- Toggle tag on focused client.
		awful.key({mod, ctrl, shift }, "#" .. i + 9,
			function()
			    if client.focus then
			  	  local tag = client.focus.screen.tags[i]
			  	  if tag then client.focus:toggle_tag(tag) end
			    end
			end,
			{
				description = "Toggle focused client on tag #" .. i,
				group = "tag"
			}
		)

	)
end

clientbuttons = gears.table.join(
	awful.button({ },	1,	function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
	awful.button({mod}, 1,	function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.move(c) end),
	awful.button({mod}, 3,	function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.resize(c) end)
)

-- Set Keys
root.keys(globalkeys)
-- }}}

-- {{{ Window Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen,
			maximized = false,
			minimized = false
		}
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA",  -- Firefox addon DownThemAll.
				"copyq",  -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
		  		"Blueman-manager",
		  		"Gpick",
		  		"Kruler",
		  		"MessageWin",  -- kalarm.
		  		"Sxiv",
		  		"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
		  		"Wpa_gui",
		  		"veromix",
		  		"xtightvncviewer",
				"Lxappearance"
			},

		-- Note that the name property shown in xprop might be set slightly after creation of the client
		-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester",		-- xev.
			},
			role = {
				"AlarmWindow",  	-- Thunderbird's calendar.
				"ConfigManager",	-- Thunderbird's about:config.
				"pop-up",			-- e.g. Google Chrome's (detached) Developer Tools.

			}
		}, properties = { 
			floating	= true,
			raise		= true,
			placement	= awful.placement.centered

		}
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	{ rule = { class = "Firefox" },
	properties = { screen = 1, tag = "1", minimized = false } },
}
-- }}}

-- {{{ Signals
-- Focus follows mouse
client.connect_signal("mouse::enter", function(c) c:emit_signal("request::activate", "mouse_enter", {raise = false}) end)

-- Border Color
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Autostart
-- os.execute(awesomedir.."scripts/autostart.sh")
os.execute("ibus-daemon &")
-- }}}
