#!/bin/bash

# Source Houdini
# source /opt/hfs18.0.287/houdini_setup

# Colour terminal
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Remap printscreen
xmodmap -e "keycode 107 = Hyper_L"

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

# Recognise compiler path
source /opt/intel/bin/compilervars.sh intel64

# Exported Path variables
export PATH=$PATH:/bin/bash/
export PATH=$PATH:~/bin/compilers/
export PATH=$PATH:~/anaconda3/bin/
export TEXMFHOME=~/Dropbox/.texmf
export EDITOR=$EDITOR:emacsclient
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2020.0.166/linux/mkl/lib/intel64_lin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2020.0.166/linux/compiler/lib/intel64_lin/

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
function work_journal() {
    emacs ~/Documents/Simbiant_Local/work_journal.org &
}

function matlab() {
    CurrentDir=$(pwd)
    cd ~/Matlab/R2019a/bin
    ./matlab &
    cd $CurrentDir
    }
