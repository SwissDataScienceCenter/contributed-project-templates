#!/bin/bash

export HOME_OVERRRIDE=/tmp/jovyan; 

mkdir $HOME_OVERRRIDE; 

cd /tmp/jovyan; 

source /init.sh; 

# Override the jupyter command to be forward compatible with newer
# images that no longer launch the whole server with `jupyter notebook`.
jupyter() { 
    if [ "$1" = "notebook" ]; 
    then 
        shift  
        $(which jupyter) server $@; 
    else $(which jupyter) $@; 
    fi; 
}

# run the command
$@