#!/bin/bash

function clone {
    if [ -d "infrastructure" ]; then
        if [ ! -d "frontend" ]; then
            git clone git@github.com:siges-codebase/frontend.git
        fi
        if [ ! -d "repository" ]; then
            git clone git@github.com:siges-codebase/repository.git
        fi
    else
        cd ..
        clone
    fi
}

function compose {
    docker-compose -f infrastructure/docker-compose.yml up --build
}

clone
compose
