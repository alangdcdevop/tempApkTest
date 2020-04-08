#!/usr/bin/env bash

apkPath=""
deviceName=""
cucumberTags=""
mockServices=""

while getopts p:d:T:e:s:n: opts; do
  case ${opts} in
  p) apkPath=${OPTARG} ;;
  d) deviceName=${OPTARG} ;;
  T) cucumberTags=${OPTARG} ;;
  e) enviroment=${OPTARG} ;;
  s) squad=${OPTARG} ;;
  n) name=${OPTARG} ;;
  esac
done

appium --log-level error -p 4723 &
appiumPID=$!

read -ra tags <<<"${cucumberTags}"
for i in "${!tags[@]}"; do
  tags[$i]="--tags ${tags[i]}"
done
opts="${tags[@]} --tags 'not @manual'"

if [${enviroment} = ""]; then
  enviroment="dev"
fi


# cambiar nombre de variable tipo switch case
if [${enviroment} = ""]; then
  enviroment="${enviroment}"
else
  enviroment="${enviroment}-"
fi

mvn \
  -Dtesting.driver="android" \
  -Dtesting.apkName="${name}.apk" \
  -Dtesting.apkPath="${apkPath}" \
  -Dtesting.enviroment="${enviroment}" \
  -Dtesting.squad="${squad}" \
  -Dappium.deviceName="${deviceName}" \
  -Dcucumber.options="${opts}" \
  -Dproperties="android.properties" \
  clean verify

kill ${appiumPID}
