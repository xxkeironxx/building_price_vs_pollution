# Gets the authentication in base64
echo -n q8sje6jp88o3wy0pjpv4oebpx84v5sgk:QXG2agtppzOq | base64 | AUTH=

curl \
-X POST \
-H "Authorization: Basic $AUTH" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d 'grant_type=client_credentials&scope=read' \
"https://api.idealista.com/oauth/token" -k \
> ../data_idealista/token.json