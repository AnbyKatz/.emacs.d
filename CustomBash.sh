#!/bin/bash

# Remap printscreen
xmodmap -e "keycode 107 = Hyper_L"

# Emacs client
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

# Custom Commands
alias install="sudo apt-get install"
alias python="python3.7"

# ls aliases
alias ls="ls --color"
alias lsa="ls --color -all"
alias lo="exit"
alias clc="clear"

# spelling corrections
alias mkae="make"
alias maek="make"

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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2018.3.222/linux/mkl/lib/intel64_lin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2018.3.222/linux/compiler/lib/intel64_lin/

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
