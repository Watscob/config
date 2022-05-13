# Prerequisite
* grub (Arch)
* efibootmgr (Arch)
* dosfstools (Arch)
* mtools (Arch)
* os-prober (Arch)

# Installation

1. Copy the grub config file
```sh
sudo cp grub /etc/default/grub
```

2. Install the theme
```sh
cp primitivistical-grub-v0.2.tar.gz /tmp && cd /tmp
tar -xvf primitivistical-grub-v0.2.tar.gz && cd primitivistical-grub-v0.2
sudo ./Install.sh
```
