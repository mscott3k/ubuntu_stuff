# apt packages
  ## packages in ubuntu repos
  **install all**
  ``` bash
  sudo apt install --install-recommends git curl htop lm-sensors net-tools terminator gnome-shell-extensions
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
  - python3-pip
  - mingw-w64



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
        sudo apt-get update \
        sudo apt-get install google-chrome-stable
        ```
        - [source](https://www.ubuntuupdates.org/ppa/google_chrome)
  - [OpenMW](openmw.org/en)
    - Install:
      ``` bash
      sudo add-apt-repository ppa:openmw/openmw \
      sudo apt-get update \
      sudo apt-get install openmw openmw-launcher 
      ```
  - [wine](winehq.org)
    - Install: 
    
      *If you have previously installed a Wine package from another repository, please remove it and any packages that depend on it (e.g., wine-mono, wine-gecko, winetricks) before attempting to install the WineHQ packages, as they may cause dependency conflicts.*

      If your system is 64 bit, enable 32 bit architecture (if you haven't already):
      ``` bash
      sudo dpkg --add-architecture i386 
      ```
      
      Download and add the repository key:
      ``` bash
      wget -nc https://dl.winehq.org/wine-builds/winehq.key \
      sudo apt-key add winehq.key
      ```
      
      Add the repository:
        - Ubuntu 21.10	
          ``` 
          sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main' \
          sudo apt update
          ```

      Then install one of the following packages:
        - Stable branch	
          ```
          sudo apt install --install-recommends winehq-stable
          ```
        - Development branch	
          ```
          sudo apt install --install-recommends winehq-devel
          ```
        - Staging branch	
          ```
          sudo apt install --install-recommends winehq-staging
          ```
          - [source](https://wiki.winehq.org/Ubuntu)
  - [Lutris](lutris.net)
    - Install:
      ``` bash
        sudo add-apt-repository ppa:lutris-team/lutris
        sudo apt-get update
      ```
   
