#!/bin/bash

# Create aiida_config.yaml configuration file for activate-aiida

# Parse first/last name from GIT_AUTHOR_NAME
# See https://stackoverflow.com/a/17841619/1069467
function join_by { local d=$1; shift; local f=$1; shift; printf %s "$f" "${@/#/$d}"; }
user=($GIT_AUTHOR_NAME)
first_name=${user[0]}
last_name=`join_by ' ' "${user[@]:1}"`

cat > aiida_config.yaml <<EOF
store_path: /work/{{ name }}/repo

su_db_username: aiidauser
# su_db_password:  # not yet supported

db_engine: postgresql_psycopg2
db_backend: django

db_host: localhost
db_port: 5432
db_name: aiida
db_username: aiidauser
db_password: verdi

profile: "${CI_PROJECT}"
email: "$EMAIL"
first_name: "$first_name"
last_name: "$last_name"
institution: Renkulab

non_interactive: true
EOF


# Add AIIDA_PATH environment variable 
profile_file=~/.bashrc
if ! grep -q 'AIIDA_PATH' "${profile_file}" ; then
  echo "export AIIDA_PATH=\"/work/${CI_PROJECT}/repo\"" >> "${profile_file}"
fi

# create database, start daemon
source aiida-activate -c -w 1
