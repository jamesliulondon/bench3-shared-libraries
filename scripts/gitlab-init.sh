#!/bin/bash


docker cp scripts/gitlab/init/init-admin.sh gitlab:/tmp
docker exec -dt gitlab bash /tmp/init-admin.sh

docker network connect benchnet jenkins

