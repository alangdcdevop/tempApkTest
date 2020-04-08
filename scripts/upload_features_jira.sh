#!/usr/bin/env bash

projectkey="BDSD"
repositorypath=""

while getopts p:d:T:e:s: opts; do
  case ${opts} in
  p) repositorypath=${OPTARG} ;;
  esac
done

echo "Busca .features en bds-app-acceptance-tests repositorio local bds-app-acceptance-tests-mobile"

echo "Create XRAY Token"
curlauth=$(curl -H "Content-Type: application/json" -X POST \
  --data '{"client_id": "4947228E97C141D2828F967480A23781","client_secret": "8e50a30c1d7aefdbfb0eafdeeb86c64c8c3bb38c10e88da6259ae1be49bea43d"}' \
  --url "https://xray.cloud.xpand-it.com/api/v1/authenticate")
echo "Cut '' from response"
token=$(echo "$curlauth" | cut -d '"' -f 2)
cont=0
cont2=0

echo "Get list of .feature file to import to jira"
find $repositorypath -name *.feature | while read -r line; do
  f="${line##*/}"
  echo "***********Subiendo Feature $f ******************"
  curlupload=$(curl -X POST \
    -H "Authorization: Bearer ${token}" \
    -F file=@"$line" \
    --url https://xray.cloud.xpand-it.com/api/v1/import/feature?projectKey=${projectkey})
  result=$(echo ${curlupload:1:12})
  echo "$result"
  if [[ ${result} == "\"errors\":[]," ]]; then
    echo "$curlupload"
    echo "*********** Upload Success ***********"
    cont=$((cont + 1))

  else
    echo "*********** Upload Fail ***********"
    cont2=$((cont2 + 1))
  fi
  echo "Cantidad de features subidos con éxito $cont"
  echo "Cantidad de features con errores $cont2"
done
