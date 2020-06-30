# Intro to using UNIX screen

## Basics

`screen -list` / `screen -ls` - list current screen sessions

`screen -S myscreen1` - create a new session named *myscreen1*

`screen -r myscreen1` - resume an existing detached screen session

`screen -D -r myscreen1` - resume an existing screen session, even if was left attaches (say by a dropped connection...)

`screen -R "my screen 1"` - resume or create a session named *my screen 1*

`screen -X -S <session #> quit` - destroy session

`C-a d` - detach from current screen session

## Window Managing

`C-a "` - list menu of all windows (use number key then <kbd>Enter</kbd> to select one)

`C-a 0` - switch to window 0

`C-a '` + *`part or all of window name`* + <kbd>Enter</kbd> - switch to window by name

`C-a c` - create a new window

`C-a A` - give a name to current window

`C-a k` - kill current window (and detach session if this was the last one left)

## Shared Sessions

`screen -S myshared1` - create a session named myshared1

...login from another terminal...

`screen -x -r myshared1` - connect to session myshared1

## Other shortcuts

`screen -S my1 -t one` - create a session named *ms1* with a windows named *one*

`screen -r my1 -p one` - resume session *my1* and go directly to window *one*

## Status Bar

**You SHOULD use something like this to keep track of the window you are in.**

Add to your `~/.screenrc` this black magic:

```
hardstatus on
hardstatus alwayslastline
hardstatus string "%{.bW}%-w%{.rW}%n %t%{-}%+w %=%{..G} %H %{..Y} %m/%d %C%a "
```

(from: http://www.ibm.com/developerworks/aix/library/au-gnu_screen/)

...or other suggested alternative:

```
startup_message off                     # default: on
defscrollback 4096                      # default: 100
shell -$SHELL
vbell off
crlf off                                # default: off
caption always "%{= kw} %H | %{kc}%?%-w%?%{kY}%n*%f %t%?(%u)%?%{= kc}%?%+w%? %=|%{kW} %l %{kw}| %{kc}%{-b}%D, %m/%d/%Y |%{kW}%{+b}%c:%s %{wk}"
termcapinfo xterm* 'hs:ts=\E]0;:fs=\007:ds=\E]0;\007'
defhstatus "screen ^E (^Et) | $USER@^EH"
hardstatus off
```

(from https://wiki.harvard.edu/confluence/display/USERDOCS/How+to+use+'screen'+for+remote+shell+sessions)

---

**References:**

http://www.ibm.com/developerworks/aix/library/au-gnu_screen/ - recommended

`man screen` - read this after the intro above (also at: http://www.gnu.org/software/screen/manual/screen.html)

https://wiki.harvard.edu/confluence/display/USERDOCS/How+to+use+'screen'+for+remote+shell+sessions - shorter and less explanations, but more to the point

