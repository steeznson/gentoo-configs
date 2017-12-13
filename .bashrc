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

# Perl 6

alias perl6='/home/james/Apps/Rakudo/rakudo-star-2017.10/perl6'

alias zef='perl6 /home/james/Apps/Rakudo/rakudo-star-2017.10/modules/zef/bin/zef'

# Radio

alias bbc1x='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p'

alias bbc3='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p'

alias bbc4='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p'

alias bbc6='mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_6music_mf_p'

# Shutdown

alias reboot='sudo reboot'

alias poweroff='sudo poweroff'
