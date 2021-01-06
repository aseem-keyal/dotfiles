#!/bin/sh

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git \
	base-devel \
	anki \
	arandr \
	bc \
	calcurse \
	dunst \
	evtest \
	firefox \
	htmldoc \
	htop \
	jq \
	libnotify \
	libva-utils \
	libxinerama \
	maim \
	man-db \
	mpc \
	mpd \
	mpv \
	ncmpcpp \
	neofetch \
	neovim \
	networkmanager \
	newsboat \
	noto-fonts \
	noto-fonts-cjk \
	openssh \
	openvpn \
	pamixer \
	perl-file-mimeinfo \
	playerctl \
	poppler \
	pulseaudio \
	pulseaudio-alsa \
	pulsemixer \
	python-pywal \
	recoll \
	rsync \
	slock \
	sxiv \
	tlp \
	tree \
	ttf-font-awesome \
	ttf-hack \
	unclutter \
	wget \
	wmctrl \
	xclip \
	xcompmgr \
	xdotool \
	xorg-server \
	xorg-xbacklight \
	xorg-xinit \
	xorg-xinput \
	xorg-xset \
	xwallpaper \
	zathura \
	zathura-djvu \
	zathura-pdf-mupdf \
	zathura-ps \
	zsh \
	xf86-video-intel \
	libva-intel-driver \
	stow

mkdir ~/code/
cd ~/code
git clone <dotfiles url>
stow -t ~ */

cd ~ && git clone https://aur.archlinux.org/yay-git.git && cd yay-git
makepkg -si --noconfirm
cd ~ && rm -rf yay-git

yay -S lf \
	kunst-git \
	libxft-bgra \
	mpdris2 \
	ncspot \
	picom-git \
	python-pywalfox \
	rescrobbled-git \
	soulseekqt \
	zsh-fast-syntax-highlighting

sudo systemctl enable tlp
systemctl --user enable mpd
systemctl --user enable mpDris2
systemctl --user enable rescrobbled
systemctl --user enable pulseaudio
