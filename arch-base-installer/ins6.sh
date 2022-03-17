passwd 

adduser -m saif
passwd saif

usermod -aG wheel,audio,video,optical,storage saif
EDITOR=vim visudo
