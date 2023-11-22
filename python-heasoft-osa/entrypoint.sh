#!/bin/bash

export HOME_OVERRRIDE=/tmp/jovyan; 

mkdir $HOME_OVERRRIDE; 

cd /tmp/jovyan; 

source /init.sh; 

jupyter lab --ip 0.0.0.0 --no-browser'