#!/bin/bash

# Set some variables
read -ra name_array <<< "$(git config user.name | tr -d "'")"
first_name="${name_array[0]}"
last_name="${name_array[@]:1}"
last_name="${last_name// / }"
email="$(git config user.email)"
aiida_profile="aiida_renku"
institution="AiiDA-RenkuLab"

project_dir="$(pwd)"
repo_dir="${project_dir}/aiida_data"
mkdir "$repo_dir"

# Export AIIDA_PATH environment variable
export AIIDA_PATH=$repo_dir

{% if archive_url %}

archive_url="{{ archive_url }}"
archive_name="${archive_url#*filename=}"
archive_path="${repo_dir}/${archive_name}"

wget -O "$archive_path" "$archive_url"

# With archive_url, generate profile using `core.sqlite_zip` backend
verdi profile show $aiida_profile 2> /dev/null || verdi profile setup core.sqlite_zip \
    --profile $aiida_profile \
    --first-name "$first_name" \
    --last-name "$last_name" \
    --email "$email" \
    --institution RenkuLab \
    --set-as-default \
    --non-interactive \
    --filepath "$archive_path"

{% else %}

# Without archive_url, generate profile using `core.sqlite_dos` backend
verdi profile show $aiida_profile 2> /dev/null || verdi profile setup core.sqlite_dos \
    --profile $aiida_profile \
    --first-name "$first_name" \
    --last-name "$last_name" \
    --email "$email" \
    --institution RenkuLab \
    --set-as-default \
    --non-interactive

{% endif %}

verdi config set warnings.rabbitmq_version False
rabbitmq-server -detached
