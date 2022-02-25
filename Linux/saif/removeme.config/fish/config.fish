if status is-interactive
    # Commands to run in interactive sessions can go here


# Hide the welcoming messege at the startup of the fish shell
	set fish_greeting	
# Run neofetch at startup
	neofetch
	
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

### ALIAS ###
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Fish shell config file alias
	alias fishrc="vim ~/.config/fish/config.fish" 

# Vim 	alias for Vi
	alias vim="vi"

# apt 	aliases
	alias update="sudo apt update"
	alias upgrade="sudo apt upgrade"
	alias sysup="sudo apt update && sudo apt upgrade"
	alias install="sudo apt install"
	alias remove="sudo apt remove"
	alias autoremove="sudo apt autoremove"
	alias rmpkg="sudo apt remove && sudo apt autoremove"

# ls 	aliases
	alias l="exa --group-directories-first --icons -l --all --all --color=auto"
	alias ls="exa --group-directories-first --icons -l --all --all --color=auto"
	alias la="exa --group-directories-first --icons -l --all --all --color=auto"


# mv, cp, ln, rm
	alias mv="mv -v -i"
	alias cp="cp -v -i"
	alias ln="ln -v -i"
	alias rm="rm -v -r"

# cd 	aliases
	alias ..="cd .."

# mkdir aliases
	alias mkdir="mkdir -pv"
	alias rmdir="rmdir --ignore-fail-on-non-empty"






# Special aliases for this particular system
	alias systemKali="cd /mnt/d/systemKali"





# For Starship Prompt
	starship init fish | source












end
