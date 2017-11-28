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

# Standalone PHP

alias quickPHP='php -S localhost:8000 -t ~/Programming/public_html/'

# Perl 6

alias perl6='/home/james/Programming/Source/rakudo-star-2017.10/perl6'

alias zef='perl6 /home/james/Programming/Source/rakudo-star-2017.10/modules/zef/bin/zef'
