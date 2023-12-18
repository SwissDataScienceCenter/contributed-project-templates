# {{ name }}
{% if __project_description__ %}
{{ __project_description__ }}
{% endif %}
## Introduction

See [ODA Workflow Development Guide](https://odahub.io/docs/guide-development/) for details on how to make your workflow part of the MMODA live workflow ecosystem, and in particular [ODA Workflow Ontology Guide](https://odahub.io/docs/guide-ontology/) for suggestions on how to describe your workflow in common terms.

Two additional plugins are provided within the template:

* `renku-graph-vis`, to offer a visualization of the project's Knowledge Graph.
* `renku-aqs-annotation`, to intercept calls to astroquery functions and store them in the project's Knowledge Graph.

More info can be found in the [ODA Workflow Development Guide](https://odahub.io/docs/guide-development/).