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
export VISUAL='nvim'
export EDITOR='ed'

# Radio
alias bbc1='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_one.m3u8'
alias bbc1x='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_1xtra.m3u8'
alias bbc2='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_two.m3u8'
alias bbc3='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_three.m3u8'
alias bbc4='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_fourfm.m3u8'
alias bbc5='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live.m3u8'
alias bbc5x='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8'
alias bbc6='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8'

# Weather
alias weather='curl wttr.in/edinburgh'

# News
alias news='curl -s http://feeds.bbci.co.uk/news/rss.xml?edition=int | grep -o --color=never "\[CDATA\[.*\]\]" | sed s/CDATA/\/g'
alias headlines='news | head -n 20'

# Standalone PHP
alias quickPHP='php -S localhost:8000 -t .'

# download mp3 with youtube-dl
alias ytdl-mp3='youtube-dl --extract-audio --audio-format mp3'

# volume
alias volup="pactl set-sink-volume $(pactl list short sinks | grep analog | awk '{print $1}' | tail -n 1) +5%"
alias voldown="pactl set-sink-volume $(pactl list short sinks | grep analog |awk '{print $1}' | tail -n 1) -5%"
alias mute="pactl set-sink-mute $(pactl list short sinks | grep analog |awk '{print $1}' | tail -n 1) toggle"

# display settings
alias noblank='xset -dpms; xset s off; xset s noblank'

