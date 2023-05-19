#!/bin/bash

if [[ -f "manage.py" ]]
then
    python manage.py runserver
    exit
fi
if [[ -f "yarn.lock" ]]
then
    yarn dev
    exit
fi
echo "Not sure what to start"
