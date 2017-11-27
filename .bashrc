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
