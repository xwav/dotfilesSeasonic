#!/bin/bash
#install software and packages

apt install -y \
libxft-dev \
libxinerama-dev \
libx11-dev \
xorg \
xserver-xorg \
git \
curl \
wget \
build-essential \
feh \
conky-all \
lm-sensors \
cmus \
xcompmgr \
alsa-utils \
acpi \
sxiv \
scrot \
rlwrap \
keepassxc \
zathura \
pmount \
jmtpfs \
calcurse \
rsync \
rclone \
mc \
xclip \
fbreader \
shellcheck \
timeshift \
python3-libtmux \
ncal \
mpv \
transmission-cli \
transmission-daemon \
pass \
stow \
tldr \
moreutils \
ninja-build \
gettext \
xsel \
ripgrep \
network-manager \
syncthing \
pulseaudio-module-bluetooth \
qbittorrent \
most \
ipython3 \
nvtop \
npm \
sshfs

# install manualy those listed below:
# tmux
# fzf
# newsboat

mkdir -p /home/xwav/.local/bin && mkdir wget -O /home/xwav/.local/bin/nvim https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.appimage
chmod u+x /home/xwav/.local/bin/nvim

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

ubuntu-drivers autoinstall


#download and install cht.sh
# curl https://cht.sh/:cht.sh | tee /usr/local/bin/cht.sh
# chmod +x /usr/local/bin/cht.sh


