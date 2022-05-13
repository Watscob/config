# Prerequisite
* networkmanager (Arch)
* dhcpcd (Arch)

# Installation

1. Enable the services
```sh
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now dhcpcd.service
```

2. Fill the config file
[More infos](https://github.com/wylermr/NetworkManager-WPA2-Enterprise-Setup)

3. Copy the config file
```sh
sudo cp IONIS.nmconnection /etc/NetworkManager/system-connections/
```
