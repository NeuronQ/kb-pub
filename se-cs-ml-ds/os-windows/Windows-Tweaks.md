## Security sanity

Make sure anyone who needs to install something system-wide will need an Admin password.

1. create an admin account

2. set the current user type to standard/regular (**not** admin!)

3. run `secpol.msc`

4. set `Local Policies -> Security Options -> User Account Control: Behavior of the elevation prompt for standard users` to `Prompt for credentials`

## Fix for Thumbs.db madness

1. Run `gpedit.msc`

2. **Win 7:** `User Configuration -> Administrative Templates -> Windows Components -> Windows Explorer`

  **Win 8:** `User Configuration -> Administrative Templates -> Windows Components -> File Explorer`

3. Set `Turn off the caching of thumbnails in hidden thumbs.db files` to `Enabled`

**OR** Via the Registry Editor (not tested!):

**Win 7:** Go to `HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer\`. Within that key edit the REG_DWORD entry “DisableThumbsDBOnNetworkFolders” to the value “1” (the default is 0).

**Win 8:** Go to `HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\`. Create key `Explorer`. Create a DWORD entry DisableThumbsDBOnNetworkFolders and set its value to 1.

