#!/bin/bash


if [[ $OSTYPE == "darwin"* ]]; then
  export GITLAB_HOME=/var/gitlab
else
  export GITLAB_HOME=/srv/gitlab
fi

BASEDIR=`pwd`
echo $BASEDIR



if
 docker run --detach \
  --hostname ${HOSTNAME}.local \
  --publish 18443:443 --publish 18080:80 --publish 18022:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:$BASEDIR/scripts/gitlab/config \
  --volume $GITLAB_HOME/logs:$BASEDIR/scripts/gitlab/logs \
  --volume $GITLAB_HOME/data:$BASEDIR/scripts/gitlab/data \
  gitlab/gitlab-ee:latest || echo "bailed"
then
  echo "could not create new container";
  exit 0
fi
