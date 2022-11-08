# {{ name }}
{% if __project_description__ %}
{{ __project_description__ }}
{% endif %}

{% if archive_url %}
This project comes with a Jupyter notebook for importing and exploring an [AiiDA archive]({{ archive_url }}).
{% endif %}

### Introduction

This project comes with a pre-configured AiiDA environment:

 1. Start a new environment (e.g. 1 CPU, 2GB memory)
 2. Open the terminal and type
 ```
    $ verdi status
     ✔ config dir:  /work/{{ __sanitized_project_name__ }}/repo/.aiida
     ✔ profile:     On profile default
     ✔ repository:  /work/{{ __sanitized_project_name__ }}/repo/.aiida/repository/default
     ✔ postgres:    Connected as aiidauser@localhost:5432
     ✔ rabbitmq:    Connected as amqp://guest:guest@127.0.0.1:5672?heartbeat=600
     ⏺ daemon:      The daemon is not running
 ```
 3. Open the Jupyter notebook in the `notebooks/` folder or see below for how to get started with AiiDA.

### Learning about AiiDA

 * [Introductory AiiDA tutorial](https://aiida.readthedocs.io/projects/aiida-core/en/latest/intro/tutorial.html), part of the [AiiDA documentation](https://aiida.readthedocs.io).
 * A [collection of historic AiiDA tutorials](https://aiida-tutorials.readthedocs.io/en/latest/).
 * The [AiiDA web site](http://www.aiida.net)
