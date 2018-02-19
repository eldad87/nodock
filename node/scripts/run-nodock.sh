#!/bin/bash

SCRIPT="$1"

export PROJECT_PATH=$PROJECT_PATH

su -c "cd $PROJECT_PATH; yarn" -s /bin/bash www-app

su -c "cd $PROJECT_PATH; $SCRIPT" -s /bin/bash www-app
