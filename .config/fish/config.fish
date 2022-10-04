#  _______      _____ _______
# /  ____/ /\  /_   _/  ____/ Author:	Saif Shahriar
# \ (___  /  \   | | | |___   Web:		https://saifshahriar.github.io/
#  \___ \/ /\ \  | | |  __/   GitHub:	https://github.com/saifshahriar
#  ____)/ ____ \_| |_| |      GitLab:	https://gitlab.com/saifshahriar
# \____/_/    \_\____|_|      License:	MIT
#
# My fish shell configuration file. Nothing much to see. Pretty basic stuff.

### Compilation flags ###
set -gx ARCHFLAGS "-arch x86_64"

###########################################
###			ADDING TO THE PATH			###
###########################################
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive && fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

###########################################
###		 		EXPORT					###
###########################################
set fish_greeting						# Supresses fish's intromessage.

set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_RUNTIME_DIR /run/user/$UID

set -gx CALCHISTFILE "$XDG_CACHE_HOME"/calc_history
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -gx GOPATH "$XDG_DATA_HOME"/go
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -gx LESSHISTFILE "$XDG_STATE_HOME"/less/history
set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME"/pass
set -gx SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
set -gx SQLITE_HISTORY "$XDG_CACHE_HOME"/sqlite_history
set -gx XCURSOR_PATH /usr/share/icons:${XDG_DATA_HOME}/icons

set -gx TERM "xterm-256color"			# Sets the terminal type.
set -gx EDITOR "vim"					# Sets the terminal type.
set -gx FILEMANAGER "pcmanfm"
	
set myEditor vim						# Sets vim as the editor globally.

###########################################
### 		SET MANPAGER 				###
###########################################
### Uncomment only one of these!
### "bat" as manpager
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
### "vim" as manpager
set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

###########################################
### 	 	SET EITHER DEFAULT 			###
###			EMACS MODE OR VI MODE		###
###########################################
function fish_user_key_bindings
	fish_default_key_bindings -M insert		# Uses VI as the default mode, but
	fish_vi_key_bindings --no-erase insert	# emacs compatiable in insert mode.
end

###########################################
###	CURSOR SHAPE IN DIFFERENT VI MODE	###
###########################################
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

###########################################
###   AUTOCOMPLETE && HIGHLIGHT COLORS  ###
###########################################
# Dracula Color Palette
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $purple
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $cyan
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment
set -g fish_color_cancel $red --reverse
set -g fish_color_option $orange

# Default Prompt Colors
set -g fish_color_cwd $green
set -g fish_color_host $purple
set -g fish_color_host_remote $purple
set -g fish_color_user $cyan

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_background
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
set -g fish_pager_color_selected_prefix $cyan
set -g fish_pager_color_selected_completion $foreground
set -g fish_pager_color_selected_description $comment
set -g fish_pager_color_secondary_background
set -g fish_pager_color_secondary_prefix $cyan
set -g fish_pager_color_secondary_completion $foreground
set -g fish_pager_color_secondary_description $comment

###########################################
###			CUSTOM FUNCTIONS			###
###########################################
# Functions needed for !! and !$
function __history_previous_command
	switch (commandline -t)
	case "!"
		commandline -t $history[1]; commandline -f repaint
	case "*"
		commandline -i !
	end
end

function __history_previous_command_arguments
	switch (commandline -t)
	case "!"
		commandline -t ""
		commandline -f history-token-search-backward
	case "*"
		commandline -i '$'
	end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
	bind -Minsert ! __history_previous_command
	bind -Minsert '$' __history_previous_command_arguments
else
	bind ! __history_previous_command
	bind '$' __history_previous_command_arguments
end

# Function for extracting different files
function ex
	switch $argv
		case *.tar.bz2
			tar xjf $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.tar.gz
			tar xzf $argv 		&& set_color green && echo "Extracted Successfully!";;
		case *.bz2
			bunzip2 $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.rar
			unrar x $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.gz
			gunzip $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.tar
			tar xf $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.tbz2
			tar xjf $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.tgz
			tar xzf $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.zip
			unzip $argv			&& set_color green && echo "Extracted Successfully!";;
		case *.Z
			uncompress $argv	&& set_color green && echo "Extracted Successfully!";;
		case *.7z
			7z x $argv			&& set_color green && echo "Extracted Successfully!";;
		case *.deb
			ar x $argv			&& set_color green && echo "Extracted Successfully!";;
		case *.tar.xz
			tar xf $argv		&& set_color green && echo "Extracted Successfully!";;
		case *.tar.zst
			unzstd $argv		&& set_color green && echo "Extracted Successfully!";;
		case *
			echo "'$argv' cannot be extracted via ex" ;;
	end
	set_color normal
