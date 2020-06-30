## Create PIP package

Based on https://python-packaging.readthedocs.io/en/latest/minimal.html .

### 1. Create setup.py file with contents like these

```python
from setuptools import setup

setup(
    name='nmlu',
    version='0.1',
    url='https://github.com/NeuronQ/nmlu',
    author='Andrei Anton',
    author_email='io@neuronq.ro',
    license='MIT',
    packages=['nmlu'],
    zip_safe=False,
    description='nANO Machine Learning utilities toolkit',
    long_description='nMLU is a set of ultra-lightweight utility functions for miscellaneous data-science and machine-learning work'
)
```

### 2. Use sdist command to create uploadable archive

```sh
python setup.py sdist
```

### 3. Use twine to upload it to PyPI
You need a PyPI account with verified email and **twine** installed (`pip install twine`).

```sh
twine upload dist/*
```

### 4. Later follow a real guid to transform into a proper package

https://the-hitchhikers-guide-to-packaging.readthedocs.io/en/latest/creation.html