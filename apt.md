# apt packages
  ## packages in ubuntu repos
  **install all**
  ``` bash
    sudo apt install git curl htop lm-sensors net-tools terminator gnome-shell-extensions
  ```
- ### packages: 
  - git
  - curl
  - htop
    - having htop around is useful even though I mainly use btop lately
  - lm-sensors
    -  run to detect sensors:
      ``` bash
        sudo sensors-detect
      ```
  - net-tools
    - so I can use "ifconfig" 
  - terminator
    - better terminal emu than gnome default
  - notepadqq
    - linux notepad++; not as good look for alt
  - openssh-server
    -  ssh-askpass
    -  molly-guard
    -  monkeysphere
  - gnome-shell-extensions
    - allows install/management of gnome extensions
    - extension list/settings are synced to gist via [Extensions Sync](https://extensions.gnome.org/extension/1486/extensions-sync/) - [github](https://github.com/oae/gnome-shell-extensions-sync)
    - *need google-chrome-stable for chrome plugin; doesn't work with snap browsers!*
  - menulibre
    - edit gnome app menu items, icons, etc



 ## additional PPAs 
  - [Google Chrome](google.com/chrome)
    - *needed for gnome-shell-extensions; snap versions won't work for chrome plugin*
      - Setup key with:
        ``` bash
          wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
        ```
      - Setup repository with:
        ``` bash
          sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'      
        ```
      - Setup package with:
        ``` bash
          sudo apt-get update 
          sudo apt-get install google-chrome-stable
        ```
        - [source](https://www.ubuntuupdates.org/ppa/google_chrome)
  - [OpenMW](openmw.org/en)
    - Install:
      ``` bash
        sudo add-apt-repository ppa:openmw/openmw
        sudo apt-get update
        sudo apt-get install openmw openmw-launcher
      ```
  - [Lutris](lutris.net)
    - Install:
      ``` bash
        sudo add-apt-repository ppa:lutris-team/lutris
        sudo apt-get update
      ```
   