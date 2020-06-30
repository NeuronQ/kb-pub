# General

Note that you can generally add `-y` to avoid prompts for confirmation if using these in shell scripts.

Full docs at: https://conda.io/docs/commands.html#conda-general-commands .

```bash
## list environments
conda info --envs         # list environments

## switch environments (without `source` if you use CMD or PowerShell)
source activate myenv1    # activate envronment
source deactivate myenv1  # deactivate environment
                          # (!on Windows & Git Bash this may require a Bash restart afterwards!)


## create environments
conda create -n myenv1 python      # create environment (empty, using default python version)
                                   # !! you DO need the `python` there if you want an *empty*
                                   #    environment, otherwise the system packages will be included
                                   #    (and yeah, this is NOWHERE in the official documentation)
    
conda create -n myenv1             # create env with default python and global packages included
                                   # (!probably NOT what you want!)

conda create -n myenv1 python=2.7  # create empty env using specific python version

conda create -n myenv python django otherpackage  # create empty env with default python version
                                                  # and install packages `django` and `otherpackage`


## remove environment
conda remove -n myenv1 --all
```

# Windows tips

**TL;DR (brute force solution to most problems):** Just use CMD (`cmd.exe`, the old DOS-era-style shell...) with its default Windows GUI instead of fancier and more modern alternatives, and instead of "proper" conda environment switching just close shell window and open a new one. This is annoying but will let you avoid many weird bugs if really in a hurry...

Generally after `source deactivate` on Bash on Windows, Bash is left in a messed up state, with `conda` not in the path. Simplest solution is to restart shell...

If you come across lots of funny issues with Conda + Python 2.x on Windows (encoding WTFs etc.), switch to using **CMD**, it works much better with this combo than PowerShell or Bash. Also, being stuck in CMD-land, it's useful to remember the `start mycommand ...` and `start /B mycommand ...` tricks for starting background jobs just like you do with `&` suffix in Bash (the `/B` version is if you don't want the extra console window for seeing output or stopping the task).