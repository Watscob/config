# Prerequisite
* sddm (Arch)
* archlinux-themes-sddm (AUR)

# Installation

1. Enable the sddm service
```sh
sudo systemctl enable sddm.service
```

2. Copy the config file
```sh
sudo cp default.conf /etc/sddm.conf.d/
```
