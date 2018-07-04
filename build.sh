#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  errorMessage="Build requires a sitename, port and mount as follows: ./build.sh sitename 8080 directory"
  echo $errorMessage
else
  echo "Building site $1"
  docker kill $1
  docker rm $1
  rm -rf $3
  docker build -t alpineangular .
  docker run --name $1 -v $3:/root -p 8080:80 alpineangular
fi
