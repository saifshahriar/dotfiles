# <samp><b>dotfiles</b></samp> <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/saifshahriar/dotfiles?color=7aa2f7&logo=lua&logoColor=%237aa2f7&style=for-the-badge" align="right"><img src="https://img.shields.io/badge/Artix_Linux-1793D1?style=for-the-badge&color=1a1b26&logo=artix-linux&logoColor=7aa2f7" align="right" />

<div align="center">
  <img src="https://github.com/user-attachments/assets/b1b6a96f-f3da-4fc3-ad61-1aba8c117f2e" alt="dotfiles" style="width: 25%;">
</div>

<p align=center>
 <a href="https://github.com/saifshahriar/" alt="Website">
  <img alt="Website" src="https://img.shields.io/website?down_color=red&down_message=down&label=%F0%9F%8C%90%20website&up_color=blue&up_message=online&url=https%3A%2F%2Fsaifshahriar.github.io%2F">
 </a>
  <a href="https://github.com/saifshahriar/" alt="GitHub">
  <img alt="GitHub" src="https://img.shields.io/badge/GitHub-saifshahriar%20-yellowgreen?style=flat&logo=github">
 </a>
 <a href="https://gitlab.com/saifshahriar/" alt="GitLab">
  <img alt="GitLab" src="https://img.shields.io/badge/GitLab-saifshahriar%20-blue?style=flat&logo=gitlab">
 </a>
 
 <br>
 
 <a href="https://github.com/saifshahriar/dotfiles/" alt="Size">
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/saifshahriar/dotfiles">
 </a>
 <a href="https://github.com/saifshahriar/dotfiles/commits/master" alt="Commits">
  <img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/saifshahriar/dotfiles">
 </a>
 <a href="https://github.com/saifshahriar/dotfiles/commits/master" alt="Last Commit">
 <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/saifshahriar/dotfiles">
 </a>
 <a href="https://github.com/saifshahriar/dotfiles/blob/master/LICENSE" alt="License:MIT">
  <img alt="GitHub" src="https://img.shields.io/github/license/saifshahriar/dotfiles?color=yellow">
 </a>
</p>

<table align="right">
	<tr>
		<td align="center">
			<samp>
				No SoystemD!
				<br/>
				Still Arch BTW!
			<samp>
		</td>
	</tr>
<table>

