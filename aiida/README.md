# {{ name }}

{% if __project_description__ %}
{{ __project_description__ }}
{% endif %}

{% if archive_url %}
This project comes with a Jupyter notebook for importing and exploring an [AiiDA archive]({{ archive_url }}).
{% endif %}

## Introduction

This project comes with a pre-configured AiiDA environment:

1.  `⏵Start` a new session (e.g. `small`, the default) from the `Sessions` tab located in the top right of your Renku project
2.  If the project was created from a [Materials Cloud Archive](https://archive.materialscloud.org) or an `archive_url`
    was provided, it will be already imported in the `aiida_renku` default profile, and you can immediately start
    exploring it via the Jupyter Notebook that opens up (the raw file is located in the "repo" directory)
3.  To see the overall status of the `AiiDA` setup you can open a terminal via the `Launcher` and type `verdi status`. It should look something like this:

    ```shell
    ✔ version:     AiiDA v2.5.1
    ✔ config:      /home/jovyan/work/aiida-final-archive/repo/.aiida
    ✔ profile:     aiida_renku
    ✔ storage:     SqliteZip storage (read-only) [open] @ /home/jovyan/work/{{ name }}/repo/<archive_name>.aiida
    ✔ rabbitmq:    Connected to RabbitMQ v3.12.12 as amqp://guest:guest@127.0.0.1:5672?heartbeat=600
    ⏺ daemon:      The daemon is not running.
    ```

## Learning about AiiDA

Further resources about AiiDA can be found here

- [Introductory AiiDA tutorial](https://aiida.readthedocs.io/projects/aiida-core/en/latest/intro/tutorial.html), part of the [AiiDA documentation](https://aiida.readthedocs.io)
- A [collection of historic AiiDA tutorials](https://aiida-tutorials.readthedocs.io/en/latest/)
- The [AiiDA web site](http://www.aiida.net)
