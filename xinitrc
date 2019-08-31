#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -x /usr/bin/ssh-agent ]
then
	eval $(ssh-agent)
fi

~/bin/shifty &      # Shifty is a red-shift program by a Debian guy
~/bin/gpg-agent.sh
xsetroot -solid black && qiv -y ~/.wallpaper.jpg
xscreensaver &
urxvtd -q -f -o
exec startfluxbox || fvwm || xterm
#xmonad || fvwm || xterm