end

###########################################
###		 		ALIASES					###
###########################################
### Filesystem
	alias ..="cd .."
	alias mkdir="mkdir -pv"

# Use exa instead of ls.
	alias l="exa -al --color=always --icons --group-directories-first"
	alias ls="exa -al --color=auto --icons --group-directories-first"
	alias la="exa -a --color=auto --group-directories-first"
	alias ll="exa -l --color=auto --group-directories-first"
	alias lt="exa -aT --color=always --icons --group-directories-first"
	alias l.='exa -a | egrep "^\."'

# If you are coming from CMD. I mean no one does that, but I like these commands.
	alias cls="clear"
	alias dir="exa -al --color=always --group-directories-first"
	alias del="rm -rfv"

# Always confirm before overwriting something && verbose mode.
	alias mv="mv -v"
	alias cp="cp -v"
	alias ln="ln -v"
	alias rm="rm -v"

### Config files
# Shells
	abbr -ag shrc		$EDITOR ~/.shrc
	abbr -ag bashrc		$EDITOR ~/.bashrc
	abbr -ag zshrc		$EDITOR ~/.zshrc
	abbr -ag fishrc		$EDITOR ~/.config/fish/config.fish

# Window manager
	abbr -ag awrc		$EDITOR ~/.config/awesome/rc.lua
	abbr -ag bspwmrc	$EDITOR ~/.config/bspwm/bspwmrc
	abbr -ag sxhkdrc	$EDITOR ~/.config/sxhkd/sxhkdrc
	abbr -ag iwmrc		$EDITOR ~/.config/i3/config

# Editor
	abbr -ag vimrc		$EDITOR ~/.vimrc
	abbr -ag nvrc		$EDITOR ~/.config/nvim/init.lua
	abbr -ag nanorc		$EDITOR ~/.nanorc

# Misc
	abbr -ag starshiprc	$EDITOR ~/.config/starship.toml
	abbr -ag neofetchrc	$EDITOR ~/.config/neofetch/config.conf

### Programs
# Bat 	alias
	alias bat='bat -f --italic-text=always --theme="gruvbox-dark" --pager="less -FR --RAW-CONTROL-CHARS --quit-if-one-screen --mouse" --map-syntax "*.ino:C++"  --map-syntax h:cpp'

# grep	alias. Colorize grep output (good for log files)
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias rg='rg -p'
	alias ip='ip --color=auto'

# editor
	alias edit='echo "$EDITOR is currently set as your default editor. If you want to change it, then edit the fish config file at $HOME/.config/fish/config.fish"; $EDITOR'
	abbr -ag nv	nvim
	abbr -ag v	vim
	abbr -ag e	emacs

# file manager
	abbr -ag f $FILEMANAGER

# media
	# Watch anime:
	abbr -ag	ani ani-cli
	alias anic='ani-cli -c'			# continue watching anime
	# youtube-dl
	alias yta-aac="youtube-dl --extract-audio --audio-format aac "
	alias yta-best="youtube-dl --extract-audio --audio-format best "
	alias yta-flac="youtube-dl --extract-audio --audio-format flac "
	alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
	alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
	alias yta-opus="youtube-dl --extract-audio --audio-format opus "
	alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
	alias yta-wav="youtube-dl --extract-audio --audio-format wav "
	alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# get fastest mirrors
	alias mirrorbd="doas reflector -c Bangladesh >> /etc/pacman.d/mirrorlist"
	alias mirrorin="doas reflector -c India >> /etc/pacman.d/mirrorlist"
	alias mirror="doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
	alias mirrord="doas reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
	alias mirrors="doas reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
	alias mirrora="doas reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# adding flags
	alias df='df -h'				# human-readable sizes
	alias free='free -m'			# show sizes in MB
	
