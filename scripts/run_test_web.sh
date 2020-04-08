#!/usr/bin/env bash

cucumberTags=""

while getopts T: opts; do
  case ${opts} in
  T) cucumberTags=${OPTARG} ;;
  esac
done

# to run just particular acceptance tests.
read -ra tags <<<"${cucumberTags}"
for i in "${!tags[@]}"; do
  tags[$i]="--tags ${tags[i]}"
done
opts="${tags[@]}"

mvn \
  -Dtesting.layer="WEB" \
  -Dcucumber.options="${opts}" \
  clean verify
