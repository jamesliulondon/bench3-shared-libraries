#!/bin/bash

GITLAB_INITIAL_ROOT_PASSWD="password5"
#echo "u = User.where(id:1).first ; u.password = '''$PASSWORD''' ; u.password_confirmation = '''$PASSWORD''' ; u.save!" | gitlab-rails console
#echo "u = User.where(id:1).first ; u.password = '"$PASSWORD"' ; u.password_confirmation = '"$PASSWORD"' ; u.save!"
DEFAULT_REPO="bench1-shared-libraries"

MYUSER=jamesliulondon
MYPASSWORD=password



REPO=$DEFAULT_REPO
HOST=office-localdomain:18080

#sed -i"" "batch-install-jenkins-plugins.sh#\# gitlab_rails\['initial_root_password.*#gitlab_rails\['initial_root_password'\] = \""${GITLAB_INITIAL_ROOT_PASSWD}"\"#g" /etc/gitlab/gitlab.rb
#gitlab-ctl reconfigure
#echo "u = User.where(id:1).first ; u.password = '"$GITLAB_INITIAL_ROOT_PASSWD"' ; u.password_confirmation = '"$GITLAB_INITIAL_ROOT_PASSWD"' ; u.reset_password = false ; u.save!" |  gitlab-rails console

echo 'u = User.create(); u.name = "jamesliulondon" ; u.username = "jamesliulondon"; u.password = "password"; u.confirmed_at = "01/01/1961"; u.admin = true; u.email = "james1@example.com"; u.save!; token = u.personal_access_tokens.create(scopes: [:api,:read_user,:read_api,:read_repository,:write_repository,:sudo], name: "Automation token"); token.set_token("8CQ5sF3CWM5-74hvGDp5"); token.save!;' | gitlab-rails console
sleep 1
curl --header "PRIVATE-TOKEN: 8CQ5sF3CWM5-74hvGDp5" --data-urlencode 'visibility=public' -X POST "http://office-localdomain.local/api/v4/projects?name=bench1-shared-libraries"
