#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.

### DEFAULTS (mostly: see bash(1) for more options) ###
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# cd into directory merely by typing directory name	
shopt -s autocd		

# infinite history
HISTSIZE=-1
HISTFILESIZE=-1	

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|kitty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    red=$(tput setaf 12)
    yellow=$(tput setaf 11)
    purple=$(tput setaf 13)
    bold=$(tput bold)
    reset=$(tput sgr0)
    PS1='${debian_chroot:+($debian_chroot)}\[$purple$bold\][\[$yellow$bold\]\u@\h \[$red$bold\]\W\[$purple$bold\]]\[$reset\]$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

case ${TERM} in 
       xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*|kitty*)     
               PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
                       ;;  
       screen*)   
               PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'    
                       ;;
esac

### CUSTOM EXPORTS ###

# use vim for man
export MANPAGER="vim -M +MANPAGER -"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# custom PATH settings
export PATH="$HOME/Documents/Grading/GradingUtilities:$PATH"; 

# useful lynx settings for execution
export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
export LYNX_LSS="$HOME/.config/lynx/lynx.lss"

# XDG base environment variables
export XDG_CONFIG_HOME="$HOME/.config";
export XDG_CACHE_HOME="$HOME/.cache";
export XDG_DATA_HOME="$HOME/.local/share";
export XDG_STATE_HOME="$HOME/.local/share";

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc";
export SSB_HOME="$XDG_DATA_HOME/zoom"; # very suspicious
export WGETRC="$XDG_CONFIG_HOME/wgetrc";

# QT graphical application theme env variable
export QT_QPA_PLATFORMTHEME=qt5ct

### CUSTOM ALIASES ###

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# improved (with exa) ls aliases
alias ll='exa -alF --group-directories-first'
alias la='exa -A --group-directories-first'
alias l='exa -CF --group-directories-first'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# making 'rm' safer
alias rm="rm -i"

# convenience program aliases
useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.118    0.79 Safari/537.1 Lynx"
alias lynx="lynx --useragent='$useragent'"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download audio only 
alias ccat="highlight --out-format=ansi" # color cat
alias journalctl='journalctl --utc -o short-precise --no-hostname'
alias ssh="kitty +kitten ssh"

### CUSTOM ENVIRONMENT STUFF ###
set -o vi
. "$HOME/.cargo/env"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# GPG Agent
export GPG_TTY=$(tty)
