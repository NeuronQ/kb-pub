# SSH

Good guide: https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html

## Create New Key

`ssh-keygen`

* follow prompts
* at the end you will get a private key with no extension and a public key
  with .pub extension

## Add key to agent

`ssh-add /path/to/private/key`

(with no path it will try to add all keys in `~/.ssh`)

## See public key to copy it

Just `cat /path/to/public/key` and use mouse to copy.

Or smth like `cat ~/.ssh/id_rsa.pub | xclip -sel clip`.

## SCP
