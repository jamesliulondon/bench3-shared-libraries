#!/bin/bash



cd /var/jenkins_home

BASEDIR=`dirname $0`

if [ -r $BASEDIR/plugins.txt ]; then
  cat $BASEDIR/plugins.txt | while read line;
  do
    $BASEDIR/batch-install-jenkins-plugins.sh $line
  done
fi