#!/bin/bash

# ----------------------Updates all repositories----------------------

echo '.emacs.d'
git -C ~/.emacs.d/ status
echo
echo 'QMC'
git -C ~/Documents/QMC status
echo
echo 'NumFort'
git -C ~/Documents/NumFort status
echo
echo 'Thesis'
git -C ~/Documents/Thesis status
echo
echo 'fe-hack'
git -C ~/Documents/fe-fangame status
echo
echo 'halley'
git -C ~/Documents/fe-fangame/halley status
echo
