#!/bin/bash

# Remap printscreen
xmodmap -e "keycode 107 = Hyper_R"

# Work movement command
alias cdw='cd ~/Dropbox/Papers/NSTidalCrust/'

# Emacs client
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

# Custom Commands
alias install="sudo apt-get install"
alias status="~/bin/dropbox.py status"
alias py="python3.7"
alias tor="bash /home/anthony/bin/tor-browser_en-US/Browser/firefox"

# ls aliases
alias ls="ls --color"
alias lsa="ls --color -all"
alias lo="exit"
alias clc="clear"

# spelling corrections
alias mkae="make"
alias maek="make"

# git commands repositories
alias update="bash ~/.emacs.d/update.sh"
alias refresh="bash ~/.emacs.d/refresh.sh"

# Halley commands
alias halleycmd="(cd /home/anthony/Documents/Games/halley-template/halley/bin/; ./halley-cmd)"

# z - jump around
source ~/.emacs.d/.z-master/z.sh

# Recognise compiler path
source /opt/intel/bin/compilervars.sh intel64

# Exported Path variables
export FC=/opt/intel/bin/ifort
export PATH=$PATH:/home/anthony/bin/
export PATH=$PATH:/bin/bash
export PATH=$PATH:/home/anthony/bin/compilers
export PATH=$PATH:/home/anthony/Dropbox/Code/Fortran/numFort
export PATH=$PATH:/home/anthony/anaconda3/bin/
export TEXMFHOME=~/Dropbox/.texmf
export EDITOR=$EDITOR:emacsclient
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/anthony/bin/PLplot/install_dir/lib/pkgconfig/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2018.3.222/linux/mkl/lib/intel64_lin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2018.3.222/linux/compiler/lib/intel64_lin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/anthony/bin/PLplot/install_dir/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/anthony/bin/PLplot/build_dir/bindings/fortran/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/anthony/bin/boost_1_66_0/stage/lib

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