My very basic dotfiles that I use everyday. Nowadays, I use `dwm` in [**Artix Linux**](https://artixlinux.org/), sometimes [**Void**](https://voidlinux.org/). Nonsystemd distros are kind of growing on me. Also, my dots are based on `doas` as prevesc, so don't copy everything blindly.

<br />

                                                                                
<div align="center">
  <img src="https://github.com/user-attachments/assets/a78574b0-7dfa-4da4-8dc3-73783311fa86" alt="setup-screenshot">
</div>

# I use
<table>
	<tr>
		<td> Distro </td> <td> Artix Linux </td>
	<tr>
	<tr>
		<td rowspan=4> Window Manager </td> <td> DWM </td>
	</tr>
	<tr>
		<td>AwesomeWM</td>
	</tr>
	<tr>
		<td>BSPWM</td>
	</tr>
	<tr>
		<td>Qtile</td>
	</tr>
	<tr>
		<td> Terminal Emmulator </td> <td> Simple Terminal - ST </td>
	</tr>
	<tr>
		<td> Shell </td> <td> Fish </td>
	</tr>
	<tr>
		<td> Compositor </td> <td> Picom (Pijulius Fork) </td>
	</tr>
	<tr>
		<td> Colorscheme </td> <td> Tokyonight </td>
	</tr>
</table>


# Filetree
_Note: Might be Outdated_
```fish
╭─[saifshahriar@git]─[dotfiles]─[master]
╰─λ exa --tree -a --group-directories-first -I .git

dotfiles
├── .config
│  ├── alacritty
│  │  ├── alacritty.yml
│  │  ├── colors.yml
│  │  └── fonts.yml
│  ├── awesome
│  │  ├── icons
│  │  │  └── ...
│  │  ├── rc.lua
│  │  └── scripts
│  │     └── ...
│  ├── bspwm
│  │  ├── bin
│  │  │  └── ...
│  │  ├── bspwmrc
│  │  ├── dunstrc
│  │  ├── picom.conf
│  │  ├── polybar
│  │  │  └── ...
│  │  ├── rofi
│  │  │  ├── bin
│  │  │  │  └── ...
│  │  │  └── themes
│  │  │     └── ...
│  │  └── themes
│  │     └── ...
│  ├── dwm
│  │  ├── autostart.sh
│  │  └── dwmbar.sh
│  ├── fish
│  │  └── config.fish
│  ├── i3
│  │  ├── config
│  │  ├── i3status.conf
│  │  └── picom.conf
│  ├── kitty
│  │  ├── current-theme.conf
│  │  └── kitty.conf
│  ├── leftwm
│  │  ├── config.ron
│  │  ├── themes
│  │  │  ├── Ascent
│  │  │  │  └── ...
│  │  │  ├── Blue-Coffee
│  │  │  │  └── ...
│  │  │  └── current -> Blue-Coffee
│  │  └── themes.toml
│  ├── lf
│  │  ├── icons
│  │  └── lfrc
│  ├── mpv
│  │  ├── mpv.conf
│  │  ├── script-opts
│  │  │  └── mpv_thumbnail_script.conf
│  │  └── scripts
│  │     └── ...
│  ├── neofetch
│  │  └── ...
│  ├── networkmanager-dmenu
│  │  └── config.ini
│  ├── nimdow
│  │  ├── barcolgen.py
│  │  ├── colors.sh
│  │  ├── config.toml
│  │  └── nimbar
│  ├── nitrogen
│  │  ├── bg-saved.cfg
│  │  └── nitrogen.cfg
│  ├── oni2
│  │  └── configuration.json
│  ├── picom
│  │  └── picom.conf
│  ├── qtile
│  │  ├── config.py
│  │  ├── dunstrc
│  │  ├── icons
│  │  │  └── ...
│  │  ├── picom.conf
│  │  ├── scripts
│  │  │  └── ...
│  │  └── sxhkdrc
│  ├── ranger
│  │  ├── commands.py
│  │  ├── plugins
│  │  │  └── ...
│  │  ├── rc.conf
│  │  ├── rifle.conf
│  │  └── scope.sh
│  ├── rofi
│  │  ├── config.rasi
│  │  └── styles
│  │     ├── askpass.rasi
│  │     ├── asroot.rasi
│  │     ├── colors.rasi
│  │     ├── confirm.rasi
│  │     ├── font.rasi
│  │     ├── launcher.rasi
│  │     ├── networkmenu.rasi
│  │     ├── powermenu.rasi
│  │     └── window.rasi
│  ├── starship.toml
│  ├── sxhkd
│  │  └── sxhkdrc
│  ├── tmux
│  │  └── tmux.conf
│  ├── wallpaper
│  │  └── kochou_shinobu_holding_butterfly_purple_wallpaper.jpg
│  ├── wezterm
│  │  └── wezterm.lua
│  └── X11
│     └── xresources
├── .gitignore
├── .local
│  ├── bin
│  │  ├── rofi_asroot
│  │  ├── rofi_launcher
│  │  ├── rofi_powermenu
│  │  └── rofi_windows
│  └── share
│     └── icons
│        └── yoru-cursor
│           ├── cursor.theme
│           ├── cursors
│           │  └── zoom-out
│           └── index.theme
├── .mozilla
│  └── firefox
│     └── release-number
│        └── chrome
│           ├── ...
│           └── userChrome.css
├── .vim
│  ├── autocmd.vim
│  ├── autoload
│  │  └── plug.vim
│  ├── core.vim
│  ├── keybinds.vim
│  ├── option.vim
│  ├── plugin.vim
│  ├── plugins
│  │  ├── dragvisuals.vim
│  │  └── statusline.vim
│  ├── pluginsopt.vim
│  ├── snippets
│  │  └── abbreviations.vim
│  ├── snips.vim
│  ├── theme.vim
│  └── vimrc
├── .bashrc
├── LICENSE
└── README.md

╭─[saifshahriar@git]─[dotfiles]─[master]
╰─λ math (exa --tree -a -I .git -D | wc -l)-1
58

╭─[saifshahriar@git]─[dotfiles]─[master]
╰─λ math (exa --tree -a -I .git | wc -l)-(exa --tree -a -I .git -D | wc -l)-1
306

58 directories, 306 files

```
