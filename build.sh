#!/bin/bash
docker build -t alpineangular .
docker kill shaun
docker rm shaun
docker run --name shaun -d -p 8080:80 alpineangular
