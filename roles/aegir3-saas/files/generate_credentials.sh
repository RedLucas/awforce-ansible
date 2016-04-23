

API_KEY=`drush @hostmaster vget --format=string --exact hosting_saas_api_key`
OAUTH_KEY=`drush @hostmaster hnn-default key`
OAUTH_SECRET=`drush @hostmaster hnn-default secret`

OUTPUT='"'$1'": {'$'\n'
OUTPUT+=$'  "type": "hostmaster_saas",\n'
OUTPUT+=$'  "hostmaster_saas": {\n'
OUTPUT+=$'    "port":"0",\n'
OUTPUT+=$'    "oauth_key":"'$OAUTH_KEY$'",\n'
OUTPUT+=$'    "oauth_secret":"'$OAUTH_SECRET$'",\n'
OUTPUT+=$'    "saas_api_key":"'$API_KEY$'",\n'
OUTPUT+=$'  }\n'
OUTPUT+=$'}  \n'
echo "$OUTPUT"
