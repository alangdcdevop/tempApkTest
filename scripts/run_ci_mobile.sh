#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
apkLocation="${DIR}/.."

apkPath="${DIR}/.."
deviceName="46394358534d3098" #samsung S9 de QE
testingEnv=""
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
  squad="${squad}-"
fi

mvn \
  -f ${DIR}/../pom.xml \
  -Dtesting.driver="android" \
  -Dtesting.apkName="app-${squad}release.apk" \
  -Dtesting.appiumLocation="http://0.0.0.0:4723" \
  -Dtesting.apkPath="${apkPath}" \
  -Dtesting.deviceName="${deviceName}" \
  -Dtesting.env="${testingEnv}" \
  -Dtesting.enviroment="${enviroment}" \
  -Dtesting.squad="${squad}" \
  -Dcucumber.options="${options}" \
  -Dproperties="android.properties" \
  clean verify

echo "app-${squad}release.apk"
echo "${enviroment}"

result=$?

kill ${appiumPID}

exit ${result}
