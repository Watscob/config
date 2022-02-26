#!/bin/bash

packages="vim git zsh fzf"

install_packages_apt() {
    sudo apt-get install $packages
}

install_packages_pacman() {
    sudo pacman -S $packages
}

config_zsh() {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    cp zsh/zshrc ~/.zshrc
    cp zsh/p10k.zsh ~/.p10k.zsh

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    source ~/.zshrc
}

config_vim() {
    cp -r vim/ ~/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    vim -c "PluginInstall" -c q -c q
}

config_git() {
    cp git/gitconfig ~/.gitconfig
    cp git/gitignore ~/.gitignore
}

main() {
    echo "Package manager:"
    read -p "apt(A) or pacman(P): " packmanager

    if [ "$packmanager" = "A" ]
    then
        install_packages_apt
    elif [ "$packmanager" = "P" ]
    then
        install_packages_pacman
    else
        echo "Invalid package manager."
        exit 1
    fi

    read -p "Configure git [y/N]: " dogit

    if [ "$dogit" = "y" ] || [ "$dogit" = "Y" ]
    then
        config_git
    fi

    read -p "Configure zsh [y/N]: " dozsh

    if [ "$dozsh" = "y" ] || [ "$dozsh" = "Y" ]
    then
        config_zsh
    fi

    read -p "Configure vim [y/N]: " dovim

    if [ "$dovim" = "y" ] || [ "$dovim" = "Y" ]
    then
        config_vim
    fi

    exit 0
}

main
