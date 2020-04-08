#!/usr/bin/env bash

#$ANDROID_HOME/emulator/emulator -avd Nexus

apkPath=""
deviceName=""
cucumberTags=""
mockServices=""

while getopts p:d:T:e: opts; do
  case ${opts} in
  p) apkPath=${OPTARG} ;;
  d) deviceName=${OPTARG} ;;
  T) cucumberTags=${OPTARG} ;;
  e) enviroment=${OPTARG} ;;
  esac
done

# Just in local enviroment appium is started, in remote env appium should be running in that enviroment
appium --log-level error -p 4723 &
appiumPID=$!

# Wiremock is started in localhost:8080
# java -jar wiremock-standalone-2.24.1.jar --port 8080 --use-chunked-encoding never &
#  wiremockPID=$!
#wiremockPID=$!

read -ra tags <<<"${cucumberTags}"
for i in "${!tags[@]}"; do
  tags[$i]="--tags ${tags[i]}"
done
opts="${tags[@]} --tags 'not @manual'"

mvn \
  -Dtesting.driver="android" \
  -Dtesting.apkName="app-green-release.apk" \
  -Dtesting.wiremockHost="localhost" \
  -Dtesting.wiremockPort="8080" \
  -Dtesting.apkPath="${apkPath}" \
  -Dtesting.enviroment="${enviroment}" \
  -Dappium.deviceName="${deviceName}" \
  -Dcucumber.options="${opts}" \
  -Dproperties="android.properties" \
  clean verify

kill ${appiumPID}
#kill ${wiremockPID}
