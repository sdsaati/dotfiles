#!/bie/zsh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

# I added this line to run the dwm :)
#exec ./home/$whami/dwm/dwm
#exec /home/ghost/Downloads/xrandr.sh &
/home/ghost/dwm/dwm
