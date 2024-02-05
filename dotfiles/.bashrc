# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# Editors
export VISUAL='vim'
export EDITOR='ex'

# Weather
alias weather='curl wttr.in/edinburgh'

# Mapscii
alias mapscii='telnet mapscii.me'

# News
alias news='curl -s http://feeds.bbci.co.uk/news/rss.xml?edition=int | grep -o --color=never "\[CDATA\[.*\]\]" | sed s/CDATA/\/g'
alias headlines='news | head -n 20'

# volume
alias volup="pactl set-sink-volume $(pactl list short sinks | grep analog | awk '{print $1}' | tail -n 1) +5%"
alias voldown="pactl set-sink-volume $(pactl list short sinks | grep analog |awk '{print $1}' | tail -n 1) -5%"
alias mute="pactl set-sink-mute $(pactl list short sinks | grep analog |awk '{print $1}' | tail -n 1) toggle"

# display settings
alias noblank='xset -dpms; xset s off; xset s noblank'
