#!/usr/bin/env bash

apkPath=""
deviceName=""
cucumberTags=""

while getopts p:d:T:e:s: opts; do
  case ${opts} in
  p) apkPath=${OPTARG} ;;
  d) deviceName=${OPTARG} ;;
  T) cucumberTags=${OPTARG} ;;
  e) enviroment=${OPTARG} ;;
  s) squad=${OPTARG} ;;
  esac
done

# Just in local enviroment appium is started, in remote env appium should be running in that enviroment
appium --log-level error -p 4723 &
appiumPID=$!

# Wiremock is started in localhost:8765
#java -jar wiremock-standalone-2.24.1.jar --port 8080 --use-chunked-encoding never &
#wiremockPID=$!

# to run just particular acceptance tests.
read -ra tags <<<"${cucumberTags}"
for i in "${!tags[@]}"; do
  tags[$i]="--tags ${tags[i]}"

done
opts="${tags[@]} --tags 'not @manual'"

if [${enviroment} = ""]; then
  enviroment="dev"
fi

if [${squad} = ""]; then
  squad="${squad}"
else
  squad="${squad}_"
fi

mvn \
  -Dtesting.driver="ios" \
  -Dtesting.apkName="ar.com.bdsol.bds.squads.${squad}ad-hoc.ipa" \
  -Dtesting.appiumLocation="http://0.0.0.0:4723" \
  -Dtesting.wiremockHost="localhost" \
  -Dtesting.wiremockPort="8080" \
  -Dtesting.apkPath="${apkPath}" \
  -Dtesting.enviroment="${enviroment}" \
  -Dtesting.squad="${squad}" \
  -Dappium.deviceName="${deviceName}" \
  -Dcucumber.options="${opts}" \
  -Dproperties="ios.properties" \
  clean verify

kill ${appiumPID}
#kill ${wiremockPID}
