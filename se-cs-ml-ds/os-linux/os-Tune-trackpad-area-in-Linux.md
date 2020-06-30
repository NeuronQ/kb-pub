Example for HP Spectre x360 13-ae002nf to mostly emulate palm rejection.

## See current area

```
$ synclient
```

```
...
    LeftEdge                = 1605
    RightEdge               = 5337
    TopEdge                 = 1369
    BottomEdge              = 4487
...
    AreaLeftEdge            = 0
    AreaRightEdge           = 0
    AreaTopEdge             = 0
    AreaBottomEdge          = 0
```

```
$ less /var/log/Xorg.0.log | grep -i range
```

## Tune

```
synclient AreaTopEdge=1841  # -20%
synclient AreaBottomEdge=4380  # -10%
synclient AreaLeftEdge=1844  # -12.5%
synclient AreaRightEdge=5098  # -12.5%
```


## Have this run on startup

One way is to add commands to `/etc/rc.local`.

...and probable you also need this on `systemd` systems (most, nowadays):

```
sudo systemctl enable rc-local.service
sudo systemctl start rc-local.service
```