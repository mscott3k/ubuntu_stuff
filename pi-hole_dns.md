## fix pi-hole local DNS resolution
``` bash
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
```
  This links dynamic resolver file to systemd-resolve file that has overridden DNS server settings. Default loopback resolver uses internal DNS, which will resolve hostnames on [hostname].local for linux (or at least ubuntu) PCs. 
 
  Weird thing is that I don't have this issue on my server though? 
  
  [Source](https://unix.stackexchange.com/questions/586930/dns-lookup-against-pihole-fails-for-local-hostnames-on-20-04-works-on-other-sys)
  
