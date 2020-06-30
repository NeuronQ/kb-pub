---
# Updates

**Do this first!**

---
# Fixes

* `sudo apt-get install plymouth-x11` - fixes annoying on-boot error on some (most?) laptops (that has zero consequences probably, but annoying anyway); from https://askubuntu.com/questions/407131/why-is-plymouthd-crashing-on-startup

* System-tray fixes for quirkier apps:

```
sudo apt-add-repository ppa:fixnix/indicator-systemtray-unity
sudo apt-get update
sudo apt-get install indicator-systemtray-unity
```

```
sudo apt-get install sni-qt sni-qt:i386
```

* switch to lightdm if system freezes on de-suspending

```
sudo apt-get install lightdm
sudo dpkg-reconfigure lightdm
```

---
# XFCE

* install `xubuntu-desktop` (but use `Xfce` at login instead of `Xubuntu`, that's full of crappy stylings anyway)
* add capslock2ctrl mapping on start (this is the only version that works ok with switching between multiple kb layouts too): `Settings > Session and Startup`, add command `/usr/bin/setxkbmap -option "ctrl:nocaps"` (and also set keyboard options and add indicator/switcher to panel)
* install DockBarX (https://github.com/M7S/dockbarx) -  this is mostly for `Win-#` app switching
* configure DockBarX to auto-start: `Settings > Session and Startup`, add command `/usr/bin/dockx`
* `sudo apt install arc-theme` - probably only non-ugly xfce theme except the default

---
# Un-fuck Unity after install of Gnome 3

*NOTE:* This doesn't truly un-fuck everything, it just makes things usable and mostly decent looking...

* Reinstall Unity desktop:

```
sudo apt-get update
sudo apt-get install --reinstall ubuntu-desktop
sudo apt-get install --reinstall unity
```

* remove all old DE configs

```
mv ~/.config ~/.config_backup
```

* replace boot animation

```
ls -al /etc/alternatives/*plymouth*
sudo update-alternatives --config default.plymouth
sudo update-alternatives --config text.plymouth
```

* optionally switch to lightdm if system freezes on de-suspending

```
sudo apt-get install lightdm
sudo dpkg-reconfigure lightdm
```

* use Gnome Tweak Tool to set desktop to display icons (this will allow Unity to set background)

* use Unity Tweak Tool (first install it) to reset other stuff to default

---
# Package management

Install Synaptic using Ubuntu Software Center.

---
# GUI

* Gnome: `sudo apt install ubuntu-gnome-desktop`
* Gnome extensions:
  * Applications menu
  * Dash to dock
  * Impatience
  * Pixel saver
  * Places status indicator
  * Refresh wifi connection
  * Sound input & output device chooser
  * Topicons plus
  * Windownavigator
* Gnome tweak tool settings
  * fonts > scaling factor ?
  * top bar > show date
  * typing > miscell. > both shift keys together toggle caps lock
  * typing > caps lock key behavior > make caps lock an additional ctrl
  * windows > titlebar buttons > { maximize: on, minimize: on }
  * windows > window scaling ?
  * workspaces > workspaces only on primary display: off
* Microsoft Fonts:
```
sudo apt-get install ttf-mscorefonts-installer
sudo fc-cache -f -v
```

---
# Basics

* DropBox

---
# Media and stuff

```
sudo apt-get install vlc -y
#sudo apt-get install gimp -y  # DON't use official one, take http://tipsonubuntu.com/2016/08/02/install-gimp-2-9-5-ubuntu-16-04/
#sudo apt-get install inkscape -y # PREFERABLY use https://code.launchpad.net/~inkscape.dev/+archive/ubuntu/stable
sudo apt-get install blender -y
sudo apt-get install darktable -y
```

* XnViewMP: https://www.xnview.com/en/xnviewmp/

* Joxi screenshot tool: http://joxi.net/download/linux

---
# Dev tools

```
sudo apt-get install git -y
sudo apt-get install tmux -y
sudo apt-get install tmuxinator -y
sudo apt-get install emacs -y
sudo apt-get install vim -y
sudo apt-get install curl -y
```

* SublimeText
* GitKraken
* Docker
  * you'll likely need to **reboot** before the test example (or anything else...) actually works, despite their install docs not mentioning this
  * also follow their "Linux post-install steps" to **make it usable without `sudo`**
* VirtualBox
* Vagrant

---
# IDEs

* VSCode
* PyCharm

---
# Pythons

```
# Python 2 & 3: they should be already installed by now!
#sudo apt-get install python
#sudo apt-get install python3

# PIP for both
sudo apt-get install python-pip
sudo apt-get install python3-pip
# NOTE: use pip/pip2 and pip3 commands

# Virtualenv and virtualenvwrapper
# (just install them for 2 and select Python on env creation)
sudo pip install virtualenv
sudo pip install virtualenvwrapper
```

**NOTE:** this is basically the only time you should be using `sudo` with `pip` btw!

* MiniConda: download from https://conda.io/miniconda.html (use Python 3 versionm it can also create Python 2 environments if needed) -- **IMPORTANT:** answer **NO** when asked whether to change `PATH` automatically (since we'll be using `load/unload_conda_python` helpers from `.bashrc-custom`), but note what the path to its `bin/` is to confirm it's correct

---
# Node.js

* use NVM (post install hint: `source ~/.bashrc` to get it working)