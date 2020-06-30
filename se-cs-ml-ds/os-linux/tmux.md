# Tmux Chetsheet

**NOTE:** Tmux is client-server. When you start it by running simply `tmux`, it starts the server process if it's not already running, then it creates a new session for you and puts you in this new session.

### Starting

```sh
tmux                      # Start a new session named 0
tmux new -s my-session    # Start a named session
tmux a                    # Start by attaching to first session
tmux a -t mysession       # Start by attaching to a session
```

### Exiting

```sh
C-b d    # Exit by detaching from current session
         #   (but the session stays open)
```

### Sessions

```sh
tmux ls                              # List existing sessions
tmux list-sessions
tmux kill-session -t mysession       # Kill session
tmux rename-session -t 0 database    # Rename session
tmux new -s <session name>           # create new session  withname
```

```sh
C-b s               # List existing sessions
C-b :new            # Create new session
C-b :kill-session   # Kill current session
C-b $               # Rename current session
C-b d               # detach from current session
```

### Windows (tabs)

```sh
C-b <number>    # Switch to window #
C-b p           # Switch to prev window
C-b n           # Switch to next window
C-b c           # Create new window
C-b &           # Kill window

C-b .    # Move window
C-b ,    # Rename current window

C-b w               # List windows
C-b f               # Find window with text
C-b :joinp -s :2    # Move window 2 into a new pane in the current window
C-b :joinp -t :1    # Move the current pane into a new pane in window 1
```

### Panes (splits)

`C-b % # Split current pane into left/right panes`
`C-b " # Split current pane into top/bottom panes`
`C-b :split-window`

```sh
C-b <arrow_keys>     # Switch panel
C-a ;                # Go to the "last" (previously used) pane

C-d                  # Close panel (multiple ways to do it)
C-b x
C-b :exit
C-b z                # Minimize/maximize current pane (make it go full screen)
C-b C-<arrow_key>    # Resize pane in a particular direction

C-b <space>    # Toggle between layouts
C-b M-1        # Switch to even-horizontal layout
C-b M-2        # Switch to even-vertical layout
C-b M-3        # Switch to main-horizontal layout
C-b M-4        # Switch to main-vertical layout
C-b M-5        # Switch to tiled layout

C-b !          # Move the current pane into a new separate
               #   Window (‘break pane’)
C-b {          # Move the current pane to the previous position
C-b }          # Move the current pane to the next position

C-b C-<arror_keys>    # Resize pannel
```

Less used:

```sh
C-b q    # Show pane numbers
C-b o    # Go to the next pane (cycle through all of them)

C-b C-o                      # Rotate window ‘up’ (i.e. move all panes)
C-b M-o                      # Rotate window ‘down’
C-b :move-pane -t :3.2       # Split window 3's pane 2 and move the current pane there
C-b M-<arror_keys> resize    # By 5 rows/columns
```

### Copy-paste (inside tmux internal clipboard)

```sh
C-b [                   # Enter copy mode (Esc to exit this mode)
# <use arror keys move to start of selection>
C-space                 # To mark selection start
M-w                     # To copy from start to here
# <move to destination>
C-b ]                   # Paste
```

#### Copy paste using system clipboard

This is for Ubuntu, for MacOS you might need `Opt` instead of `Shift`.

- `Shift + mouse select` for lines selection (will ignore tmux panes!)
- OR `Ctrl + Shift + mouse select` for rectangular selection
- `Ctrl + Shift + C` to copy
- move somewhere else (might need to `Shift + click` to clear the selection)
- `Ctrl + Shift + V` to paster

**NOTE:** the above thing is not Tmux specific, it works with any "uncooperative" terminal app.

---

## Config file

Loaded by default on start: `~/.tmux.conf`

Things you could have in it:

```sh
# remap prefix to Control + a
#set -g prefix C-a
#unbind C-b
#bind C-a send-prefix

# unfuck terminal colors in Ubuntu
set -g default-terminal "screen-256color"

# mouse
set -g mouse on
setw -g mouse on

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf
```

---

### Tmuxinator

Mostly to manually save tmux sessions.

https://github.com/tmuxinator/tmuxinator

```sh
sudo apt-get install tmuxinator
```

**NOTE:** This assumes `$EDITOR` variable is set. If not, add `export EDITOR='vim'` (or whatever else you like) to `~/.bashrc` and `source ~/.bashrc` to apply change to current session too.

```sh
mux new <project-name> # create and start editing config
mux open <project-name> # edit config
mux start <project-name> [-n <session-name>] # start
```

**NOTES:**

- the project name becomes the tmux session name (the `-n <session-name>` option can prevent this when starting so as not to attach to an existing session - as explained below - but instead to make a new one with the given name, leaving the old one alone)
- if a session with this name already exists, it attaches to it instead (so kill the session before to apply your changes to its config)
