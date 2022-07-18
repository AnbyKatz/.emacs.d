#!/bin/bash

# Colour terminal
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Emacs client
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

# Custom Commands
alias install="sudo apt-get install"
alias python="python3"

# ls aliases
alias ls="ls --color"
alias lsa="ls --color -all"
alias lo="exit"
alias clc="clear"

# spelling corrections
alias mkae="make"
alias maek="make"

# Clean tex files command
alias cleantex="rm -r auto *.aux *.bbl *.log *.blg *.synctex.gz"

# z - jump around
source ~/.emacs.d/.z-master/z.sh

# Exported Path variables
export PATH=$PATH:/bin/bash/
export PATH=$PATH:~/bin/
export PATH=$PATH:~/anaconda3/bin/
export EDITOR=$EDITOR:emacsclient

# Custom functions for running emacs
function ef() {
    emacs $1.f90 &
}
function et() {
    emacs $1tex &
}
function e() {
    emacs $1 &
}

function cvm(){
    rm -rf build
    mkdir build
    cd build
    cmake ..
    make
    cd ..
    }
