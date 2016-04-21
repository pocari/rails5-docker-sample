#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

export DB_DOCKERFILE_DIR=${SCRIPT_DIR}/../db
export WEB_DOCKERFILE_DIR=${SCRIPT_DIR}/../web
export WEB_APP_ROOT_DIR=${SCRIPT_DIR}/../../app

export MYSQL_DATABASE=mydb
export MYSQL_USER=dbuser
export MYSQL_PASSWORD=dbuser_pass
export MYSQL_ROOT_PASSWORD=root

export START_RAILS_COMMAND="bundle install --path=vendor/bundle && rm tmp/pids/server.pid;"

# debugモードに切り替える設定
if [ "$DEBUG_MODE" = "1" ] ; then
  # debug mode
  START_RAILS_COMMAND="${START_RAILS_COMMAND} bundle exec rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- bin/rails s -b 0.0.0.0"
else
  # normal mode
  START_RAILS_COMMAND="${START_RAILS_COMMAND} bin/rails s -b 0.0.0.0"
fi
YML_FILE=$SCRIPT_DIR/docker-compose.yml

docker-compose -f $YML_FILE $*

