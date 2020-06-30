**How to set up a proper Python 2.x development environment on Ubuntu Linux (14.10 x86_64)**

---

## 1. Install PIP (only for Python 2.7.8 and older because it's pre-installed for Python 2.7.9 and up)

Source: https://pip.pypa.io/en/latest/installing.html

`wget https://bootstrap.pypa.io/get-pip.py`

`sudo python get-pip.py`

## 2. Install virtualenv

Source: http://docs.python-guide.org/en/latest/dev/virtualenvs/

`sudo pip install virtualenv`

## 3. Install virtualenvwrapper

`sudo pip install virtualenvwrapper`

## 4. Install iPython and related goodies

`sudo apt-get ipython ipython-qtconsole ipython-notebook`

Note: we do it this way because trying to get these to install using PIP is pure pain, so let's just grab the more or less outdated distro package and get back to making cool stuff...

#### Set up iPython autoreload because we're always too lazy to remember what to reload:

Source: https://ipython.org/ipython-doc/dev/config/extensions/autoreload.html

`ipython profile create` ...if the files referenced below don't already exist.

Set `c.TerminalIPythonApp.exec_lines` in `~/.ipython/profile_default/ipython_config.py`, and `c.IPKernelApp.exec_lines` in `~/.ipython/profile_default/ipython_qtconsole_config.py` to:


```
[
    '%load_ext autoreload',
    '%autoreload 2'
]
```


