#!/bin/bash

# Create aiida_config.yaml configuration file for activate-aiida

# Parse first/last name from GIT_AUTHOR_NAME
# See https://stackoverflow.com/a/17841619/1069467
function join_by { local d=$1; shift; local f=$1; shift; printf %s "$f" "${@/#/$d}"; }
user=($GIT_AUTHOR_NAME)
first_name=${user[0]}
last_name=`join_by ' ' "${user[@]:1}"`

project_dir=`pwd`

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
email: "$EMAIL"
first_name: "$first_name"
last_name: "$last_name"
institution: Renkulab

non_interactive: true
EOF

# Add AIIDA_PATH environment variable 
profile_file=~/.bashrc
if ! grep -q 'AIIDA_PATH' "${profile_file}" ; then
  echo "export AIIDA_PATH=\"${project_dir}/repo\"" >> "${profile_file}"
fi

## Enable AiiDA line magic
#ipython_startup_dir=$HOME/.ipython/profile_default/startup/
#mkdir -p $ipython_startup_dir


# create database, don't start daemon
reentry scan
source aiida-activate aiida_config.yaml -c

## download and import archive if specified
#archive_url="{{ archive_url }}"
#if [ ! -z "$archive_url" ]; then
#    verdi import --non-interactive $archive_url
#fi
