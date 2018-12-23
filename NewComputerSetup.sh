# ----------------------------Base packages---------------------------
sudo apt-get install texlive texlive-latex-extra gfortran g++

# ---------------------------NVIDIA drivers---------------------------
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update

# ---------------------------Emacs libraries--------------------------

sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libxpm-dev automake autoconf
apt-cache search 'libgnutls.*-dev'
# Install the emacs 26.* from source

# -------------------------------Spotify------------------------------
sudo apt-get install snap
snap install spotify

# -------------------------------Dropbox------------------------------
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# -------------------------------Python-------------------------------
# Install from anaconda, self explanatory
