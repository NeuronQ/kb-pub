**How to `start`, `stop`, `restart`, `enable autostart` or `disable autostart` for services on Ubuntu (14.10 and similar versions).**

First you must understand that there are **2 kinds of services**, started in 2 different ways: **init.d** (aka *System V init*) services and **Upstart** service. To make things even more fun, Upstart will be replaced by **systemd** in Ubuntu 15 and up...

To see if a particular service is started using init.d or Upstart, use this:

`sudo status <service_name>`

If you get an output like `mysql start/running, process 1332` it's **Upstart**.
If you get something like `status: Unknown job: nginx`, it's NOT Upstart, so for now you can assume **init.d** (or systemd in the future).

Another way is to look into `/etc/init.d` for init.d scrips, and into `/etc/init` for Upstart config files.

---

## General commands (for both init.d and Upstart)

`service <service_name> status`

`sudo service <service_name> start`

`sudo service <service_name> stop`

`sudo service <service_name> restart`

## Upstart

To disable autostarting a service:

`echo 'manual' | sudo tee /etc/init/<service_name>.override`

To re-enable autostarting remove 'manual' from this file (ore remove the file itself if there isn't anything else in it).

## Init.d

`sudo update-rc.d <service_name> disable`

`sudo update-rc.d <service_name> enable`