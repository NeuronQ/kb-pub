## JupyterLab

Install: `pip install jupyterlab`

Install as jupyter kernel the current virtualenv python:
`python -m ipykernel install --user --name=`

Run: `jupyter lab`

### Fixes for 3.0

Add to ipython config (usually at `~/.ipython/profile_default/ipython_config.py`):

```
c.Completer.use_jedi = False
```

## Commonly useful extensions

```sh
pip install ipython-sql
```
