
## PIP

Fix it:
- **Option 1** (if current pip install is not *too* fucked): python -m pip install --upgrade pip` 
- **Option 2** (works if current pip is fubared, warning - probably insecure if you don't checksum):
  `curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py`,
  then `python get-pip.py --force-reinstall`
