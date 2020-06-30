## Docs

https://help.ubuntu.com/community/Grub2/Setup

## Set the default OS

1. Make sure you're in the OS that installed Grub (otherwise ignore this, and start from figuring out how to install Grub from an USB stick or Live CD without messing up everything else, and only after come back to this...)
2. (optional) Have a look at `/boot/grub/grub.cfg` to see the options. Numbering start from 0. This file should not be edited directly, as it is auto-generated every time you do `sudo update-grub` orthe system's upgrades its kernel)
3. Edit `/etc/default/grub` changing `GRUB_DEFAULT` to the approprate number.
4. Run `sudo update-grub`.

## Auto-detect newly installed OS

1. Make sure you're in the OS that installed Grub (otherwise ignore this, and start from figuring out how to install Grub from an USB stick or Live CD without messing up everything else, and only after come back to this...)
2. Run `sudo update-grub`