## Allow execution of scripts

```Set-ExecutionPolicy RemoteSigned```

## Get Chocolatey

[Chocolatey](https://chocolatey.org)

## For users (general & troubleshooting helpers)

**Note:** Acrobat reader from Chocolatey seems broken, so install old-school, but remember to skip the add-ware.

```
choco install googlechrome -y
choco install firefox -y
choco install skype -y
choco install vlc -y
choco install 7zip -y
choco install paint.net -y
choco install procexp -y
choco install youtube-dl -y
choco install windirstat -y
choco install filezilla -y
choco install audacity -y
choco install deluge -y
choco install rufus -y
```

## For users (personal preference)

**Recommended:** Install these the old-school way.

```
choco install googledrive -y
choco install dropbox -y

choco install xnviewmp -y
```

## For devs - general

**Recommended 1:** For uniformity with other devs, better to install git the old school way, and skip poshgit.

**Recommended 2:** If you do nodejs dev, use [nvm-windows](https://github.com/coreybutler/nvm-windows) instead.

```
# Command line basics
choco install conemu -y
#choco install curl -y # part of git bash
choco install wget -y
choco install patheditor -y

# FTS, SFTP, SSH, Keys
choco install putty -y
choco install winscp -y

# Git
#choco install git -y
choco install sourcetree -y
#choco install poshgit -y

# Nodejs
#choco install nodejs -y

# VirtualBox & Vagrant (VMs) - do not use Chocolatey for these now
#choco install virtualbox -y
#choco install vagrant -y

# A tail GUI for interactive logs viewing
choco install baretail -y

# Advanced color picker - choco pacage is broken
#choco install jcpicker
# Basic QUICK color picker
choco install instanteyedropper -y

# Docs
choco install velocity -y
```

## For devs - language/tech-stack specific

```
choco install jdk8 -y
choco install php -y

# DBs
choco install mysql
choco install postgresql-9.3 -y
choco install mongodb -y

# DB UIs
choco install dbeaver -y
choco install studio3t -y # former MongoChef
#choco install heidisql -y # newer version old-school way...
```

## For devs - personal preference tools

```
choco install sublimetext3 -y

choco install visualstudiocode -y
```

Also a WindowsNginxMariaPHP package if needed: https://github.com/wnmp/wnmp .

# Setup separate admin account

1. Open an admin propmpt (`Win+X, Command Prompt (Admin) OR Windows PowerShell (Admin)`)
2. `net user administrator MyPasswordHere /active:yes`
3. Log in as new Administrator user to confirm it works.
4. Make your current user non-Admin