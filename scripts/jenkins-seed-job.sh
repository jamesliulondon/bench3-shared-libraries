TOKEN="8CQ5sF3CWM5-74hvGDp5" PREFIX="ssh_url_to_repo" \
curl --header "PRIVATE-TOKEN: $TOKEN" \
http://office-localdomain.local:18080/api/v4/projects 2>/dev/null | \
grep -o "\"$PREFIX\":[^ ,]\+" | \
xargs -L1 basename | awk -F '.' '{print $1}'