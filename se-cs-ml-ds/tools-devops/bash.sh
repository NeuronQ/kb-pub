## Change/restore editiong mode
set -o vi
set -o emacs  # probably what you want even if you're not an emacs person


## History
# navigate: <Up>/<Down>, C-p/C-n, M->
# keep history command without executing it: C-j
history 100 | grep manage.py
!2002  # run comm. at position (use history to see it)
!-3  # N ago
!!  # same as !-1
sudo !!  # most common use case
^wrong^right  # last command, with text replaced (eg. to fix a typo
!ssh  # last one starting with "ssh"
!?restart?  # last one containing "restart"


## Freeze/Unfreeze
# C-s/C-q
stty -ixon  # disable "feature"


## Modifiers
!!:p  # print/echo instead of executing


## Debugging scripts
bash -n my-script.sh  # syntax check only (no execute)
bash -x my-script.sh  # also print commands before executing them

## 