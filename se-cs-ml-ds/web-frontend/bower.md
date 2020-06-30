# Init

1. (optional) Create a `.bowerrc` file to to tell bower where to install its packages (default is `bower_packages`) and to **prevent it from mistaken using another `.bowerrc` from up the dirs chain,** and init it with smth like this:

```
{
    "directory" : "components"
}
```

2. `$ bower init` (make sure to answer _yes_ at the question asking you if it's private, or to add `"private": true` to the generated `bower.json`)

# Basic

`$ bower search <whatever...>`

Search online at: http://bower.io/search

`$ bower install --save <whatever...>`

**Note:** Don't forget the `--save` if you wan the dependencies saved in `bower.json` (hint: yes, **you do want this**)!

**Tip:** Install the components with most dependencies first (eg. do `$ bower install bootstrap` before `$ bower install jquery` ...because this way you're proably not even have to type the latter).

# Help

`$ bower help`

`$ bower help <whatever...>`

[link](../test.org)

- [ ] test
