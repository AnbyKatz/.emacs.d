#!/bin/bash

# ----------------------Updates all repositories----------------------

echo '.emacs.d'
git -C ~/.emacs.d/ status
echo
echo 'QMC'
git -C ~/Dropbox/QMC status
echo
echo 'NumFort'
git -C ~/Dropbox/NumFort status
echo
echo 'Thesis'
git -C ~/Dropbox/Thesis status
echo
echo 'fe-hack'
git -C ~/Dropbox/fe-fangame status
echo
echo 'halley'
git -C ~/Dropbox/fe-fangame/halley status
echo
