#!/bin/bash

export GITLAB_HOME=/srv/gitlab
BASEDIR=`pwd`
echo $BASEDIR



ROOT=`dirname $0`
docker volume  inspect init.groovy.d >/dev/null
EC=$?
if [[ $EC -eq 0 ]]; then
    echo "init_volume exists"
else
    echo "creating init.groovy.d"
    docker volume create  init.groovy.d
fi

docker inspect jenkins >/dev/null
EC=$?
if [[ $EC -ne 0 ]]; then
    docker pull jenkins/jenkins
    docker pull library/alpine

    docker rm -f copier
    docker run  -dt -v init.groovy.d:/temp --name copier library/alpine
    docker cp $ROOT/jenkins/init.groovy.d/. copier:/temp/
    docker rm -f copier

    docker image rm jenkins_unsecured
    docker build -f $ROOT/jenkins/Dockerfile.unsecured -t jenkins_unsecured .
    #docker run --name jenkins -v init.groovy.d:/var/jenkins_home/init.groovy.d,rw -p 28080:8080 jenkins/jenkins
    docker run -dt --name jenkins -v init.groovy.d:/var/jenkins_home/init.groovy.d:rw -p 28080:8080 jenkins_unsecured
    sleep 1
    docker exec -dt jenkins bash /var/jenkins_home/init.groovy.d/process_plugins.sh
else
  echo "jenkins exists"
fi