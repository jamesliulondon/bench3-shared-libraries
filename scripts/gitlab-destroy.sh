#!/bin/bash

export GITLAB_HOME=/srv/gitlab
BASEDIR=`pwd`
echo $BASEDIR


docker rm -f gitlab