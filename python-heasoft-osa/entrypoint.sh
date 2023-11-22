#!/bin/bash

export HOME_OVERRRIDE=/tmp/jovyan; 

mkdir $HOME_OVERRRIDE; 

cd /tmp/jovyan; 

source /init.sh; 

# run the command
$@