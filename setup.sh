#!/bin/bash

function clone {
    if [ -d "infrastructure" ]; then
        if [ ! -d "frontend" ]; then
            git clone git@github.com:siges-codebase/frontend.git
        fi
        if [ ! -d "repository" ]; then
            git clone git@github.com:siges-codebase/repository.git
        fi
        if [ ! -d "db" ]; then
            mkdir db
        fi
    else
        cd ..
        clone
    fi
}

function build {
    export DB_USER="sigesadmin"
    export DB_PASSWORD="S1g3s"
    export DB_NAME="sigesdb"
    docker-compose build
}

clone
cd infrastructure
build

source start.sh