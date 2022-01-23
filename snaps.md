## installed snaps
- bitwarden
  - password manager - [link](bitwarden.com)
- brave
  - privacy focused chromiumn based browser - [link](brave.com)
  - **NOTE:** snap based browsers don't work for gnome-extensions chrome plugin!
- discord
  - chat - [link](discord.com)
- spotify
  - music streaming - [link](spotify.com)
- btop
  - cli sysmon - [github](https://github.com/aristocratos/btop)
  - installed as snap for simplicity
  - doesn't support zfs pools
    - **TODO:** explore if iSCSI exposed zfs volumes registered in fstab would work
- openra
  - FOSS game engine for C&C, Red Alert, Dune 2000, etc - [link](openra.net)
  - **NOTE:** requires original game assets, etc. Check server or [The Internet Archive](archive.org)
- code
  - vscode
____
### install all 

``` bash
sudo snap install bitwarden brave discord spotify btop openra code
```
