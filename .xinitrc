#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# uim-global-valiable
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# exec gnome-session
# exec startkde
# exec startxfce4
# exec start lxde
exec start xmonad
# exec start awesome
# ...or the Window Manager of your choice

#### xmodmap(keymap)
#if[ -s ~/.Xmodmap ];then
#  xmodmap ~/.Xmodmap
#fi
xmodmap ~/.Xmodmap
# xcompmgr &

#### for xmonad
xsetroot -cursor_name left_ptr
# keyboard layout(default )
#setxkbmap -layout jp
