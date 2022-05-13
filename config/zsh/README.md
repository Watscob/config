# Prerequisite
* fzf (Arch)
* git (Arch)
* curl (Arch)
* zsh (Arch)
* neofetch (Arch)

# Installation

1. Install `oh-my-zsh`
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Install `powerlevel10k`
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

3. Install the plugins
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

4. Copy `zshrc`
```sh
cp zshrc $HOME/.zshrc
```

5. Configure `p10k`
```sh
p10k configure
```

6. Reload zsh
```sh
source $HOME/.zshrc
```
