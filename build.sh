#!/usr/bin/env bash

if [ ! -f ~/.docker/config.json ]; then
    echo "You don't seem logged-in to the private Docker repo (~/.docker/config.json file not present). Please use 'docker login' command to login."
    exit 1
fi

versions=( "1.5" "2.2" "2.3" "2.4" )

for ver in "${versions[@]}"
do
   :
   echo "***** building image version ${ver}"
   ( cd $ver && docker build . -t "logstash-aws-elasticsearch:${ver}" )
done
