#!/bin/bash

# Custom Commands
alias install="sudo apt-get install"
alias status="~/bin/dropbox.py status"
alias cdhd="cd /media/anthony/Hard_Drive"
alias emacs="emacs-snapshot"
alias py="python3.7"
alias jaxo="java -jar ~/bin/jaxodraw-2.1-0/jaxodraw-2.1-0.jar"
alias cpmake="cp /home/anthony/Dropbox/Code/Fortran/numFort/{makefile,customPlot.py} ."
# ls aliases
alias ls="ls --color"
alias lsa="ls --color -all"
alias lo="exit"
alias clc="clear"

# spelling corrections
alias mkae="make"
alias maek="make"

# z - jump around
source ~/bin/z-master/z.sh

# Recognise compiler path
source /opt/intel/bin/compilervars.sh intel64

# Exported Path variables
export FC=/opt/intel/bin/ifort
export PATH=$PATH:/home/anthony/bin/
export PATH=$PATH:/bin/bash
export PATH=$PATH:/home/anthony/bin/compilers
export PATH=$PATH:/home/anthony/Dropbox/Code/Fortran/numFort
export PATH=$PATH:/home/anthony/anaconda3/bin/
export EDITOR=$EDITOR:emacsclient
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/anthony/bin/PLplot/install_dir/lib/pkgconfig/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2018.3.222/linux/mkl/lib/intel64_lin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries_2018.3.222/linux/compiler/lib/intel64_lin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/anthony/bin/PLplot/install_dir/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/anthony/bin/PLplot/build_dir/bindings/fortran/

function ef() {
    emacs-snapshot $1.f90 &
}
function et() {
    emacs-snapshot $1tex &
}
function e() {
    emacs-snapshot $1 &
    }
