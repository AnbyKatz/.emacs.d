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
echo 'Papers'
git -C ~/Documents/Papers status
echo
