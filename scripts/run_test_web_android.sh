#!/usr/bin/env bash
apkPath=""
deviceName=""
cucumberTags=""
mockServices=""
while getopts p:d:T:e:s: opts; do
  case ${opts} in
  d) deviceName=${OPTARG} ;;
  T) cucumberTags=${OPTARG} ;;
  e) enviroment=${OPTARG} ;;
  s) squad=${OPTARG} ;;
  esac
done
# Just in local enviroment appium is started, in remote env appium should be running in that enviroment
appium --log-level error -p 4723 &
appiumPID=$!

# to run just particular acceptance tests.
read -ra tags <<<"${cucumberTags}"
for i in "${!tags[@]}"; do
  tags[$i]="--tags ${tags[i]}"
done
opts="${tags[@]}"

mvn \
  -Dtesting.driver="android-web" \
  -Dtesting.enviroment="${enviroment}" \
  -Dtesting.squad="${squad}" \
  -Dappium.deviceName="${deviceName}" \
  -Dcucumber.options="${opts}" \
  -Dproperties="androidWeb.properties" \
  clean verify

kill ${appiumPID}
