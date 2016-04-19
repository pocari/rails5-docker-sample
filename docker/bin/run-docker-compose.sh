#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

export DB_DOCKERFILE_DIR=${SCRIPT_DIR}/../db
export WEB_DOCKERFILE_DIR=${SCRIPT_DIR}/../web
export WEB_APP_ROOT_DIR=${SCRIPT_DIR}/../../app

export MYSQL_DATABASE=mydb
export MYSQL_USER=dbuser
export MYSQL_PASSWORD=dbuser_pass
export MYSQL_ROOT_PASSWORD=root

YML_FILE=$SCRIPT_DIR/docker-compose.yml

docker-compose -f $YML_FILE $*
