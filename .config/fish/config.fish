### Compilation flags ###
# export ARCHFLAGS="-arch x86_64"
#
### DEPENDENT PROGRAMS ###
# bat 
# exa
# reflector
# df
# free
# lynx
# ps
# xrdb
# gpg2
# starship
# neofetch
#
# ### Arch
# #	pacman
# # yay
# # paru
# ### Debian
# # apt

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
# ! TODO: set EDITOR "emacsclient -t -a ''"                 # $EDITOR use Emacs in terminal
# ! TODO: set VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode

### SET MANPAGER ###
### Uncomment only one of these!
### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command green
set fish_color_error '#ff6c6b'


### ALIAS ###

# Filesystem
#
# If you are coming from CMD
	alias cls="clear"
	alias dir="exa -al --color=always --group-directories-first"
	alias del="rm -rfv"
# 
# confirm before overwriting something
	alias mv="mv -vi"
	alias cp="cp -vi"
	alias ln="ln -vi"
	alias rm="rm -vi"
# 
# cd 	aliases
	alias ..="cd .."
# 
# mkdir aliases
	alias mkdir="mkdir -pv"
#
# Config files
	alias fishrc="vim ~/.config/fish/config.fish" 
	alias bashrc="vim ~/.bashrc"
	alias zshrc="vim ~/.zshrc"
	alias starshiprc="vim ~/.config/starship.toml"
	alias nanorc="vim ~/.nanorc"
	alias neofetchrc="vim ~/.config/neofetch/config.conf"
#
# Vim 	alias for Vi
	alias vi="vim"

### Package aliases
#
# ? [distro == Debian]	# Uncomment this block if you use Debian based disto
# apt 	aliases
# ? starts
#	alias update="sudo apt-get update"
#	alias upgrade="sudo apt-get upgrade"
#	alias sysup="sudo apt-get update && sudo apt-get upgrade"
#	alias install="sudo apt-get install"
#	alias remove="sudo apt-get remove"
#	alias autoremove="sudo apt-get autoremove"
#	alias cleanup="sudo apt-get remove && sudo apt-get autoremove"
# ? ends
#
# ? [distro == Ubuntu]	# Uncomment this block if you use Ubuntu based disto
# apt 	aliases
# ? starts
#	alias update="sudo apt update"
#	alias upgrade="sudo apt upgrade"
#	alias sysup="sudo apt update && sudo apt upgrade"
#	alias install="sudo apt install"
#	alias remove="sudo apt remove"
#	alias autoremove="sudo apt autoremove"
#	alias cleanup="sudo apt remove && sudo apt autoremove"
# ? ends
# 
# ? [distro == Arch] # Uncomment this block if you use Arch based disto
# ? starts
# pacman aliases
	alias update="sudo pacman -Syy"
	alias upgrade="sudo pacman -Syu"
	alias sysup="sudo pacman -Syyu"
	alias install="sudo pacman -Syy"
	alias remove="sudo pacman -R"
	alias autoremove="sudo pacman -Rns"
	alias cleanup="sudo pacman -Rns (pacman -Qtdq)"	 # Removes orphan packages
	alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
# more aliases
	alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
	alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
# 
# yay 	aliases
	alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
	alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
# 
# paru	aliases	
	alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
	alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
# ? ends

# ls 		aliases
	alias l="exa -al --color=always --icons --group-directories-first" 
	alias ls="exa -al --color=auto --icons --group-directories-first" 
	alias la="exa -a --color=auto --group-directories-first" 
	alias ll="exa -l --color=auto --group-directories-first" 
	alias ll="exa -aT --color=always --icons --group-directories-first" 
	alias l.='exa -a | egrep "^\."'

# get fastest mirrors
	alias mirrorbd="sudo reflector -c Bangladesh >> /etc/pacman.d/mirrorlist"
	alias mirrorin="sudo reflector -c India >> /etc/pacman.d/mirrorlist"
	alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
	alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
	alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
	alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
	
# Colorize grep output (good for log files)
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'

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

# Play audio files in current dir by type
#	alias playwav='deadbeef *.wav'
#	alias playogg='deadbeef *.ogg'
#	alias playmp3='deadbeef *.mp3'
#
# Play video files in current dir by type
#	alias playavi='vlc *.avi'
#	alias playmov='vlc *.mov'
#	alias playmp4='vlc *.mp4'
	
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
	
# switch between shells
	alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
	alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
	alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# Special aliases for this particular system
	alias systemWSL="/mnt/d/systemWSL/"
	alias systemKali="/mnt/d/systemWSL/systemKali"
	alias systemArch="/mnt/d/systemWSL/systemArch"

### RANDOM COLOR SCRIPT ###
# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
# Or install it from the Arch User Repository: shell-color-scripts
# colorscript random

### SETTING THE STARSHIP PROMPT ###
starship init fish | source

### Run neofetch at shell startup ###
neofetch
	
### Windows wslg ###
set -gx GDK_SCALE 2 #if your linux is running as wsl 
