#!/bin/bash

# Parse first/last name from GIT_AUTHOR_NAME
# See https://stackoverflow.com/a/17841619/1069467
function join_by {
    local d=$1
    shift
    local f=$1
    shift
    printf %s "$f" "${@/#/$d}"
}

# Set some variables
user_string="$(git config user.name)"
user_array=($user_string)
first_name=${user_array[0]}
last_name=$(join_by ' ' "${user_array[@]:1}")
email="$(git config user.email)"
aiida_profile="aiida_renku"
institution="RenkuLab"

project_dir="$(pwd)"
repo_dir="${project_dir}/repo"
mkdir "$repo_dir"

# Export AIIDA_PATH environment variable
export AIIDA_PATH=$repo_dir

{% if archive_url %}

archive_url="{{ archive_url }}"
archive_name="${archive_url#*filename=}"
archive_path="${repo_dir}/${archive_name}"

wget -O "$archive_path" "$archive_url"

# With archive_url, generate profile using `core.sqlite_zip` backend
verdi profile setup core.sqlite_zip \
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
verdi profile setup core.sqlite_dos \
    --profile $aiida_profile \
    --first-name "$first_name" \
    --last-name "$last_name" \
    --email "$email" \
    --institution RenkuLab \
    --set-as-default \
    --non-interactive

{% endif %}

verdi config set warnings.rabbitmq_version False
echo "consumer_timeout = 36000000000" > /opt/conda/pkgs/rabbitmq-server-3.12.12-ha770c72_0/etc/rabbitmq/rabbitmq.conf
rabbitmq-server -detached
