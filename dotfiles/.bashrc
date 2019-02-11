#
# ~/.bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# Defaults
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Editors
export VISUAL='vim'
export EDITOR='ex'

# Standalone PHP
alias quickPHP='php -S localhost:8000 -t ~/Programming/public_html/'

# Radio
alias bbc1='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_p'
alias bbc1x='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p'
alias bbc2='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio2_mf_p'
alias bbc3='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p'
alias bbc4='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p'
alias bbc5='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live.m3u8'
alias bbc5x='mpv http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8'
alias bbc6='mpv http://bbcmedia.ic.llnwd.net/stream/bbcmedia_6music_mf_p'

# Weather
alias weather='curl wttr.in/edinburgh'

# News
alias news='sh /home/james/programming/BitsOfBash/news_scraper.sh'

# wpa_supplicant
alias quickWPA='wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf'

# download mp3 with youtube-dl
alias ytdl-mp3='youtube-dl --extract-audio --audio-format mp3'

# temporily change ownership of backlight
alias bl='chown james:james /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-LVDS-1/intel_backlight/brightness'

# show battery % remaining
alias battery='cat /sys/class/power_supply/BAT0/capacity'
