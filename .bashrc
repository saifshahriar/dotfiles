#  _______      _____ _______
# /  ____/ /\  /_   _/  ____/ Author:	Saif Shahriar
# \ (___  /  \   | | | |___   Web:	https://saifshahriar.github.io/
#  \___ \/ /\ \  | | |  __/   GitHub:	https://github.com/saifshahriar
#  ____)/ ____ \_| |_| |      GitLab:	https://gitlab.com/saifshahriar
# \____/_/    \_\____|_|      License:	MIT
#
# My bash shell configuration file.

###########################################
### 		EXPORT			###
###########################################
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_RUNTIME_DIR=/run/user/"$UID"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export GOPATH="$XDG_DATA_HOME"/go
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history

export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups	# no duplicate entries
export HISTFILE="$HOME"/.cache/bash_history
export EDITOR="vim"
export VISUAL="vim"
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###########################################
### 		SHOPT			###
###########################################
shopt -s autocd				# change to named directory
shopt -s cdspell			# autocorrects cd misspellings
shopt -s cmdhist			# save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend			# do not overwrite history
HISTSIZE=100
HISTFILESIZE=100
shopt -s expand_aliases			# expand aliases
shopt -s checkwinsize			# checks term size when bash regains control
if ! shopt -oq posix; then		# enable programmable completion features 
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
	if [ -f "$1" ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		unrar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*.7z)		7z x $1			;;
			*.deb)		ar x $1			;;
			*.tar.xz)	tar xf $1		;;
			*.tar.zst)	unzstd $1		;;
			*)		echo "'$1' cannot be extracted via ex()";;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

###########################################
###		BASH PROMPT		###
###########################################
PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes
PS1='\[\e[0;31m\][\[\e[0;33m\]\u\[\e[0;32m\]@\[\e[0;34m\]\h \[\e[0;35m\]\w\[\e[0;31m\]] \[\e[0;32m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\n\[\e[0;33m\]$ \[\e[0m\]'

###########################################
### 		ALIASES			###
###########################################
### Filesystem
	alias ..="cd .."
	alias mkdir="mkdir -pv"
	alias la="ls -a --color=auto --group-directories-first"
	alias l="ls -alh --color=always --group-directories-first"
	# alias ls="ls -alh --color=auto --group-directories-first"
	alias ll="ls -lh --color=auto --group-directories-first"
	alias lt="tree"
	alias l.='ls -a | egrep "^\."'

# If you are coming from CMD. I mean no one does that, but I like these commands.
	alias cls="clear"
	alias dir="ls -alh --color=always --group-directories-first"
	alias del="rm -rfv"

# Always confirm before overwriting something && verbose mode.
	alias mv="mv -v"
	alias cp="cp -v"
	alias ln="ln -v"
	alias rm="rm -v"

### Config files
# Shells
	alias shrc="$EDITOR ~/.shrc"
	alias bashrc="$EDITOR ~/.bashrc"
	alias zshrc="$EDITOR ~/.zshrc"
	alias fishrc="$EDITOR ~/.config/fish/config.fish"
# Window manager
	alias bspwmrc="$EDITOR ~/.config/bspwm/bspwmrc"
	alias sxhkdrc="$EDITOR ~/.config/sxhkd/sxhkdrc"
	alias iwmrc="$EDITOR ~/.config/i3/config"
# Editor
	alias vimrc="$EDITOR ~/.vimrc"
	alias nanorc="$EDITOR ~/.nanorc"
# Misc
	alias starshiprc="$EDITOR ~/.config/starship.toml"
	alias neofetchrc="$EDITOR ~/.config/neofetch/config.conf"

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
	alias nv="nvim"
	alias v="vim"
# media
	# Watch anime:
	alias anime='ani-cli'
	alias animec='ani-cli -c'	# continue watching anime 

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
	alias df='df -h'                          # human-readable sizes
	alias free='free -m'                      # show sizes in MB
	alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
	alias vifm='./.config/vifm/scripts/vifmrun'
	alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
	alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'
	
# ps
	alias psa="ps auxf"
	alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
	alias psmem='ps auxf | sort -nr -k 4'
	alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
	alias merge='xrdb -merge ~/.Xresources'

# git
	alias addup='git add -u'
	alias addall='git add .'
	alias branch='git branch'
	alias checkout='git checkout'
	alias clone='git clone'
	alias commit='git commit -m'
	alias fetch='git fetch'
	alias pull='git pull origin'
	alias push='git push origin'
	alias tag='git tag'
	alias newtag='git tag -a'

# get error messages from journalctl
	alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
	alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
	alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
# wget
	alias wget=wget --hsts-file="$XDG_DATA_HOME"/wget-hsts
	
# change login shells
	alias tobash="doas chsh $USER -s /bin/bash && echo 'Now log out.'"
	alias tozsh="doas chsh $USER -s /bin/zsh && echo 'Now log out.'"
	alias tofish="doas chsh $USER -s /bin/fish && echo 'Now log out.'"

### Package aliases
#
# ? [distro == Debian || Ubuntu]	# Uncomment this block if you use Debian based disto
# apt 	aliases
# ? starts
#	alias update="doas apt update"
#	alias upgrade="doas apt upgrade"
#	alias sysup="doas apt update && doas apt upgrade"
#	alias install="doas apt install"
#	alias remove="doas apt remove"
#	alias autoremove="doas apt autoremove"
#	alias cleanup="doas apt remove && doas apt autoremove"
# ? ends
#
# ? [distro == Arch] # Uncomment this block if you use Arch based disto
# ? starts
# pacman aliases
	alias install="doas pacman -S"
	alias pacsyy="doas pacman -Syy"
	alias pacsyu='doas pacman -Syu'                  # update only standard pkgs
	alias pacsyyu='doas pacman -Syyu'                # Refresh pkglist & update standard pkgs
	alias pacr="doas pacman -R"
	alias pacrns="doas pacman -Rns"
	alias cleanup="doas pacman -Rns (pacman -Qtdq)"	 # Removes orphan packages
	alias pacunlock='doas rm /var/lib/pacman/db.lck' # remove pacman lock
#
# yay 	aliases
	alias yays="yay -S"
	alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
	alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs && AUR pkgs (yay)
#
# paru	aliases	
	alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
	alias parsyu='paru -Syu --noconfirm'             # update standard pkgs && AUR pkgs (paru)
# ? ends

###########################################
###	ADD CUSTOM ALIASES BELOW	###
###########################################	
### Special aliases for this particular system
#	alias systemWSL="cd /mnt/d/systemWSL/"
#	alias systemKali="cd /mnt/d/systemWSL/systemKali"
#	alias systemArch="cd /mnt/d/systemWSL/systemArch"
#	alias win="cd /mnt/c/Users/Saif"

#exec fish
[ $(command -v zoxide) ] && eval "$(zoxide init bash)"
