#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# Editors

export VISUAL=nvim

export EDITOR=nvim

alias vi=nvim

alias vim=nvim

# Standalone PHP

alias quickPHP='php -S localhost:8000 -t ~/Programming/public_html/'

# Radio

alias bbc1='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_p'

alias bbc1x='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p'

alias bbc2='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio2_mf_p'

alias bbc3='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p'

alias bbc4='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p'

alias bbc5='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5live_mf_p'

alias bbc6='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_6music_mf_p'

# Shutdown

alias reboot='sudo reboot'

alias poweroff='sudo poweroff'

# Weather

alias weather='curl wttr.in/edinburgh'

