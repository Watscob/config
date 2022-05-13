# Prerequisite
* nvidia (Arch)
* xf86-video-intel (Arch)
* bumblebee (Arch)
* bbswitch (Arch)
* acpi (Arch)
* acpi_call (Arch)
* primus_vk (Arch)

# Installation

1. Enable bumblebee service
```sh
sudo systemctl enable --now bumblebeed.service
```

2. Copy the config files
```sh
sudo cp bumblebee.conf /etc/bumblebee/
sudo cp 20-intel.conf /etc/X11/xorg.conf.d/
sudo cp xorg.conf.nvidia /etc/bumblebee/
sudo cp bbswitch.conf /etc/modprobe.d/
```
