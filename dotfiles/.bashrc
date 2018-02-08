#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# Editors

export VISUAL=vim

export EDITOR=vim

alias vi=vim

# Standalone PHP

alias quickPHP='php -S localhost:8000 -t ~/Programming/public_html/'

# Radio

alias bbc1='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_p'

alias bbc1x='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p'

alias bbc2='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio2_mf_p'

alias bbc3='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p'

alias bbc4='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p'

alias bbc5='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5live_mf_p'

alias bbc5live='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8'

alias bbc6='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_6music_mf_p'

# Shutdown

alias reboot='sudo reboot'

alias poweroff='sudo poweroff'

# Weather

alias weather='curl wttr.in/edinburgh'

# News

alias news='sh ~/News/news_scraper.sh'

# wpa_supplicant

alias quickWPA='sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf'

# print battery %

alias bat='sh ~/Programming/BitsOfBash/battery.sh'

# Protege

alias protege='sh ~/Protege/Protege-5.2.0/run.sh'

# Keyboard layout

alias kdb='setxkbmap -layout gb'
