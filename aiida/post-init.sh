#!/bin/bash

# Create aiida_config.yaml configuration file for activate-aiida

# Parse first/last name from GIT_AUTHOR_NAME
# See https://stackoverflow.com/a/17841619/1069467
function join_by { local d=$1; shift; local f=$1; shift; printf %s "$f" "${@/#/$d}"; }
user="$(git config user.name)"
first_name=${user[0]}
last_name=$(join_by ' ' "${user[@]:1}")
email="$(git config user.email)"

project_dir=$(pwd)

cat > aiida_config.yaml <<EOF
store_path: "${project_dir}/repo"

su_db_username: aiidauser
# su_db_password:  # not yet supported

db_engine: postgresql_psycopg2
db_backend: django

db_host: localhost
db_port: 5432
db_name: aiida
db_username: aiidauser
db_password: verdi

profile: "default"
email: "$email"
first_name: "$first_name"
last_name: "$last_name"
institution: Renkulab

non_interactive: true
EOF

# Add AIIDA_PATH environment variable
export AIIDA_PATH="${project_dir}/repo"

# todo: Enable AiiDA line magic
#ipython_startup_dir=$HOME/.ipython/profile_default/startup/
#mkdir -p $ipython_startup_dir

# create database, don't start daemon
reentry scan
source aiida-activate aiida_config.yaml -c