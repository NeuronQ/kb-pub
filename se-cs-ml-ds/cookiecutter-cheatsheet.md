# Cookiecutter cheatsheet

[Cookiecutter](https://github.com/audreyr/cookiecutter) is **awesome** for simple starter project templates, insanely simple compared to things like [Yeoman](http://yeoman.io/) and works well with any stack. Problem is, if you try to actually create a *realistic* cookicutter template from scratch, its docs are *impossible to comprehend by any sane human being without smashing your head into a wall until you create wonderful abstract art from your own brains...* the examples are too simple to be useful, and the "advanced" features are incomprehensibly explained.

## What it does

Example:

```
barebones-django-sk/  [in parent of this dir:$ cookiecutter barebones-django-sk]
    hooks/                                -------> 
        post_gen_project.sh                  |
    {{cookiecutter.project_slug}}/           |  my_awesome_project/
        src/                                 |      src/
            {{cookiecutter.core_app_slug}}/  |          awesome_core_app/
            static/                          |          static/
            ...                              |          ...
        whatever.txt                         |      whatever.txt
        ...                                  |      ... 
    cookiecutter.json                        |
```

Ideas:
* `{{cookiecutter.project_slug}}/` - the templated dir, this becomes your starter app, and **all** text files in it are treated as Jinja2 templates and have `{{cookiecutter.[...]}}` vars replaced in them (read below to see how to **exclude** files and dirs from being processed as templates, and how to **handle as templates files that are themselves Jinjs/Django templates**)
* `cookiecutter.json` - **configs** (including what to copy without template processing: `"_copy_without_render": [ ... ]"`), and **variables** (and their defaults) are defined here
* `hooks/post_gen_project.sh` - pre/post install hooks are defined in `hooks/` (can be Python or bash... [read the docs on this](http://cookiecutter.readthedocs.io/en/latest/advanced/hooks.html))

## Install

`pip install [--user] cookiecutter`

## Config

Example `cookiecutter.json`:

```
{
  "project_name": "BDSK",
  "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_').replace('-', '_') }}",
  "core_app_slug": "coreapp",
  "core_app_camel_slug": "{{ cookiecutter.core_app_slug.split('_')|map('capitalize')|join }}",
  "_copy_without_render": [
      "src/static",
      "src/static_src",
      "src/static_web_root",
      "*/node_modules"
  ]
}
```

## Handling files that are themselves Jinja/Django templates

**Option 1 - if no substitution needs to be done on these files:** just add them (or their dir) to `_copy_without_render` array.

**Option 2 - if you need to substitute cookiecutter vars inside them:**

1. Wrap entiner file in `{% raw %}` at the file beginning and `{% endraw %}` at file end
2. Write replaceable expressions like `{{cookiecutter.core_app_slug}}` instead as `{% endraw %}{{cookiecutter.core_app_slug}}{% raw %}`
