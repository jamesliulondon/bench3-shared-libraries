#!/bin/bash



docker exec -dt jenkins /var/jenkins_home/init.groovy.d/batch-install-jenkins-plugins.sh
docker cp scripts/jenkins/init.groovy.d/org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml jenkins:/var/jenkins_home/org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml

docker network connect benchnet jenkins || echo "failed to create new network"