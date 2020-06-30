## First things

* login/signup to an Ubuntu account to enable LivePatch
* update

## Basic Input and UX tweaks

* remove laucher icons, pin Terminal icon
* settings: Applications > Settings
  * Dock: size=24, maybe autohide
  * Devices > Mouse & Trackpad: ...
  * Power > When the Power Button is pressed: Suspend (this is usually the "expected" behavior you'd want; also, Alt + Power icon click suspends instead of shutdown)
* Gnome Tweaks: install from Software > Search
  * Top Bar > Clock > Date: On
  * Keyboard & Mouse > Keyboard > Additional Layout Options > Ctr position > Caps Lock as Ctrl: Yes
* Configure dock to only show windows from current workspace:
```
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
```

## Gnome Extensions

To enable them:

```
sudo apt install gnome-shell-extensions -y
sudo apt install chrome-gnome-shell  # needed by browser connector
```

Visist http://extensions.gnome.org and install browser extension.

Get `No Title Bar` extension and configure it from the Tweaks Tool:
* Basic settings > Window control buttons: After app menu
* Basic settings > Autohide buttons: Off

Get `Impatience` and set "Speed scaling" to 0.5 to make animations 2x faster.

## Terminal config

* Edit / Right-click > Preferences
  * General > Show menubar by default in new terminals: Off
  * Profile > Unnamed / ... > Scrolling
    * Scroll on output: Off (probably Off by default, and btw, it does the right
      thing of scrolling on output *when at the bottom of the window*)
    * Limit scrollback to: 1000000 (1 million)

## Nautilus (file browser) config:

* top menu > Preferences > Views:
  * Sort folders before files: On
  * Allow folders to be expanded: On

## Harware monitoring and stuff

```
sudo apt-get install lm-sensors hddtemp
sudo sensors-detect  # answering "yes" to all didn't break anything on hp spectre x360 late 2017
sensors  # to check it works
sudo apt get install psensor -y  # usable GUI that also shows in system tray
```

## Settings files from old machine

* Grab `.bashrc-custom.sh`, `.bash-powerline.sh`, `.emacs`, `.vimrc` and `.tmux.conf`.

* Add `. ~/.bashrc-custom.sh` to bottom of `.bashrc`.

## Basic dev & power-user tools

```sh
# CLI - general (for server too)
sudo apt install unzip -y
sudo apt install git -y
sudo apt install screen -y
sudo apt install vim -y
sudo apt install curl -y
sudo apt install httpie -y
sudo apt install build-essential -y
sudo apt install libffi-dev libssl-dev -y
sudo apt install python -y
sudo apt install python3 -y

# CLI - editors and dev tools and stuff
sudo apt install tmux -y
sudo apt install tmuxinator -y
sudo apt install xclip -y
sudo apt install emacs -y

# GUI
sudo apt install synaptic -y
sudo apt install gparted -y
```

Install manually: GitKraken.

## Git config

```
git config --global alias.co checkout
git config --global alias.cam 'commit -am'
```

## Config git

```
git config --global user.name "Neuron Q"
git config --global user.email "io@neuronq.ro"
```

## Useful apps

```
sudo apt install -y vlc  # snap version is fubared...
sudo apt install -y qbittorrent
sudo apt install -y zeal
```

Install from Ubuntu Software (as Snap Store apps have better chances of being up to date... maybe...):

* Chromium  # using snap because repo version is probably outdated
* Skype

* Gimp
* Inkscape
* Darktable

* maybe:
  * XNViewMP
  * XNSketch

Install manually:

* Chrome https://www.google.com/chrome/ (remember to right-click system tray and disallow it to run in background)

* Windows fonts (NOTE: this will require license accepting confirmation).

```
sudo apt install ttf-mscorefonts-installer
```

* Dropbox https://www.dropbox.com/install-linux

* SublimeText https://www.sublimetext.com/docs/3/linux_repositories.html (also PackageControl https://packagecontrol.io/installation) and copy custom settings

* VSCode - then Settings Sync extension to import settings (needs github token)

* PyCharm - to sync settings do:
  * disable plugin IDE Settings Sync
  * enable plugin Settings Repository (and config it with right repo and github token)
    * Settings > Tools > Settings Repository > auto sync: turn off if needed

...also dot this (which will probably help other IDEs too) to either /etc/sysctl.conf file or a new *.conf file (e.g. idea.conf) under /etc/sysctl.d/ directory:

```
###################################################################
# Tweak suggested by JetBrains
fs.inotify.max_user_watches = 524288
```
and this to apply changes instantly: `sudo sysctl -p --system`.

## Browsers fonts config

* Chrome:
  * settings > fonts: probably keep "medium (recommended)"
  * page zoom: probably set to 110% or 125%

* Firefox:
  * fonts settings: probably default size + change to use windows settings
  * about:config > layout.css.devPixelsPerPx: change from -1.00 to probably 1.10 or 1.25

## Python development

```
# Python 2 & 3: they should be already installed by now!
#sudo apt-get install python python-dev -y
#sudo apt-get install python3 python3-dev -y

# PIP for both
sudo apt-get install python-pip -y
sudo apt-get install python3-pip -y
# NOTE: use pip/pip2 and pip3 commands -y

# Virtualenv and virtualenvwrapper
# (just install them for 2 and select Python on env creation)
sudo pip install virtualenv
#sudo pip install virtualenvwrapper  # maybe?
```

**NOTE:** this is basically the only time you should be using `sudo` with `pip` btw!

* MiniConda: download from https://conda.io/miniconda.html (use Python 3 versionm it can also create Python 2 environments if needed) -- **IMPORTANT:** answer **NO** when asked whether to change `PATH` automatically (since we'll be using `load/unload_conda_python` helpers from `.bashrc-custom`), but note what the path to its `bin/` is to confirm it's correct

## Node.js development

* Install NMV according to instructions at https://github.com/creationix/nvm#installation (`source ./~bashrc`) after.
* Run `nvm ls` to see local versions, `nvm ls-remote` to see remote/available ones, and `node -v` to see current node version.
* Install a version like `nvm install 10.0.0` and set it as default by doing `nvm alias default 10.0.0`. (Note that `nvm ls-remote` shows versions like `v10.0.0`, but when doing and `nvm install ...` you gotta mention the without the `v` eg. `10.0.0` not `v10.0.0`)

## DBs and stuff like that

### Postgres

```
sudo apt install postgresql-10 postgresql-client-10 postgresql-server-dev-10 -y
sudo apt install pgadmin3 -y
sudo apt install postgis -y
sudo systemctl disable postgresql
sudo systemctl stop postgresql
```

To set a password for default `postgres` user:

```
sudo -u postgres psql postgres
\password postgres
```

### RabbitMQ

```
sudo apt install rabbitmq-server -y
sudo systemctl disable rabbitmq-server
sudo systemctl stop rabbitmq-server
```

### MariaDB

```
sudo apt install mariadb-server mariadb-client -y
sudo systemctl disable mariadb -y
sudo systemctl stop mariadb -y
```

Setting things up (REQUIRED!):

```
sudo mysql_secure_installation
# follow prompts and set root password
# (but you will still NOT be able to login as root without sudo!)
```

```
sudo mysql -u root
CREATE USER 'your_system_user'@'localhost' IDENTIFIED BY 'some_password';
GRANT ALL PRIVILEGES ON *.* TO 'your_system_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
Now you can login with `mysql -p`.

### MongoDB

```
sudo apt install mongodb-server mongodb-clients -y
sudo systemctl disable mongodb -y
sudo systemctl stop mongodb -y
```

Compass CE from here: https://www.mongodb.com/download-center?jmp=nav#compass

## GDAL - Geospatial Data Abstraction Library

```
sudo apt install gdal-bin gdal-data -y
```
