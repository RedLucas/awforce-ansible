

API_KEY=`(drush @hostmaster ctev services_endpoint hosts && echo "echo \$endpoint->authentication['services_api_key_auth']['api_key'];")|sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"|php -a|sed '3q;d'`
OAUTH_KEY=`drush @hostmaster hnn-default key`
OAUTH_SECRET=`drush @hostmaster hnn-default secret`

OUTPUT+=$'    "type": "hostmaster_saas",\n'
OUTPUT+=$'    "hostmaster_saas": {\n'
OUTPUT+=$'      "port":"0",\n'
OUTPUT+=$'      "oauth_key":"'$OAUTH_KEY$'",\n'
OUTPUT+=$'      "oauth_secret":"'$OAUTH_SECRET$'",\n'
OUTPUT+=$'      "saas_api_key":"'$API_KEY$'"\n'
OUTPUT+=$'    }'
printf "%s" "$OUTPUT"
