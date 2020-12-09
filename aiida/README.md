# {{ name }}
{% if description %}
{{ description }}
{% endif %}

### Introduction

This project comes with a pre-installed AiiDA environment. In order to get started:

 1. Start a new environment (e.g. 1 CPU, 2GB memory)
 1. (optional) inspect the `aiida_config.yaml` in case you would like to make any changes
 1. Open the terminal and type
    ```
    source aiida-activate -c -w 1
    ```

You should see a status similar to
```
- Finishing Status:
 ✔ config dir:  /work/{{ name }}/repo/.aiida
 ✔ profile:     On profile {{ name }}
 ✔ repository:  /work/{{ name }}/repo/.aiida/repository/{{ name }}
/opt/conda/lib/python3.7/site-packages/tzlocal/unix.py:158: UserWarning: Can not find any timezone configuration, defaulting to UTC.
  warnings.warn('Can not find any timezone configuration, defaulting to UTC.')
 ✔ postgres:    Connected as chrisjsewell@localhost:5432
 ✔ rabbitmq:    Connected as amqp://guest:guest@127.0.0.1:5672?heartbeat=600
 ✔ daemon:      Daemon is running as PID 30575 since 2020-11-18 11:15:30
 ```

### Learning about AiiDA

Pick one of many resources:

 * The introductory [AiiDA tutorial](https://aiida.readthedocs.io/projects/aiida-core/en/latest/intro/tutorial.html), part of the [AiiDA documentation](https://aiida.readthedocs.io).
 * A [collection of historic AiiDA tutorials](https://aiida-tutorials.readthedocs.io/en/latest/).
 * The [AiiDA web site](http://www.aiida.net)
