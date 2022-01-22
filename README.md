# ubuntu_stuff
install notes, helpful info, etc


### fix pi-hole local DNS resolution
``` bash
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
```
 This links dynamic resolver file to systemd-resolve file that has overridden DNS server settings. 
