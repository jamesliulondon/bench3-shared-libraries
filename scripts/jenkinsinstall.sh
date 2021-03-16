
ROOT=`dirname $0`
docker volume create --label init.groovy.d init.groovy.d
docker pull jenkins/jenkins
docker pull library/alpine
docker rm -f copier
docker run  -dt -v init.groovy.d:/temp --name copier library/alpine
docker cp $ROOT/jenkins/init.groovy.d/. copier:/temp/
docker rm -f copier
docker stop jenkins
docker run --name jenkins -v init.groovy.d:/var/jenkins_home/init.groovy.d -p 18080:8080 jenkins/jenkins
