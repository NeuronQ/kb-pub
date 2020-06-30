# Auto-reload

## In IPython / Jupyter run:

```python
%reload_ext autoread
%autoreload 2
```

## ...or better configure globally:

(optionally) Create IPython profile if not already existing:

```sh
ipython profile create
```

Then add these to profile:

```python
c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['%autoreload 2']
c.InteractiveShellApp.exec_lines.append('print("Warning: disable autoreload in ipython_config.py to improve performance.")')
```
