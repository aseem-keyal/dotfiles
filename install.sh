#!/bin/bash

user="aseem"
root_services=(tlp)
user_services=(mpd mpDris2 rescrobbled pulseaudio)
local_programs=(dmenu dwm dwmblocks st)

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

mkdir -p ~/.cache/zsh
mkdir -p ~/code/ && cd ~/code && git clone https://github.com/aseem-keyal/dotfiles && cd dotfiles
stow -t ~ */

for program in "${local_programs[@]}"; do
	cd ~/.local/src
	git clone https://github.com/aseem-keyal/$program
	cd $program
	sudo make install
done


for service in "${root_services[@]}"; do
	sudo systemctl --user enable $service
done

for service in "${user_services[@]}"; do
	systemctl --user enable $service
done

chsh -s /bin/zsh $user
