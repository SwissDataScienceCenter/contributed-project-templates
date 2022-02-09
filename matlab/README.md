# {{ name }}
{% if __project_description__ %}
{{ __project_description__ }}
{% endif %}
## Introduction

This is a Renku project with MATLAB R2021b installed. You'll find we have already created some
useful things like `data` and `notebooks` directories and
a `Dockerfile`.

## Working with the project

When starting up the project you will be taken to the virtual desktop,
where the MATLAB Desktop icon should be visible. Double click that and you will be
asked to enter your license credentials. Once that is done, double click it again
and your MATLAB client will open. You may need to navigate to your project's directory,
which is usually `/home/jovyan/work/${Your Project Name}`. If you want to use JupyterLab alongside your desktop
view, click the "Open in new tab" button and then change the end-point from `/vnc`
to `/lab`. You can have both tabs with different end-points open at the same time.

To work with the project anywhere outside the Renku platform,
click the `Settings` tab where you will find the
git repo URLs - use `git` to clone the project on whichever machine you want.

### Changing interactive session dependencies

Initially we install a very minimal set of packages to keep the images small.
However, you can add Python and conda packages in `requirements.txt` and
`environment.yml` to your heart's content. If you need more fine-grained
control over your environments, please see [the documentation](https://renku.readthedocs.io/en/latest/how-to-guides/session-customizing.html).

## Project configuration

Project options can be found in `.renku/renku.ini`. In this
project there is currently only one option, which specifies
the default type of end-point to open, in this case `/vnc` for
the virtual desktop. You can use the user interface on Renku
to change the defaults of computational resources too.

## Moving forward

Once you feel at home with your project, we recommend that you replace
this README file with your own project documentation!