# ps
	alias psa="ps auxf"
	alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
	alias psmem='ps auxf | sort -nr -k 4'
	alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
	abbr -ag merxrdb	xrdb -merge ~/.Xresources

# git
	abbr -ag addup		git add -u
	abbr -ag addall		git add .
	abbr -ag branch		git branch
	abbr -ag checkout	git checkout
	abbr -ag clone		git clone
	abbr -ag commit		git commit -m \"
	abbr -ag fetch		git fetch
	abbr -ag ga			git add .
	abbr -ag gcl		git clone
	abbr -ag gcm		git commit -m \"
	abbr -ag gd			git diff
	abbr -ag gp			git push
	abbr -ag gs			git status
	abbr -ag pull		git pull origin
	abbr -ag push		git push origin
	abbr -ag tag		git tag
	abbr -ag newtag		git tag -a

# zoxide
	abbr -ag z-		z -
	abbr -ag zz		z -
	abbr -ag zl		zi

# gpg encryption
# verify signature for isos
	alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
	alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
# wget
	alias wget="wget --hsts-file="$XDG_DATA_HOME"/wget-hsts"
	
# change login shells
	alias tobash="doas chsh $USER -s /bin/bash 	&& echo 'Now log out.'"
	alias tozsh="doas chsh $USER -s /bin/zsh 	&& echo 'Now log out.'"
	alias tofish="doas chsh $USER -s /bin/fish 	&& echo 'Now log out.'"

### Package aliases
#
# ? [distro == Debian || Ubuntu]	# Uncomment this block if you use Debian based disto
# apt 	aliases
# ? starts
#	abbr -ag update		doas apt update
#	abbr -ag upgrade	doas apt upgrade
#	abbr -ag sysup		doas apt update && doas apt upgrade
#	abbr -ag install	doas apt install
#	abbr -ag remove		doas apt remove
#	abbr -ag autoremove	doas apt autoremove
#	abbr -ag cleanup	doas apt remove && doas apt autoremove
# ? ends
#
# ? [distro == Arch] # Uncomment this block if you use Arch based disto
# ? starts
# pacman aliases
	abbr -ag pac 		doas pacman
	abbr -ag pacman 	doas pacman
	abbr -ag pacs		doas pacman -S
	abbr -ag install	doas pacman -S
	abbr -ag pacsyy		doas pacman -Syy
	abbr -ag pacsyu		doas pacman -Syu			# update only standard pkgs
	abbr -ag pacsyyu	doas pacman -Syyu			# Refresh pkglist & update standard pkgs
	abbr -ag pacr 		doas pacman -R
	abbr -ag pacrns		doas pacman -Rns
	abbr -ag cleanup	doas pacman -Rns (pacman -Qtdq)		# Removes orphan packages
	abbr -ag pacunlock	doas rm /var/lib/pacman/db.lck		# remove pacman lock
#
# yay 	aliases
	abbr -ag yays		yay -S
	abbr -ag yaysua		yay -Sua --noconfirm			# update only AUR pkgs (yay)
	abbr -ag yaysyu		yay -Syu --noconfirm			# update standard pkgs && AUR pkgs (yay)
#
# paru	aliases	
	abbr -ag parsua		paru -Sua --noconfirm			# update only AUR pkgs (paru)
	abbr -ag parsyu		paru -Syu --noconfirm			# update standard pkgs && AUR pkgs (paru)
# ? ends

###########################################
###		ADD CUSTOM ALIASES BELOW		###
###########################################	
# Additional config file
#

########################################### Run these programs whenever the
###				STARTUP					### shell starts. NOTE: This may slow
########################################### down the shell during startup.
### Run zoxide | The rust replacement for cd ###
zoxide init fish | source
### SETTING THE STARSHIP PROMPT ###		# NOTE: This might slow down the prompt.
# starship init fish | source
# Run either one of them
# colorscript random					# Random Color Script
										# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
										# Or install it from the Arch User Repository: yay -S shell-color-scripts
# neofetch								# Neofetch, system information fetching tool.
# fastfetch								# neofetch but written in C. Faster &&
										# better performance. Use it instead of
										# neofetch in Arch Linux.
# pfetch								# Minimalist neofetch.
										# Install it from AUR: yay -S pfetch-btw.

# vim:ft=sh:sw=4:ts=4:noet
