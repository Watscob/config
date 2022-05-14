#!/bin/bash

# VARIABLES
GRUB_DIR="./system_config/grub"
XORG_DIR="./xorg_config/xorg.conf.d"
BB_DIR="./xorg_config/bumblebee"
SYSTEMD_DIR="./xorg_config/systemd"
SDDM_DIR="./xorg_config/sddm"
I3_DIR="./xorg_config/i3"
POLYBAR_DIR="./xorg_config/polybar"
ROFI_DIR="./xorg_config/rofi"
DUNST_DIR="./xorg_config/dunst"
XOB_DIR="./xorg_config/xob"
GIT_DIR="./config/git"
KITTY_DIR="./config/kitty"
NM_DIR="./config/networkmanager"
ZSH_DIR="./config/zsh"
NVIM_DIR="./config/nvim"

echo -n "Install yay (AUR manager) ... "
sudo pacman -S --needed git base-devel
cd /tmp && git clone https://aur.archlinux.org/yay.git
cd -
cd /tmp/yay
makepkg -si
cd -
echo "Done"

echo -n "Install grub config ... "
sudo cp "${GRUB_DIR}/grub" /etc/default/grub
cp primitivistical-grub-v0.2.tar.gz /tmp
tar -xvf /tmp/primitivistical-grub-v0.2.tar.gz
sudo ./tmp/primitivistical-grub-v0.2/Install.sh
echo "Done"

echo -n "Install xorg config ... "
sudo pacman -S libinput
sudo cp "${XORG_DIR}/*.conf" /etc/X11/xorg.conf.d
echo "Done"

echo -n "Install bumblebee ... "
sudo pacman -S nvidia xf86-video-intel bumblebee bbswitch acpi acpi_call primus_vk
sudo systemctl enable --now bumblebeed.service
sudo cp "${BB_DIR}/bumblebee.conf" "${BB_DIR}/xorg.conf.nvidia" /etc/bumblebee
sudo cp "${BB_DIR}/20-intel.conf" /etc/X11/xorg.conf.d
sudo cp "${BB_DIR}/bbswitch.conf" /etc/modprobe.d
echo "Done"

echo -n "Install systemd services ... "
yay -S i3lock-fancy
sudo cp "${SYSTEMD_DIR}/wakelock.service" /etc/systemd/system
sudo systemctl enable wakelock.service
echo "Done"

echo -n "Install SDDM ... "
sudo pacman -S sddm
yay -S archlinux-themes-sddm
sudo systemctl enable sddm.service
sudo cp "${SDDM_DIR}/default.conf" /etc/sddm.conf.d
echo "Done"

echo -n "Install i3 ... "
sudo pacman -S i3-gaps flameshot brightnessctl pamixer rofi nitrogen polybar
yay -S xidlehook xob rofi-power-menu
cp "${I3_DIR}/xsessionrc $HOME/.xsessionrc"
cp "${I3_DIR}/config $HOME/.config/i3"
echo "Done"

echo -n "Install polybar ... "
mkdir $HOME/.config/polybar
cp "${POLYBAR_DIR}/config.ini" "${POLYBAR_DIR}/launch.sh" $HOME/.config/polybar
echo "Done"

echo -n "Install rofi ... "
mkdir $HOME/.config/rofi
cp "${ROFI_DIR}/config.rasi" $HOME/.config/rofi
echo "Done"

echo -n "Install dunst ... "
mkdir $HOME/.config/dunst
cp "${DUNST_DIR}/dunstrc" $HOME/.config/dunst
echo "Done"

echo -n "Install xob ... "
mkdir $HOME/.config/xob
cp "${XOB_DIR}/*.sh" "${XOB_DIR}/styles.cfg" $HOME/.config/xob
echo "Done"

echo -n "Install fonts ... "
sudo pacman -S ttf-dejavu ttf-font-awesome ttf-fira-code
yay -S nerd-fonts-complete
echo "Done"

echo -n "Install git config ... "
cp "${GIT_DIR}/gitconfig" $HOME/.gitconfig
echo "Done"

echo -n "Install kitty ... "
sudo pacman -S kitty
mkdir $HOME/.config/kitty
cp -r "${KITTY_DIR}/*.conf" $HOME/.config/kitty
echo "Done"

echo -n "Install NetworkManager ... "
sudo pacman -S networkmanager dhcpcd
sudo systemctl enable --now NetworkManager.service dhcpcd.service
# TODO: Fill the file
echo "IONIS email:"
read email
echo "IONIS password:"
read passwd
uuid=$(uuidgen)
sed -i 's/MAILEPITA/$email' "${NM_DIR}/IONIS.nmconnection"
sed -i 's/PASSWORD/$passwd' "${NM_DIR}/IONIS.nmconnection"
sed -i 's/UUID/$uuid' "${NM_DIR}/IONIS.nmconnection"
sudo cp "${NM_DIR}/IONIS.nmconnection" /etc/NetworkManager/system-connections
echo "Done"

echo -n "Install zsh ... "
sudo pacman -S fzf git curl zsh neofetch
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
cp "${ZSH_DIR}/zshrc" $HOME/.zshrc
p10k configure
source $HOME/.zshrc
echo "Done"

echo -n "Install ssh ... "
sudo pacman -S openssh
ssh-keygen
cat $HOME/.ssh/id_rsa.pub
echo "Done"

echo -n "Install neovim ..."
sudo pacman -S neovim
cp -r "${NVIM_DIR}" $HOME/.config/nvim && rm $HOME/.config/nvim/README.md
nvim
echo "Please run :PackerSync in nvim"
nvim
echo "Done"

echo -n "Install other softwares ... "
sudo pacman -S discord-canary vlc firefox pulseaudio pavucontrol flameshot thunar zip unzip wget curl
yay -S spotify
echo "Done"
